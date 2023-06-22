--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;

use work.VIRTEX_SYS_MGMT_Ctrl.all;
use work.VIRTEX_SYS_MGMT_Ctrl_DEF.all;


entity VIRTEX_SYS_MGMT_map is
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
    
    Mon              : in  VIRTEX_SYS_MGMT_Mon_t
    
        
    );
end entity VIRTEX_SYS_MGMT_map;
architecture behavioral of VIRTEX_SYS_MGMT_map is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;

  
  
  signal reg_data :  slv32_array_t(integer range 0 to 295);
  constant Default_reg_data : slv32_array_t(integer range 0 to 295) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  assert ((4*295) <= ALLOCATED_MEMORY_RANGE)
    report "VIRTEX_SYS_MGMT: Regmap addressing range " & integer'image(4*295) & " is outside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
  severity ERROR;
  assert ((4*295) > ALLOCATED_MEMORY_RANGE)
    report "VIRTEX_SYS_MGMT: Regmap addressing range " & integer'image(4*295) & " is inside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
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
            regRdAck <= '0';
            localRdData <= x"00000000";
        end case;
      end if;
    end if;
  end process reads;








  
end architecture behavioral;