--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;

use work.DAQ_Ctrl.all;
use work.DAQ_Ctrl_DEF.all;


entity DAQ_map is
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
    
    Mon              : in  DAQ_Mon_t;
    
    
    Ctrl             : out DAQ_Ctrl_t
        
    );
end entity DAQ_map;
architecture behavioral of DAQ_map is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;

  
  
  signal reg_data :  slv32_array_t(integer range 0 to 3);
  constant Default_reg_data : slv32_array_t(integer range 0 to 3) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  assert ((4*3) <= ALLOCATED_MEMORY_RANGE)
    report "DAQ: Regmap addressing range " & integer'image(4*3) & " is outside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
  severity ERROR;
  assert ((4*3) > ALLOCATED_MEMORY_RANGE)
    report "DAQ: Regmap addressing range " & integer'image(4*3) & " is inside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
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
        case to_integer(unsigned(localAddress(1 downto 0))) is
          
        when 1 => --0x1
          localRdData(11 downto  0)  <=  reg_data( 1)(11 downto  0);      --
          localRdData(23 downto 12)  <=  reg_data( 1)(23 downto 12);      --
          localRdData(35 downto 24)  <=  reg_data( 1)(35 downto 24);      --
          localRdData(47 downto 36)  <=  reg_data( 1)(47 downto 36);      --
          localRdData(55 downto 48)  <=  reg_data( 1)(55 downto 48);      --
        when 2 => --0x2
          localRdData(11 downto  0)  <=  Mon.rd.opening_offset;           --
          localRdData(23 downto 12)  <=  Mon.rd.request_offset;           --
          localRdData(35 downto 24)  <=  Mon.rd.closing_offset;           --
          localRdData(47 downto 36)  <=  Mon.rd.window_timeout;           --
          localRdData(55 downto 48)  <=  Mon.rd.busy_threshold;           --
        when 3 => --0x3
          localRdData( 0)            <=  Mon.status.busy;                 --


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
  Ctrl.wr.opening_offset  <=  reg_data( 1)(11 downto  0);     
  Ctrl.wr.request_offset  <=  reg_data( 1)(23 downto 12);     
  Ctrl.wr.closing_offset  <=  reg_data( 1)(35 downto 24);     
  Ctrl.wr.window_timeout  <=  reg_data( 1)(47 downto 36);     
  Ctrl.wr.busy_threshold  <=  reg_data( 1)(55 downto 48);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 0)( 0)  <= DEFAULT_DAQ_CTRL_t.action.RESET;
      reg_data( 0)( 1)  <= DEFAULT_DAQ_CTRL_t.action.WR_EN;
      reg_data( 1)(11 downto  0)  <= DEFAULT_DAQ_CTRL_t.wr.opening_offset;
      reg_data( 1)(23 downto 12)  <= DEFAULT_DAQ_CTRL_t.wr.request_offset;
      reg_data( 1)(35 downto 24)  <= DEFAULT_DAQ_CTRL_t.wr.closing_offset;
      reg_data( 1)(47 downto 36)  <= DEFAULT_DAQ_CTRL_t.wr.window_timeout;
      reg_data( 1)(55 downto 48)  <= DEFAULT_DAQ_CTRL_t.wr.busy_threshold;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.action.RESET <= '0';
      Ctrl.action.WR_EN <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(1 downto 0))) is
        when 0 => --0x0
          Ctrl.action.RESET           <=  localWrData( 0);               
          Ctrl.action.WR_EN           <=  localWrData( 1);               
        when 1 => --0x1
          reg_data( 1)(11 downto  0)  <=  localWrData(11 downto  0);      --
          reg_data( 1)(23 downto 12)  <=  localWrData(23 downto 12);      --
          reg_data( 1)(35 downto 24)  <=  localWrData(35 downto 24);      --
          reg_data( 1)(47 downto 36)  <=  localWrData(47 downto 36);      --
          reg_data( 1)(55 downto 48)  <=  localWrData(55 downto 48);      --

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;







  
end architecture behavioral;
