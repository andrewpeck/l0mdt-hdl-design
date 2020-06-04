--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.AXIRegPkg.all;
use work.types.all;
use work.KINTEX_SYS_MGMT_Ctrl.all;
entity KINTEX_SYS_MGMT_interface is
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    Mon              : in  KINTEX_SYS_MGMT_Mon_t
    );
end entity KINTEX_SYS_MGMT_interface;
architecture behavioral of KINTEX_SYS_MGMT_interface is
  signal localAddress       : slv_32_t;
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;


  signal reg_data :  slv32_array_t(integer range 0 to 295);
  constant Default_reg_data : slv32_array_t(integer range 0 to 295) := (others => x"00000000");
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
      case to_integer(unsigned(localAddress(8 downto 0))) is
        when 256 => --0x100
          localRdData(15 downto  6)  <=  Mon.TEMP;             --
        when 257 => --0x101
          localRdData(15 downto  6)  <=  Mon.VCCINT;           --
        when 258 => --0x102
          localRdData(15 downto  6)  <=  Mon.VCCAUX;           --
        when 263 => --0x107
          localRdData(15 downto  6)  <=  Mon.VCCBRAM;          --
        when 288 => --0x120
          localRdData(15 downto  6)  <=  Mon.TEMP_MAX;         --
        when 289 => --0x121
          localRdData(15 downto  6)  <=  Mon.VCCINT_MAX;       --
        when 290 => --0x122
          localRdData(15 downto  6)  <=  Mon.VCCAUX_MAX;       --
        when 291 => --0x123
          localRdData(15 downto  6)  <=  Mon.VCCBRAM_MAX;      --
        when 292 => --0x124
          localRdData(15 downto  6)  <=  Mon.TEMP_MIN;         --
        when 293 => --0x125
          localRdData(15 downto  6)  <=  Mon.VCCINT_MIN;       --
        when 294 => --0x126
          localRdData(15 downto  6)  <=  Mon.VCCAUX_MIN;       --
        when 295 => --0x127
          localRdData(15 downto  6)  <=  Mon.VCCBRAM_MIN;      --
        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;



end architecture behavioral;
