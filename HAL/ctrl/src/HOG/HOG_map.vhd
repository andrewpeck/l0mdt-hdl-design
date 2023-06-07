--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;

use work.HOG_Ctrl.all;
use work.HOG_Ctrl_DEF.all;


entity HOG_map is
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
    
    Mon              : in  HOG_Mon_t
    
        
    );
end entity HOG_map;
architecture behavioral of HOG_map is
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
  assert ((4*11) <= ALLOCATED_MEMORY_RANGE)
    report "HOG: Regmap addressing range " & integer'image(4*11) & " is outside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
  severity ERROR;
  assert ((4*11) > ALLOCATED_MEMORY_RANGE)
    report "HOG: Regmap addressing range " & integer'image(4*11) & " is inside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
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
        case to_integer(unsigned(localAddress(3 downto 0))) is
          
        when 0 => --0x0
          localRdData(31 downto  0)  <=  Mon.HOG_INFO.GLOBAL_DATE;          --
        when 1 => --0x1
          localRdData(31 downto  0)  <=  Mon.HOG_INFO.GLOBAL_TIME;          --
        when 2 => --0x2
          localRdData(31 downto  0)  <=  Mon.HOG_INFO.GLOBAL_VER;           --
        when 3 => --0x3
          localRdData(31 downto  0)  <=  Mon.HOG_INFO.GLOBAL_SHA;           --
        when 4 => --0x4
          localRdData(31 downto  0)  <=  Mon.HOG_INFO.TOP_SHA;              --
        when 5 => --0x5
          localRdData(31 downto  0)  <=  Mon.HOG_INFO.TOP_VER;              --
        when 6 => --0x6
          localRdData(31 downto  0)  <=  Mon.HOG_INFO.HOG_SHA;              --
        when 7 => --0x7
          localRdData(31 downto  0)  <=  Mon.HOG_INFO.HOG_VER;              --
        when 8 => --0x8
          localRdData(31 downto  0)  <=  Mon.HOG_INFO.CON_SHA;              --
        when 9 => --0x9
          localRdData(31 downto  0)  <=  Mon.HOG_INFO.CON_VER;              --
        when 10 => --0xa
          localRdData(31 downto  0)  <=  Mon.HOG_INFO.PROJECT_LIB_SHA;      --
        when 11 => --0xb
          localRdData(31 downto  0)  <=  Mon.HOG_INFO.PROJECT_LIB_VER;      --


          when others =>
            regRdAck <= '0';
            localRdData <= x"00000000";
        end case;
      end if;
    end if;
  end process reads;








  
end architecture behavioral;