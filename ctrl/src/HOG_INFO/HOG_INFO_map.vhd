--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.AXIRegPkg.all;
use work.types.all;
use work.HOG_INFO_Ctrl.all;
entity HOG_INFO_interface is
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    Mon              : in  HOG_INFO_Mon_t
    );
end entity HOG_INFO_interface;
architecture behavioral of HOG_INFO_interface is
  signal localAddress       : slv_32_t;
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;


  signal reg_data :  slv32_array_t(integer range 0 to 17);
  constant Default_reg_data : slv32_array_t(integer range 0 to 17) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  AXIRegBridge : entity work.axiLiteReg
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

  latch_reads: process (clk_axi) is
  begin  -- process latch_reads
    if clk_axi'event and clk_axi = '1' then  -- rising clock edge
      if localRdReq = '1' then
        localRdData_latch <= localRdData;        
      end if;
    end if;
  end process latch_reads;
  reads: process (localRdReq,localAddress,reg_data) is
  begin  -- process reads
    localRdAck  <= '0';
    localRdData <= x"00000000";
    if localRdReq = '1' then
      localRdAck  <= '1';
      case to_integer(unsigned(localAddress(4 downto 0))) is

        when 0 => --0x0
          localRdData(31 downto  0)  <=  Mon.GLOBAL_FWDATE;            --
        when 1 => --0x1
          localRdData(31 downto  0)  <=  Mon.GLOBAL_FWTIME;            --
        when 2 => --0x2
          localRdData(31 downto  0)  <=  Mon.OFFICIAL;                 --
        when 3 => --0x3
          localRdData(31 downto  0)  <=  Mon.GLOBAL_FWHASH;            --
        when 4 => --0x4
          localRdData(31 downto  0)  <=  Mon.TOP_FWHASH;               --
        when 5 => --0x5
          localRdData(31 downto  0)  <=  Mon.XML_HASH;                 --
        when 6 => --0x6
          localRdData(31 downto  0)  <=  Mon.GLOBAL_FWVERSION;         --
        when 7 => --0x7
          localRdData(31 downto  0)  <=  Mon.TOP_FWVERSION;            --
        when 8 => --0x8
          localRdData(31 downto  0)  <=  Mon.XML_VERSION;              --
        when 9 => --0x9
          localRdData(31 downto  0)  <=  Mon.HOG_FWHASH;               --
        when 16 => --0x10
          localRdData(31 downto  0)  <=  Mon.FRAMEWORK_FWVERSION;      --
        when 17 => --0x11
          localRdData(31 downto  0)  <=  Mon.FRAMEWORK_FWHASH;         --


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;





end architecture behavioral;