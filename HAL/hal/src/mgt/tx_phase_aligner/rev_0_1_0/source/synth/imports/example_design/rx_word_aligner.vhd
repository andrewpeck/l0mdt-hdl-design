--==============================================================================
--! @file rx_word_aligner.vhd
--==============================================================================
--! Standard library
library ieee;
--! Standard packages
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--! Specific packages

-------------------------------------------------------------------------------
-- --
-- CERN, EP-ESE-BE, HPTD
-- --
-------------------------------------------------------------------------------
--
-- unit name: Word aligner for HPTD tests (rx_word_aligner)
--
--! @brief FSM for word alignment used for HPTD tests
--! - Not recommended to be used for final applications but instead to use the corresponding protocol word aligner (i.e. TTC-PON, GBT-FPGA, LpGBT-FPGA)
--!
--! @author Eduardo Brandao de Souza Mendes - eduardo.brandao.de.souza.mendes@cern.ch
--! @date 22\05\2018
--! @version 1.0
--! @details
--!
--! <b>Dependencies:</b>\n
--! <Entity Name,...>
--!
--! <b>References:</b>\n
--! <reference one> \n
--! <reference two>
--!
--! <b>Modified by:</b>\n
--! Author: Eduardo Brandao de Souza Mendes
-------------------------------------------------------------------------------
--! \n\n<b>Last changes:</b>\n
--! 22\05\2018 - EBSM - Created\n
--! <extended description>
-------------------------------------------------------------------------------
--! @todo - \n
--! <another thing to do> \n
--
-------------------------------------------------------------------------------

--==============================================================================
--! Entity declaration for rx_word_aligner
--==============================================================================
entity rx_word_aligner is
    generic(
	    g_HDR_GOOD_TO_LOCK    : integer := 64; --! number of consecutive good headers to lock
	    g_HDR_BAD_TO_UNLOCK   : integer := 4;  --! number of consecutive bad headers to unlock
		g_DATA_WORD_WIDTH     : integer := 32; --! rx data word width
        g_SKIP_PULSE_DURATION : integer := 2;  --! duration of the skip pulse (for K7, it is one clock cycle, for KU it is 2)
        g_WAIT_BETWEEN_SKIP   : integer := 32  --! minimum number of clock cycles (rxusrclk2) to wait between rx_slide pulses
	);
    port (
		clk_rxusr_i       : in  std_logic;   --! rxusrclk2	
	    reset_i           : in  std_logic;   --! active high sync. reset
	    enable_i          : in  std_logic;   --! control scheduling
	    header_i          : in  std_logic;   --! input header 
        rx_locked_o       : out std_logic;   --! rx locked was achieved
        rx_slide_o        : out std_logic;    --! rx slide used for alignment

        clk_sys_i         : in  std_logic;   --! clock system input (free-running)
	    rx_reset_o        : out std_logic   --! reset transceiver to avoid odd bitslip number
	);
end rx_word_aligner;

--==============================================================================
-- architecture declaration
--==============================================================================

architecture rtl of rx_word_aligner is

  --! Function declaration
  function fcn_reduce_or(arg: std_logic_vector) return std_logic is
    variable result: std_logic;
    begin
      result := '0';
      for i in arg'range loop
          result := result or arg(i);
      end loop;
    return result;
  end;

 function fcn_log2( input:integer ) return integer is
  variable temp,log:integer;
  begin
   temp:=input;
   log:=0;
  while (temp /= 0) loop
   temp:=temp/2;
   log:=log+1;
   end loop;
   return log;
  end function fcn_log2;

  --! Constant declaration
  constant c_MAX_SKIP_WAIT : integer := g_SKIP_PULSE_DURATION+g_WAIT_BETWEEN_SKIP;

  --! Signal declaration

  -- FSM HDR-framing
  -- principle:
  -- HUNT            : received a correct HDR                                            -> GOING_SYNC
  --                   received a wrong HDR                                              -> SKIP CYCLE
  -- SKIP CYCLE      : slips a bit and then                                              -> SKIP_CYCLE_WAIT
  -- SKIP_CYCLE_WAIT : waits the slip to be finished and then                            -> HUNT
  -- GOING_SYNC      : received a consecutive number of correct HDR and bit slip is even -> SYNC
  --                   received a consecutive number of correct HDR and bit slip is odd  -> RESET_RX
  --                   received a wrong HDR                                              -> HUNT 
  -- RESET_RX        : basically waits forever (until the reset takes effect)
  -- SYNC            : received a wrong HDR                                              -> GOING_HUNT
  -- GOING_HUNT      : received a consecutive number of wrong HDR                        -> HUNT
  --                   received a correct HDR                                            -> SYNC
  type t_FRAMING_FSM_STATE is (HUNT, SKIP_CYCLE,  SKIP_CYCLE_WAIT, GOING_SYNC, SYNC, RESET_RX, GOING_HUNT);  
  signal framing_state : t_FRAMING_FSM_STATE;
    
  signal correct_hdr_count : integer range 0 to (g_HDR_GOOD_TO_LOCK + 1);
  signal wrong_hdr_count   : integer range 0 to (g_HDR_BAD_TO_UNLOCK + 1);

  signal skip_cycle_pipe   : std_logic_vector(g_SKIP_PULSE_DURATION-1 downto 0);
  signal skip_cycle_s      : std_logic;
  signal skip_cycle_cntr   : integer range 0 to g_DATA_WORD_WIDTH-1; 
  signal skip_wait_cntr    : integer range 0 to c_MAX_SKIP_WAIT;

  signal reset_rx_latch    : std_logic;
  signal reset_rx_sys_meta : std_logic;
  signal reset_rx_sys_r    : std_logic;  
  signal reset_rx_sys_r2   : std_logic;  
  signal reset_rx_pipe     : std_logic_vector(4 downto 0);

begin

  --============================================================================
  -- Process p_hdr_framing_fsm
  --! FSM for HDR-framing locking procedure
  --! read: enable_i, header_i, correct_hdr_count, wrong_hdr_count\n
  --! write: -\n
  --! r/w: framing_state \n
  --============================================================================  
  p_hdr_framing_fsm : process(clk_rxusr_i, reset_i) -- asynchronous
  begin
    if(reset_i = '1') then
        framing_state <= HUNT;
	elsif(clk_rxusr_i'event and clk_rxusr_i='1') then   
	    case framing_state is
		  when HUNT =>
		    if(enable_i='1') then
			  if(header_i='1') then
			    framing_state <= GOING_SYNC;
			  else
			    framing_state <= SKIP_CYCLE;
			  end if;
			end if;
			
		  when SKIP_CYCLE =>
			  framing_state <= SKIP_CYCLE_WAIT;
			
		  when SKIP_CYCLE_WAIT =>
		    if(skip_wait_cntr >= g_WAIT_BETWEEN_SKIP) then
			  framing_state <= HUNT;
			end if;

		  when GOING_SYNC =>
		    if(enable_i='1') then
			  if(correct_hdr_count >= g_HDR_GOOD_TO_LOCK) then
			    if( to_unsigned(skip_cycle_cntr,fcn_log2(g_DATA_WORD_WIDTH))(0) = '0' ) then
			      framing_state <= SYNC;
				else
				  framing_state <= RESET_RX;
				end if;
			  elsif(header_i='0') then
			    framing_state <= HUNT;
			  end if;
			end if;
			
		  when SYNC =>
		    if(enable_i='1') then
			  if(header_i='0') then
			    framing_state <= GOING_HUNT;
			  end if;
			end if;

          when RESET_RX =>
            framing_state <= RESET_RX;

		  when GOING_HUNT =>
		    if(enable_i='1') then
			  if(wrong_hdr_count >= g_HDR_BAD_TO_UNLOCK) then
			    framing_state <= HUNT;
			  elsif(header_i='1') then
			    framing_state <= SYNC;
			  end if;
			end if;	
			
		  when others => framing_state <= HUNT;
		end case;
	end if;  
  end process p_hdr_framing_fsm;

  --============================================================================
  -- Process p_hdr_framing_fsm_aux
  --! counters for consecutive correct/wrong HDR frame
  --! read: clk_i, reset_i, nibble_sent_i, framing_state\n
  --! write: - \n
  --! r/w: correct_hdr_count, wrong_hdr_count \n
  --============================================================================    
  p_hdr_framing_fsm_aux : process(clk_rxusr_i)
  begin
    if(clk_rxusr_i'event and clk_rxusr_i='1') then   
      if(reset_i='1') then
	    correct_hdr_count <= 0;
        wrong_hdr_count  <= 0;
	  elsif(enable_i='1') then
	    if(framing_state=GOING_HUNT) then
		  if(header_i='0') then
		    wrong_hdr_count <= wrong_hdr_count + 1;
		  end if;
		else
		  wrong_hdr_count <= 0;
		end if;
		
	    if(framing_state=GOING_SYNC) then
		  if(header_i='1') then
		    correct_hdr_count <= correct_hdr_count + 1;
		  end if;
		else
		  correct_hdr_count <= 0;
		end if; 		
	  end if;
	end if;
  end process p_hdr_framing_fsm_aux;  

  --============================================================================
  -- Process p_skip_cycle
  --! skip cycle related functions (counters, pulse generation)
  --! read: framing_state\n
  --! write: - \n
  --! r/w: skip_cycle_cntr, skip_wait_cntr, skip_cycle_pipe, skip_cycle_s \n
  --============================================================================  
  p_skip_cycle : process(clk_rxusr_i)
  begin
    if(clk_rxusr_i'event and clk_rxusr_i='1') then
	  -- skip_cycle (rx_slide) generation
	  if(framing_state = SKIP_CYCLE) then
	      skip_cycle_pipe(0) <= '1';
      else
	      skip_cycle_pipe(0) <= '0';
	  end if;
      skip_cycle_pipe(skip_cycle_pipe'left downto 1) <= skip_cycle_pipe(skip_cycle_pipe'left - 1 downto 0);
	  
	  skip_cycle_s   <= fcn_reduce_or(skip_cycle_pipe);

      -- skip_cycle counter to keep track of even/odd bitslip
	  -- the author of the code is aware that a single bit here is needed but in future it might be interesting to know how many skips were issued
	  if(reset_i='1') then
	     skip_cycle_cntr <= 0;
	  elsif(framing_state = SKIP_CYCLE) then
	     if(skip_cycle_cntr < g_DATA_WORD_WIDTH-1) then
	       skip_cycle_cntr <= skip_cycle_cntr + 1;
		 else
	       skip_cycle_cntr <= 0; 
		 end if;
	  end if;

      -- wait between skip pulses counter
      if(framing_state = SKIP_CYCLE_WAIT) then
	     if(skip_wait_cntr < c_MAX_SKIP_WAIT) then
		    skip_wait_cntr <= skip_wait_cntr + 1;
		 end if;
	  else
	     skip_wait_cntr <= 0;
	  end if;

	end if;
  end process p_skip_cycle;
  rx_slide_o  <= skip_cycle_s;
  
  -- create the reset latched whose rising edge will be used in the clk sys domain
  p_reset_rx : process(clk_rxusr_i)
  begin
    if(clk_rxusr_i'event and clk_rxusr_i='1') then
      if(framing_state = RESET_RX) then
         reset_rx_latch <= '1';
	  else 
	     reset_rx_latch <= '0';
	  end if;
	end if;
  end process p_reset_rx;

  -- reset is issued with the clk_sys_i (free-running) to ensure stability
  p_reset_sync : process(clk_sys_i)
  begin
    if(clk_sys_i'event and clk_sys_i='1') then
      reset_rx_sys_meta <= reset_rx_latch;
	  reset_rx_sys_r    <= reset_rx_sys_meta;
	  reset_rx_sys_r2   <= reset_rx_sys_r;
	  if(reset_rx_sys_r = '1' and reset_rx_sys_r2 = '0') then
	     reset_rx_pipe(0) <= '1';
	  else
	     reset_rx_pipe(0) <= '0';
	  end if;
	  reset_rx_pipe(reset_rx_pipe'left downto 1) <= reset_rx_pipe(reset_rx_pipe'left-1 downto 0);
	  rx_reset_o <= fcn_reduce_or(reset_rx_pipe);
	end if;
  end process p_reset_sync;

  
  -- rx locked condition
  p_rx_locked : process(clk_rxusr_i, reset_i)
  begin
    if(reset_i='1') then
      rx_locked_o <= '0';
    elsif(clk_rxusr_i'event and clk_rxusr_i='1') then
      if(framing_state = SYNC or framing_state = GOING_HUNT) then
         rx_locked_o <= '1';
	  else 
	     rx_locked_o <= '0';
	  end if;
	end if;
  end process p_rx_locked;

end architecture rtl;
--==============================================================================
-- architecture end
--==============================================================================
