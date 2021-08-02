--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;

use work.TAR_Ctrl.all;
use work.TAR_Ctrl_DEF.all;
entity TAR_map is
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    
    Mon              : in  TAR_Mon_t;
    Ctrl             : out TAR_Ctrl_t
        
    );
end entity TAR_map;
architecture behavioral of TAR_map is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;

  
  
  signal reg_data :  slv32_array_t(integer range 0 to 16);
  constant Default_reg_data : slv32_array_t(integer range 0 to 16) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  AXIRegBridge : entity work.axiLiteRegBlocking
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
        case to_integer(unsigned(localAddress(4 downto 0))) is
          
        when 1 => --0x1
          localRdData( 4)  <=  reg_data( 1)( 4);        --
          localRdData( 5)  <=  reg_data( 1)( 5);        --
          localRdData( 6)  <=  reg_data( 1)( 6);        --
        when 16 => --0x10
          localRdData( 0)  <=  Mon.STATUS.ENABLED;      --
          localRdData( 1)  <=  Mon.STATUS.READY;        --
          localRdData( 2)  <=  Mon.STATUS.ERROR;        --


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
  Ctrl.CONFIGS.INPUT_EN         <=  reg_data( 1)( 4);     
  Ctrl.CONFIGS.OUTPUT_EN        <=  reg_data( 1)( 5);     
  Ctrl.CONFIGS.FLUSH_MEM_RESET  <=  reg_data( 1)( 6);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 1)( 4)  <= DEFAULT_TAR_CTRL_t.CONFIGS.INPUT_EN;
      reg_data( 1)( 5)  <= DEFAULT_TAR_CTRL_t.CONFIGS.OUTPUT_EN;
      reg_data( 1)( 6)  <= DEFAULT_TAR_CTRL_t.CONFIGS.FLUSH_MEM_RESET;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.ACTIONS.RESET <= '0';
      Ctrl.ACTIONS.ENABLE <= '0';
      Ctrl.ACTIONS.DISABLE <= '0';
      Ctrl.ACTIONS.FREEZE <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(4 downto 0))) is
        when 0 => --0x0
          Ctrl.ACTIONS.RESET    <=  localWrData( 0);     
          Ctrl.ACTIONS.ENABLE   <=  localWrData( 1);     
          Ctrl.ACTIONS.DISABLE  <=  localWrData( 2);     
          Ctrl.ACTIONS.FREEZE   <=  localWrData( 3);     
        when 1 => --0x1
          reg_data( 1)( 4)      <=  localWrData( 4);      --
          reg_data( 1)( 5)      <=  localWrData( 5);      --
          reg_data( 1)( 6)      <=  localWrData( 6);      --

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;







  
end architecture behavioral;