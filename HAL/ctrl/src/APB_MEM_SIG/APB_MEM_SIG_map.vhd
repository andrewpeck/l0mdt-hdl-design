--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;

use work.APB_MEM_SIG_Ctrl.all;
use work.APB_MEM_SIG_Ctrl_DEF.all;


entity APB_MEM_SIG_map is
  generic (
    READ_TIMEOUT     : integer := 2048;
    ALLOCATED_MEMORY_RANGE : integer 
    );
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    
    Mon              : in  APB_MEM_SIG_Mon_t;
    
    
    Ctrl             : out APB_MEM_SIG_Ctrl_t
        
    );
end entity APB_MEM_SIG_map;
architecture behavioral of APB_MEM_SIG_map is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;

  
  
  signal reg_data :  slv32_array_t(integer range 0 to 0);
  constant Default_reg_data : slv32_array_t(integer range 0 to 0) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  assert ((4*0) <= ALLOCATED_MEMORY_RANGE)
    report "APB_MEM_SIG: Regmap addressing range " & integer'image(4*0) & " is outside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
  severity ERROR;
  assert ((4*0) > ALLOCATED_MEMORY_RANGE)
    report "APB_MEM_SIG: Regmap addressing range " & integer'image(4*0) & " is inside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
  severity NOTE;

  AXIRegBridge : entity work.axiLiteRegBlocking
    generic map (
      READ_TIMEOUT => READ_TIMEOUT
      )
    port map (
      clk_axi     => clk_axi,
      reset_axi_n => reset_axi_n,
      readMOSI    => slave_readMOSI,
      readMISO    => slave_readMISO,
      writeMOSI   => slave_writeMOSI,
      writeMISO   => slave_writeMISO,
      address     => localAddress,
      rd_data     => localRdData_latch,
      wr_data     => localWrData,
      write_en    => localWrEn,
      read_req    => localRdReq,
      read_ack    => localRdAck);

  -------------------------------------------------------------------------------
  -- Record read decoding
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------

  latch_reads: process (clk_axi,reset_axi_n) is
  begin  -- process latch_reads
    if reset_axi_n = '0' then
      localRdAck <= '0';
    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      localRdAck <= '0';
      
      if regRdAck = '1' then
        localRdData_latch <= localRdData;
        localRdAck <= '1';
      
      end if;
    end if;
  end process latch_reads;

  
  reads: process (clk_axi,reset_axi_n) is
  begin  -- process latch_reads
    if reset_axi_n = '0' then
      regRdAck <= '0';
    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      regRdAck  <= '0';
      localRdData <= x"00000000";
      if localRdReq = '1' then
        regRdAck  <= '1';
        case to_integer(unsigned(localAddress(0 downto 0))) is
          
        when 0 => --0x0
          localRdData( 4)            <=  Mon.rd_rdy;                      --Read ready
          localRdData( 5)            <=  reg_data( 0)( 5);                --flush memory to Zync
          localRdData( 6)            <=  Mon.freeze_ena;                  --freeze memory
          localRdData( 7)            <=  reg_data( 0)( 7);                --freeze memory
          localRdData(10 downto  8)  <=  reg_data( 0)(10 downto  8);      --sel memory


          when others =>
            regRdAck <= '0';
            localRdData <= x"00000000";
        end case;
      end if;
    end if;
  end process reads;


  -------------------------------------------------------------------------------
  -- Record write decoding
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------

  -- Register mapping to ctrl structures
  Ctrl.flush_req   <=  reg_data( 0)( 5);               
  Ctrl.freeze_req  <=  reg_data( 0)( 7);               
  Ctrl.mem_sel     <=  reg_data( 0)(10 downto  8);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 0)( 0)  <= DEFAULT_APB_MEM_SIG_CTRL_t.wr_req;
      reg_data( 0)( 1)  <= DEFAULT_APB_MEM_SIG_CTRL_t.wr_ack;
      reg_data( 0)( 2)  <= DEFAULT_APB_MEM_SIG_CTRL_t.rd_req;
      reg_data( 0)( 3)  <= DEFAULT_APB_MEM_SIG_CTRL_t.rd_ack;
      reg_data( 0)( 5)  <= DEFAULT_APB_MEM_SIG_CTRL_t.flush_req;
      reg_data( 0)( 7)  <= DEFAULT_APB_MEM_SIG_CTRL_t.freeze_req;
      reg_data( 0)(10 downto  8)  <= DEFAULT_APB_MEM_SIG_CTRL_t.mem_sel;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.wr_req <= '0';
      Ctrl.wr_ack <= '0';
      Ctrl.rd_req <= '0';
      Ctrl.rd_ack <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(0 downto 0))) is
        when 0 => --0x0
          Ctrl.wr_req                 <=  localWrData( 0);               
          Ctrl.wr_ack                 <=  localWrData( 1);               
          Ctrl.rd_req                 <=  localWrData( 2);               
          Ctrl.rd_ack                 <=  localWrData( 3);               
          reg_data( 0)( 5)            <=  localWrData( 5);                --flush memory to Zync
          reg_data( 0)( 7)            <=  localWrData( 7);                --freeze memory
          reg_data( 0)(10 downto  8)  <=  localWrData(10 downto  8);      --sel memory

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;







  
end architecture behavioral;