--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;

use work.FW_INFO_Ctrl.all;
use work.FW_INFO_Ctrl_DEF.all;
entity FW_INFO_map is
  generic (
    READ_TIMEOUT     : integer := 2048
    );
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    
    Mon              : in  FW_INFO_Mon_t
    
        
    );
end entity FW_INFO_map;
architecture behavioral of FW_INFO_map is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;

  
  
  signal reg_data :  slv32_array_t(integer range 0 to 11);
  constant Default_reg_data : slv32_array_t(integer range 0 to 11) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
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
        case to_integer(unsigned(localAddress(3 downto 0))) is
          
        when 0 => --0x0
          localRdData( 0)            <=  Mon.CONFIG.MAIN_CFG_COMPILE_HW;      --
          localRdData( 1)            <=  Mon.CONFIG.MAIN_CFG_COMPILE_UL;      --
          localRdData( 3)            <=  Mon.CONFIG.ST_nBARREL_ENDCAP;        --
          localRdData( 4)            <=  Mon.CONFIG.ENDCAP_nSMALL_LARGE;      --
          localRdData( 5)            <=  Mon.CONFIG.ENABLE_NEIGHBORS;         --
        when 1 => --0x1
          localRdData(31 downto  0)  <=  Mon.CONFIG.SECTOR_ID;                --
        when 2 => --0x2
          localRdData(31 downto  0)  <=  Mon.CONFIG.PHY_BARREL_R0;            --
        when 3 => --0x3
          localRdData(31 downto  0)  <=  Mon.CONFIG.PHY_BARREL_R1;            --
        when 4 => --0x4
          localRdData(31 downto  0)  <=  Mon.CONFIG.PHY_BARREL_R2;            --
        when 5 => --0x5
          localRdData(31 downto  0)  <=  Mon.CONFIG.PHY_BARREL_R3;            --
        when 6 => --0x6
          localRdData( 0)            <=  Mon.CONFIG.HPS_ENABLE_ST_INN;        --
          localRdData( 1)            <=  Mon.CONFIG.HPS_ENABLE_ST_EXT;        --
          localRdData( 2)            <=  Mon.CONFIG.HPS_ENABLE_ST_MID;        --
          localRdData( 3)            <=  Mon.CONFIG.HPS_ENABLE_ST_OUT;        --
        when 7 => --0x7
          localRdData( 7 downto  0)  <=  Mon.CONFIG.HPS_NUM_MDT_CH_INN;       --
          localRdData(15 downto  8)  <=  Mon.CONFIG.HPS_NUM_MDT_CH_EXT;       --
          localRdData(23 downto 16)  <=  Mon.CONFIG.HPS_NUM_MDT_CH_MID;       --
          localRdData(31 downto 24)  <=  Mon.CONFIG.HPS_NUM_MDT_CH_OUT;       --
        when 8 => --0x8
          localRdData( 7 downto  0)  <=  Mon.CONFIG.NUM_MTC;                  --
          localRdData(15 downto  8)  <=  Mon.CONFIG.NUM_NSP;                  --
        when 9 => --0x9
          localRdData( 0)            <=  Mon.CONFIG.UCM_ENABLED;              --
          localRdData( 1)            <=  Mon.CONFIG.MPL_ENABLED;              --
          localRdData( 2)            <=  Mon.CONFIG.SF_ENABLED;               --
          localRdData( 3)            <=  Mon.CONFIG.SF_TYPE;                  --
        when 10 => --0xa
          localRdData( 7 downto  0)  <=  Mon.CONFIG.NUM_DAQ_STREAMS;          --
        when 11 => --0xb
          localRdData( 7 downto  0)  <=  Mon.CONFIG.NUM_SF_INPUTS;            --
          localRdData(15 downto  8)  <=  Mon.CONFIG.NUM_SF_OUTPUTS;           --
          localRdData(23 downto 16)  <=  Mon.CONFIG.MAX_NUM_SL;               --
          localRdData(31 downto 24)  <=  Mon.CONFIG.NUM_THREADS;              --


          when others =>
            regRdAck <= '0';
            localRdData <= x"00000000";
        end case;
      end if;
    end if;
  end process reads;








  
end architecture behavioral;