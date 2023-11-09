--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;
use work.BRAMPortPkg.all;
use work.FM_Ctrl.all;
use work.FM_Ctrl_DEF.all;


entity FM_map is
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
    
    Mon              : in  FM_Mon_t;
    
    
    Ctrl             : out FM_Ctrl_t
        
    );
end entity FM_map;
architecture behavioral of FM_map is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;

  
  constant BRAM_COUNT       : integer := 114;
--  signal latchBRAM          : std_logic_vector(BRAM_COUNT-1 downto 0);
--  signal delayLatchBRAM          : std_logic_vector(BRAM_COUNT-1 downto 0);
  constant BRAM_range       : int_array_t(0 to BRAM_COUNT-1) := (0 => 9
,			1 => 9
,			2 => 9
,			3 => 9
,			4 => 9
,			5 => 9
,			6 => 9
,			7 => 9
,			8 => 9
,			9 => 9
,			10 => 9
,			11 => 9
,			12 => 9
,			13 => 9
,			14 => 9
,			15 => 9
,			16 => 9
,			17 => 9
,			18 => 9
,			19 => 9
,			20 => 9
,			21 => 9
,			22 => 9
,			23 => 9
,			24 => 9
,			25 => 9
,			26 => 9
,			27 => 9
,			28 => 9
,			29 => 9
,			30 => 9
,			31 => 9
,			32 => 9
,			33 => 9
,			34 => 9
,			35 => 9
,			36 => 9
,			37 => 9
,			38 => 9
,			39 => 9
,			40 => 9
,			41 => 9
,			42 => 9
,			43 => 9
,			44 => 9
,			45 => 9
,			46 => 9
,			47 => 9
,			48 => 9
,			49 => 9
,			50 => 9
,			51 => 9
,			52 => 9
,			53 => 9
,			54 => 9
,			55 => 9
,			56 => 9
,			57 => 9
,			58 => 9
,			59 => 9
,			60 => 9
,			61 => 9
,			62 => 9
,			63 => 9
,			64 => 9
,			65 => 9
,			66 => 9
,			67 => 9
,			68 => 9
,			69 => 9
,			70 => 9
,			71 => 9
,			72 => 9
,			73 => 9
,			74 => 9
,			75 => 9
,			76 => 9
,			77 => 9
,			78 => 9
,			79 => 9
,			80 => 9
,			81 => 9
,			82 => 9
,			83 => 9
,			84 => 9
,			85 => 9
,			86 => 9
,			87 => 9
,			88 => 9
,			89 => 9
,			90 => 9
,			91 => 9
,			92 => 9
,			93 => 9
,			94 => 9
,			95 => 9
,			96 => 9
,			97 => 9
,			98 => 9
,			99 => 9
,			100 => 9
,			101 => 9
,			102 => 9
,			103 => 9
,			104 => 9
,			105 => 9
,			106 => 9
,			107 => 9
,			108 => 9
,			109 => 9
,			110 => 9
,			111 => 9
,			112 => 9
,			113 => 9);
  constant BRAM_addr        : slv32_array_t(0 to BRAM_COUNT-1) := (0 => x"00000000"
,			1 => x"00000200"
,			2 => x"00000400"
,			3 => x"00000600"
,			4 => x"00000800"
,			5 => x"00000A00"
,			6 => x"00000C00"
,			7 => x"00000E00"
,			8 => x"00001000"
,			9 => x"00001200"
,			10 => x"00001400"
,			11 => x"00001600"
,			12 => x"00001800"
,			13 => x"00001A00"
,			14 => x"00001C00"
,			15 => x"00001E00"
,			16 => x"00002000"
,			17 => x"00002200"
,			18 => x"00002400"
,			19 => x"00002600"
,			20 => x"00002800"
,			21 => x"00002A00"
,			22 => x"00002C00"
,			23 => x"00002E00"
,			24 => x"00003000"
,			25 => x"00003200"
,			26 => x"00003400"
,			27 => x"00003600"
,			28 => x"00003800"
,			29 => x"00003A00"
,			30 => x"00003C00"
,			31 => x"00003E00"
,			32 => x"00004000"
,			33 => x"00004200"
,			34 => x"00004400"
,			35 => x"00004600"
,			36 => x"00004800"
,			37 => x"00004A00"
,			38 => x"00004C00"
,			39 => x"00004E00"
,			40 => x"00005000"
,			41 => x"00005200"
,			42 => x"00005400"
,			43 => x"00005600"
,			44 => x"00005800"
,			45 => x"00005A00"
,			46 => x"00005C00"
,			47 => x"00005E00"
,			48 => x"00006000"
,			49 => x"00006200"
,			50 => x"00006400"
,			51 => x"00006600"
,			52 => x"00006800"
,			53 => x"00006A00"
,			54 => x"00006C00"
,			55 => x"00006E00"
,			56 => x"00007000"
,			57 => x"00007200"
,			58 => x"00007400"
,			59 => x"00007600"
,			60 => x"00007800"
,			61 => x"00007A00"
,			62 => x"00007C00"
,			63 => x"00007E00"
,			64 => x"00008000"
,			65 => x"00008200"
,			66 => x"00008400"
,			67 => x"00008600"
,			68 => x"00008800"
,			69 => x"00008A00"
,			70 => x"00008C00"
,			71 => x"00008E00"
,			72 => x"00009000"
,			73 => x"00009200"
,			74 => x"00009400"
,			75 => x"00009600"
,			76 => x"00009800"
,			77 => x"00009A00"
,			78 => x"00009C00"
,			79 => x"00009E00"
,			80 => x"0000A000"
,			81 => x"0000A200"
,			82 => x"0000A400"
,			83 => x"0000A600"
,			84 => x"0000A800"
,			85 => x"0000AA00"
,			86 => x"0000AC00"
,			87 => x"0000AE00"
,			88 => x"0000B000"
,			89 => x"0000B200"
,			90 => x"0000B400"
,			91 => x"0000B600"
,			92 => x"0000B800"
,			93 => x"0000BA00"
,			94 => x"0000BC00"
,			95 => x"0000BE00"
,			96 => x"0000C000"
,			97 => x"0000C200"
,			98 => x"0000C400"
,			99 => x"0000C600"
,			100 => x"0000C800"
,			101 => x"0000CA00"
,			102 => x"0000CC00"
,			103 => x"0000CE00"
,			104 => x"0000D000"
,			105 => x"0000D200"
,			106 => x"0000D400"
,			107 => x"0000D600"
,			108 => x"0000D800"
,			109 => x"0000DA00"
,			110 => x"0000DC00"
,			111 => x"0000DE00"
,			112 => x"0000E000"
,			113 => x"0000E200");
  signal BRAM_MOSI          : BRAMPortMOSI_array_t(0 to BRAM_COUNT-1);
  signal BRAM_MISO          : BRAMPortMISO_array_t(0 to BRAM_COUNT-1);
  
  
  signal reg_data :  slv32_array_t(integer range 0 to 65292);
  constant Default_reg_data : slv32_array_t(integer range 0 to 65292) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  assert ((4*65292) <= ALLOCATED_MEMORY_RANGE)
    report "FM: Regmap addressing range " & integer'image(4*65292) & " is outside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
  severity ERROR;
  assert ((4*65292) > ALLOCATED_MEMORY_RANGE)
    report "FM: Regmap addressing range " & integer'image(4*65292) & " is inside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
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
      elsif BRAM_MISO(0).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(0).rd_data;
elsif BRAM_MISO(1).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(1).rd_data;
elsif BRAM_MISO(2).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(2).rd_data;
elsif BRAM_MISO(3).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(3).rd_data;
elsif BRAM_MISO(4).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(4).rd_data;
elsif BRAM_MISO(5).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(5).rd_data;
elsif BRAM_MISO(6).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(6).rd_data;
elsif BRAM_MISO(7).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(7).rd_data;
elsif BRAM_MISO(8).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(8).rd_data;
elsif BRAM_MISO(9).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(9).rd_data;
elsif BRAM_MISO(10).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(10).rd_data;
elsif BRAM_MISO(11).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(11).rd_data;
elsif BRAM_MISO(12).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(12).rd_data;
elsif BRAM_MISO(13).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(13).rd_data;
elsif BRAM_MISO(14).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(14).rd_data;
elsif BRAM_MISO(15).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(15).rd_data;
elsif BRAM_MISO(16).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(16).rd_data;
elsif BRAM_MISO(17).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(17).rd_data;
elsif BRAM_MISO(18).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(18).rd_data;
elsif BRAM_MISO(19).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(19).rd_data;
elsif BRAM_MISO(20).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(20).rd_data;
elsif BRAM_MISO(21).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(21).rd_data;
elsif BRAM_MISO(22).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(22).rd_data;
elsif BRAM_MISO(23).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(23).rd_data;
elsif BRAM_MISO(24).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(24).rd_data;
elsif BRAM_MISO(25).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(25).rd_data;
elsif BRAM_MISO(26).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(26).rd_data;
elsif BRAM_MISO(27).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(27).rd_data;
elsif BRAM_MISO(28).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(28).rd_data;
elsif BRAM_MISO(29).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(29).rd_data;
elsif BRAM_MISO(30).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(30).rd_data;
elsif BRAM_MISO(31).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(31).rd_data;
elsif BRAM_MISO(32).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(32).rd_data;
elsif BRAM_MISO(33).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(33).rd_data;
elsif BRAM_MISO(34).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(34).rd_data;
elsif BRAM_MISO(35).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(35).rd_data;
elsif BRAM_MISO(36).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(36).rd_data;
elsif BRAM_MISO(37).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(37).rd_data;
elsif BRAM_MISO(38).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(38).rd_data;
elsif BRAM_MISO(39).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(39).rd_data;
elsif BRAM_MISO(40).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(40).rd_data;
elsif BRAM_MISO(41).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(41).rd_data;
elsif BRAM_MISO(42).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(42).rd_data;
elsif BRAM_MISO(43).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(43).rd_data;
elsif BRAM_MISO(44).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(44).rd_data;
elsif BRAM_MISO(45).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(45).rd_data;
elsif BRAM_MISO(46).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(46).rd_data;
elsif BRAM_MISO(47).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(47).rd_data;
elsif BRAM_MISO(48).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(48).rd_data;
elsif BRAM_MISO(49).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(49).rd_data;
elsif BRAM_MISO(50).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(50).rd_data;
elsif BRAM_MISO(51).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(51).rd_data;
elsif BRAM_MISO(52).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(52).rd_data;
elsif BRAM_MISO(53).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(53).rd_data;
elsif BRAM_MISO(54).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(54).rd_data;
elsif BRAM_MISO(55).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(55).rd_data;
elsif BRAM_MISO(56).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(56).rd_data;
elsif BRAM_MISO(57).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(57).rd_data;
elsif BRAM_MISO(58).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(58).rd_data;
elsif BRAM_MISO(59).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(59).rd_data;
elsif BRAM_MISO(60).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(60).rd_data;
elsif BRAM_MISO(61).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(61).rd_data;
elsif BRAM_MISO(62).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(62).rd_data;
elsif BRAM_MISO(63).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(63).rd_data;
elsif BRAM_MISO(64).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(64).rd_data;
elsif BRAM_MISO(65).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(65).rd_data;
elsif BRAM_MISO(66).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(66).rd_data;
elsif BRAM_MISO(67).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(67).rd_data;
elsif BRAM_MISO(68).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(68).rd_data;
elsif BRAM_MISO(69).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(69).rd_data;
elsif BRAM_MISO(70).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(70).rd_data;
elsif BRAM_MISO(71).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(71).rd_data;
elsif BRAM_MISO(72).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(72).rd_data;
elsif BRAM_MISO(73).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(73).rd_data;
elsif BRAM_MISO(74).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(74).rd_data;
elsif BRAM_MISO(75).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(75).rd_data;
elsif BRAM_MISO(76).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(76).rd_data;
elsif BRAM_MISO(77).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(77).rd_data;
elsif BRAM_MISO(78).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(78).rd_data;
elsif BRAM_MISO(79).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(79).rd_data;
elsif BRAM_MISO(80).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(80).rd_data;
elsif BRAM_MISO(81).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(81).rd_data;
elsif BRAM_MISO(82).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(82).rd_data;
elsif BRAM_MISO(83).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(83).rd_data;
elsif BRAM_MISO(84).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(84).rd_data;
elsif BRAM_MISO(85).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(85).rd_data;
elsif BRAM_MISO(86).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(86).rd_data;
elsif BRAM_MISO(87).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(87).rd_data;
elsif BRAM_MISO(88).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(88).rd_data;
elsif BRAM_MISO(89).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(89).rd_data;
elsif BRAM_MISO(90).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(90).rd_data;
elsif BRAM_MISO(91).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(91).rd_data;
elsif BRAM_MISO(92).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(92).rd_data;
elsif BRAM_MISO(93).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(93).rd_data;
elsif BRAM_MISO(94).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(94).rd_data;
elsif BRAM_MISO(95).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(95).rd_data;
elsif BRAM_MISO(96).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(96).rd_data;
elsif BRAM_MISO(97).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(97).rd_data;
elsif BRAM_MISO(98).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(98).rd_data;
elsif BRAM_MISO(99).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(99).rd_data;
elsif BRAM_MISO(100).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(100).rd_data;
elsif BRAM_MISO(101).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(101).rd_data;
elsif BRAM_MISO(102).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(102).rd_data;
elsif BRAM_MISO(103).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(103).rd_data;
elsif BRAM_MISO(104).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(104).rd_data;
elsif BRAM_MISO(105).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(105).rd_data;
elsif BRAM_MISO(106).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(106).rd_data;
elsif BRAM_MISO(107).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(107).rd_data;
elsif BRAM_MISO(108).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(108).rd_data;
elsif BRAM_MISO(109).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(109).rd_data;
elsif BRAM_MISO(110).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(110).rd_data;
elsif BRAM_MISO(111).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(111).rd_data;
elsif BRAM_MISO(112).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(112).rd_data;
elsif BRAM_MISO(113).rd_data_valid = '1' then
        localRdAck <= '1';
        localRdData_latch <= BRAM_MISO(113).rd_data;

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
        case to_integer(unsigned(localAddress(15 downto 0))) is
          
        when 65280 => --0xff00
          localRdData( 0)            <=  reg_data(65280)( 0);                --
          localRdData( 2 downto  1)  <=  reg_data(65280)( 2 downto  1);      --
          localRdData( 3)            <=  reg_data(65280)( 3);                --
        when 65281 => --0xff01
          localRdData(31 downto  0)  <=  reg_data(65281)(31 downto  0);      --
        when 65282 => --0xff02
          localRdData(31 downto  0)  <=  reg_data(65282)(31 downto  0);      --
        when 65283 => --0xff03
          localRdData(31 downto  0)  <=  reg_data(65283)(31 downto  0);      --
        when 65284 => --0xff04
          localRdData(31 downto  0)  <=  reg_data(65284)(31 downto  0);      --
        when 65285 => --0xff05
          localRdData(31 downto  0)  <=  reg_data(65285)(31 downto  0);      --
        when 65286 => --0xff06
          localRdData(31 downto  0)  <=  reg_data(65286)(31 downto  0);      --
        when 65287 => --0xff07
          localRdData(31 downto  0)  <=  reg_data(65287)(31 downto  0);      --
        when 65288 => --0xff08
          localRdData(31 downto  0)  <=  reg_data(65288)(31 downto  0);      --
        when 65289 => --0xff09
          localRdData(31 downto  0)  <=  reg_data(65289)(31 downto  0);      --
        when 65290 => --0xff0a
          localRdData(31 downto  0)  <=  reg_data(65290)(31 downto  0);      --
        when 65291 => --0xff0b
          localRdData(31 downto  0)  <=  reg_data(65291)(31 downto  0);      --
        when 65292 => --0xff0c
          localRdData(31 downto  0)  <=  reg_data(65292)(31 downto  0);      --


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
  Ctrl.SPY_CTRL.GLOBAL_FREEZE          <=  reg_data(65280)( 0);               
  Ctrl.SPY_CTRL.GLOBAL_PLAYBACK_MODE   <=  reg_data(65280)( 2 downto  1);     
  Ctrl.SPY_CTRL.INITIALIZE_SPY_MEMORY  <=  reg_data(65280)( 3);               
  Ctrl.FREEZE_MASK_0                   <=  reg_data(65281)(31 downto  0);     
  Ctrl.FREEZE_MASK_1                   <=  reg_data(65282)(31 downto  0);     
  Ctrl.FREEZE_MASK_2                   <=  reg_data(65283)(31 downto  0);     
  Ctrl.FREEZE_MASK_3                   <=  reg_data(65284)(31 downto  0);     
  Ctrl.PLAYBACK_MASK_0                 <=  reg_data(65285)(31 downto  0);     
  Ctrl.PLAYBACK_MASK_1                 <=  reg_data(65286)(31 downto  0);     
  Ctrl.PLAYBACK_MASK_2                 <=  reg_data(65287)(31 downto  0);     
  Ctrl.PLAYBACK_MASK_3                 <=  reg_data(65288)(31 downto  0);     
  Ctrl.SB_RESET_0                      <=  reg_data(65289)(31 downto  0);     
  Ctrl.SB_RESET_1                      <=  reg_data(65290)(31 downto  0);     
  Ctrl.SB_RESET_2                      <=  reg_data(65291)(31 downto  0);     
  Ctrl.SB_RESET_3                      <=  reg_data(65292)(31 downto  0);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data(65280)( 0)  <= DEFAULT_FM_CTRL_t.SPY_CTRL.GLOBAL_FREEZE;
      reg_data(65280)( 2 downto  1)  <= DEFAULT_FM_CTRL_t.SPY_CTRL.GLOBAL_PLAYBACK_MODE;
      reg_data(65280)( 3)  <= DEFAULT_FM_CTRL_t.SPY_CTRL.INITIALIZE_SPY_MEMORY;
      reg_data(65281)(31 downto  0)  <= DEFAULT_FM_CTRL_t.FREEZE_MASK_0;
      reg_data(65282)(31 downto  0)  <= DEFAULT_FM_CTRL_t.FREEZE_MASK_1;
      reg_data(65283)(31 downto  0)  <= DEFAULT_FM_CTRL_t.FREEZE_MASK_2;
      reg_data(65284)(31 downto  0)  <= DEFAULT_FM_CTRL_t.FREEZE_MASK_3;
      reg_data(65285)(31 downto  0)  <= DEFAULT_FM_CTRL_t.PLAYBACK_MASK_0;
      reg_data(65286)(31 downto  0)  <= DEFAULT_FM_CTRL_t.PLAYBACK_MASK_1;
      reg_data(65287)(31 downto  0)  <= DEFAULT_FM_CTRL_t.PLAYBACK_MASK_2;
      reg_data(65288)(31 downto  0)  <= DEFAULT_FM_CTRL_t.PLAYBACK_MASK_3;
      reg_data(65289)(31 downto  0)  <= DEFAULT_FM_CTRL_t.SB_RESET_0;
      reg_data(65290)(31 downto  0)  <= DEFAULT_FM_CTRL_t.SB_RESET_1;
      reg_data(65291)(31 downto  0)  <= DEFAULT_FM_CTRL_t.SB_RESET_2;
      reg_data(65292)(31 downto  0)  <= DEFAULT_FM_CTRL_t.SB_RESET_3;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(15 downto 0))) is
        when 65280 => --0xff00
          reg_data(65280)( 0)            <=  localWrData( 0);                --
          reg_data(65280)( 2 downto  1)  <=  localWrData( 2 downto  1);      --
          reg_data(65280)( 3)            <=  localWrData( 3);                --
        when 65281 => --0xff01
          reg_data(65281)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 65282 => --0xff02
          reg_data(65282)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 65283 => --0xff03
          reg_data(65283)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 65284 => --0xff04
          reg_data(65284)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 65285 => --0xff05
          reg_data(65285)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 65286 => --0xff06
          reg_data(65286)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 65287 => --0xff07
          reg_data(65287)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 65288 => --0xff08
          reg_data(65288)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 65289 => --0xff09
          reg_data(65289)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 65290 => --0xff0a
          reg_data(65290)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 65291 => --0xff0b
          reg_data(65291)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 65292 => --0xff0c
          reg_data(65292)(31 downto  0)  <=  localWrData(31 downto  0);      --

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;



  
  -------------------------------------------------------------------------------
  -- BRAM decoding
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------

  BRAM_reads: for iBRAM in 0 to BRAM_COUNT-1 generate
    BRAM_read: process (clk_axi,reset_axi_n) is
    begin  -- process BRAM_reads
      if reset_axi_n = '0' then
--        latchBRAM(iBRAM) <= '0';
        BRAM_MOSI(iBRAM).enable  <= '0';
      elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
        BRAM_MOSI(iBRAM).address <= localAddress;
--        latchBRAM(iBRAM) <= '0';
        BRAM_MOSI(iBRAM).enable  <= '0';
        if localAddress(15 downto BRAM_range(iBRAM)) = BRAM_addr(iBRAM)(15 downto BRAM_range(iBRAM)) then
--          latchBRAM(iBRAM) <= localRdReq;
--          BRAM_MOSI(iBRAM).enable  <= '1';
          BRAM_MOSI(iBRAM).enable  <= localRdReq;
        end if;
      end if;
    end process BRAM_read;
  end generate BRAM_reads;



  BRAM_asyncs: for iBRAM in 0 to BRAM_COUNT-1 generate
    BRAM_MOSI(iBRAM).clk     <= clk_axi;
    BRAM_MOSI(iBRAM).wr_data <= localWrData;
  end generate BRAM_asyncs;
  
  Ctrl.SB0.SB_MEM.clk       <=  BRAM_MOSI(0).clk;
  Ctrl.SB0.SB_MEM.enable    <=  BRAM_MOSI(0).enable;
  Ctrl.SB0.SB_MEM.wr_enable <=  BRAM_MOSI(0).wr_enable;
  Ctrl.SB0.SB_MEM.address   <=  BRAM_MOSI(0).address(9-1 downto 0);
  Ctrl.SB0.SB_MEM.wr_data   <=  BRAM_MOSI(0).wr_data(32-1 downto 0);

  Ctrl.SB1.SB_MEM.clk       <=  BRAM_MOSI(1).clk;
  Ctrl.SB1.SB_MEM.enable    <=  BRAM_MOSI(1).enable;
  Ctrl.SB1.SB_MEM.wr_enable <=  BRAM_MOSI(1).wr_enable;
  Ctrl.SB1.SB_MEM.address   <=  BRAM_MOSI(1).address(9-1 downto 0);
  Ctrl.SB1.SB_MEM.wr_data   <=  BRAM_MOSI(1).wr_data(32-1 downto 0);

  Ctrl.SB2.SB_MEM.clk       <=  BRAM_MOSI(2).clk;
  Ctrl.SB2.SB_MEM.enable    <=  BRAM_MOSI(2).enable;
  Ctrl.SB2.SB_MEM.wr_enable <=  BRAM_MOSI(2).wr_enable;
  Ctrl.SB2.SB_MEM.address   <=  BRAM_MOSI(2).address(9-1 downto 0);
  Ctrl.SB2.SB_MEM.wr_data   <=  BRAM_MOSI(2).wr_data(32-1 downto 0);

  Ctrl.SB3.SB_MEM.clk       <=  BRAM_MOSI(3).clk;
  Ctrl.SB3.SB_MEM.enable    <=  BRAM_MOSI(3).enable;
  Ctrl.SB3.SB_MEM.wr_enable <=  BRAM_MOSI(3).wr_enable;
  Ctrl.SB3.SB_MEM.address   <=  BRAM_MOSI(3).address(9-1 downto 0);
  Ctrl.SB3.SB_MEM.wr_data   <=  BRAM_MOSI(3).wr_data(32-1 downto 0);

  Ctrl.SB4.SB_MEM.clk       <=  BRAM_MOSI(4).clk;
  Ctrl.SB4.SB_MEM.enable    <=  BRAM_MOSI(4).enable;
  Ctrl.SB4.SB_MEM.wr_enable <=  BRAM_MOSI(4).wr_enable;
  Ctrl.SB4.SB_MEM.address   <=  BRAM_MOSI(4).address(9-1 downto 0);
  Ctrl.SB4.SB_MEM.wr_data   <=  BRAM_MOSI(4).wr_data(32-1 downto 0);

  Ctrl.SB5.SB_MEM.clk       <=  BRAM_MOSI(5).clk;
  Ctrl.SB5.SB_MEM.enable    <=  BRAM_MOSI(5).enable;
  Ctrl.SB5.SB_MEM.wr_enable <=  BRAM_MOSI(5).wr_enable;
  Ctrl.SB5.SB_MEM.address   <=  BRAM_MOSI(5).address(9-1 downto 0);
  Ctrl.SB5.SB_MEM.wr_data   <=  BRAM_MOSI(5).wr_data(32-1 downto 0);

  Ctrl.SB6.SB_MEM.clk       <=  BRAM_MOSI(6).clk;
  Ctrl.SB6.SB_MEM.enable    <=  BRAM_MOSI(6).enable;
  Ctrl.SB6.SB_MEM.wr_enable <=  BRAM_MOSI(6).wr_enable;
  Ctrl.SB6.SB_MEM.address   <=  BRAM_MOSI(6).address(9-1 downto 0);
  Ctrl.SB6.SB_MEM.wr_data   <=  BRAM_MOSI(6).wr_data(32-1 downto 0);

  Ctrl.SB7.SB_MEM.clk       <=  BRAM_MOSI(7).clk;
  Ctrl.SB7.SB_MEM.enable    <=  BRAM_MOSI(7).enable;
  Ctrl.SB7.SB_MEM.wr_enable <=  BRAM_MOSI(7).wr_enable;
  Ctrl.SB7.SB_MEM.address   <=  BRAM_MOSI(7).address(9-1 downto 0);
  Ctrl.SB7.SB_MEM.wr_data   <=  BRAM_MOSI(7).wr_data(32-1 downto 0);

  Ctrl.SB8.SB_MEM.clk       <=  BRAM_MOSI(8).clk;
  Ctrl.SB8.SB_MEM.enable    <=  BRAM_MOSI(8).enable;
  Ctrl.SB8.SB_MEM.wr_enable <=  BRAM_MOSI(8).wr_enable;
  Ctrl.SB8.SB_MEM.address   <=  BRAM_MOSI(8).address(9-1 downto 0);
  Ctrl.SB8.SB_MEM.wr_data   <=  BRAM_MOSI(8).wr_data(32-1 downto 0);

  Ctrl.SB9.SB_MEM.clk       <=  BRAM_MOSI(9).clk;
  Ctrl.SB9.SB_MEM.enable    <=  BRAM_MOSI(9).enable;
  Ctrl.SB9.SB_MEM.wr_enable <=  BRAM_MOSI(9).wr_enable;
  Ctrl.SB9.SB_MEM.address   <=  BRAM_MOSI(9).address(9-1 downto 0);
  Ctrl.SB9.SB_MEM.wr_data   <=  BRAM_MOSI(9).wr_data(32-1 downto 0);

  Ctrl.SB10.SB_MEM.clk       <=  BRAM_MOSI(10).clk;
  Ctrl.SB10.SB_MEM.enable    <=  BRAM_MOSI(10).enable;
  Ctrl.SB10.SB_MEM.wr_enable <=  BRAM_MOSI(10).wr_enable;
  Ctrl.SB10.SB_MEM.address   <=  BRAM_MOSI(10).address(9-1 downto 0);
  Ctrl.SB10.SB_MEM.wr_data   <=  BRAM_MOSI(10).wr_data(32-1 downto 0);

  Ctrl.SB11.SB_MEM.clk       <=  BRAM_MOSI(11).clk;
  Ctrl.SB11.SB_MEM.enable    <=  BRAM_MOSI(11).enable;
  Ctrl.SB11.SB_MEM.wr_enable <=  BRAM_MOSI(11).wr_enable;
  Ctrl.SB11.SB_MEM.address   <=  BRAM_MOSI(11).address(9-1 downto 0);
  Ctrl.SB11.SB_MEM.wr_data   <=  BRAM_MOSI(11).wr_data(32-1 downto 0);

  Ctrl.SB12.SB_MEM.clk       <=  BRAM_MOSI(12).clk;
  Ctrl.SB12.SB_MEM.enable    <=  BRAM_MOSI(12).enable;
  Ctrl.SB12.SB_MEM.wr_enable <=  BRAM_MOSI(12).wr_enable;
  Ctrl.SB12.SB_MEM.address   <=  BRAM_MOSI(12).address(9-1 downto 0);
  Ctrl.SB12.SB_MEM.wr_data   <=  BRAM_MOSI(12).wr_data(32-1 downto 0);

  Ctrl.SB13.SB_MEM.clk       <=  BRAM_MOSI(13).clk;
  Ctrl.SB13.SB_MEM.enable    <=  BRAM_MOSI(13).enable;
  Ctrl.SB13.SB_MEM.wr_enable <=  BRAM_MOSI(13).wr_enable;
  Ctrl.SB13.SB_MEM.address   <=  BRAM_MOSI(13).address(9-1 downto 0);
  Ctrl.SB13.SB_MEM.wr_data   <=  BRAM_MOSI(13).wr_data(32-1 downto 0);

  Ctrl.SB14.SB_MEM.clk       <=  BRAM_MOSI(14).clk;
  Ctrl.SB14.SB_MEM.enable    <=  BRAM_MOSI(14).enable;
  Ctrl.SB14.SB_MEM.wr_enable <=  BRAM_MOSI(14).wr_enable;
  Ctrl.SB14.SB_MEM.address   <=  BRAM_MOSI(14).address(9-1 downto 0);
  Ctrl.SB14.SB_MEM.wr_data   <=  BRAM_MOSI(14).wr_data(32-1 downto 0);

  Ctrl.SB15.SB_MEM.clk       <=  BRAM_MOSI(15).clk;
  Ctrl.SB15.SB_MEM.enable    <=  BRAM_MOSI(15).enable;
  Ctrl.SB15.SB_MEM.wr_enable <=  BRAM_MOSI(15).wr_enable;
  Ctrl.SB15.SB_MEM.address   <=  BRAM_MOSI(15).address(9-1 downto 0);
  Ctrl.SB15.SB_MEM.wr_data   <=  BRAM_MOSI(15).wr_data(32-1 downto 0);

  Ctrl.SB16.SB_MEM.clk       <=  BRAM_MOSI(16).clk;
  Ctrl.SB16.SB_MEM.enable    <=  BRAM_MOSI(16).enable;
  Ctrl.SB16.SB_MEM.wr_enable <=  BRAM_MOSI(16).wr_enable;
  Ctrl.SB16.SB_MEM.address   <=  BRAM_MOSI(16).address(9-1 downto 0);
  Ctrl.SB16.SB_MEM.wr_data   <=  BRAM_MOSI(16).wr_data(32-1 downto 0);

  Ctrl.SB17.SB_MEM.clk       <=  BRAM_MOSI(17).clk;
  Ctrl.SB17.SB_MEM.enable    <=  BRAM_MOSI(17).enable;
  Ctrl.SB17.SB_MEM.wr_enable <=  BRAM_MOSI(17).wr_enable;
  Ctrl.SB17.SB_MEM.address   <=  BRAM_MOSI(17).address(9-1 downto 0);
  Ctrl.SB17.SB_MEM.wr_data   <=  BRAM_MOSI(17).wr_data(32-1 downto 0);

  Ctrl.SB18.SB_MEM.clk       <=  BRAM_MOSI(18).clk;
  Ctrl.SB18.SB_MEM.enable    <=  BRAM_MOSI(18).enable;
  Ctrl.SB18.SB_MEM.wr_enable <=  BRAM_MOSI(18).wr_enable;
  Ctrl.SB18.SB_MEM.address   <=  BRAM_MOSI(18).address(9-1 downto 0);
  Ctrl.SB18.SB_MEM.wr_data   <=  BRAM_MOSI(18).wr_data(32-1 downto 0);

  Ctrl.SB19.SB_MEM.clk       <=  BRAM_MOSI(19).clk;
  Ctrl.SB19.SB_MEM.enable    <=  BRAM_MOSI(19).enable;
  Ctrl.SB19.SB_MEM.wr_enable <=  BRAM_MOSI(19).wr_enable;
  Ctrl.SB19.SB_MEM.address   <=  BRAM_MOSI(19).address(9-1 downto 0);
  Ctrl.SB19.SB_MEM.wr_data   <=  BRAM_MOSI(19).wr_data(32-1 downto 0);

  Ctrl.SB20.SB_MEM.clk       <=  BRAM_MOSI(20).clk;
  Ctrl.SB20.SB_MEM.enable    <=  BRAM_MOSI(20).enable;
  Ctrl.SB20.SB_MEM.wr_enable <=  BRAM_MOSI(20).wr_enable;
  Ctrl.SB20.SB_MEM.address   <=  BRAM_MOSI(20).address(9-1 downto 0);
  Ctrl.SB20.SB_MEM.wr_data   <=  BRAM_MOSI(20).wr_data(32-1 downto 0);

  Ctrl.SB21.SB_MEM.clk       <=  BRAM_MOSI(21).clk;
  Ctrl.SB21.SB_MEM.enable    <=  BRAM_MOSI(21).enable;
  Ctrl.SB21.SB_MEM.wr_enable <=  BRAM_MOSI(21).wr_enable;
  Ctrl.SB21.SB_MEM.address   <=  BRAM_MOSI(21).address(9-1 downto 0);
  Ctrl.SB21.SB_MEM.wr_data   <=  BRAM_MOSI(21).wr_data(32-1 downto 0);

  Ctrl.SB22.SB_MEM.clk       <=  BRAM_MOSI(22).clk;
  Ctrl.SB22.SB_MEM.enable    <=  BRAM_MOSI(22).enable;
  Ctrl.SB22.SB_MEM.wr_enable <=  BRAM_MOSI(22).wr_enable;
  Ctrl.SB22.SB_MEM.address   <=  BRAM_MOSI(22).address(9-1 downto 0);
  Ctrl.SB22.SB_MEM.wr_data   <=  BRAM_MOSI(22).wr_data(32-1 downto 0);

  Ctrl.SB23.SB_MEM.clk       <=  BRAM_MOSI(23).clk;
  Ctrl.SB23.SB_MEM.enable    <=  BRAM_MOSI(23).enable;
  Ctrl.SB23.SB_MEM.wr_enable <=  BRAM_MOSI(23).wr_enable;
  Ctrl.SB23.SB_MEM.address   <=  BRAM_MOSI(23).address(9-1 downto 0);
  Ctrl.SB23.SB_MEM.wr_data   <=  BRAM_MOSI(23).wr_data(32-1 downto 0);

  Ctrl.SB24.SB_MEM.clk       <=  BRAM_MOSI(24).clk;
  Ctrl.SB24.SB_MEM.enable    <=  BRAM_MOSI(24).enable;
  Ctrl.SB24.SB_MEM.wr_enable <=  BRAM_MOSI(24).wr_enable;
  Ctrl.SB24.SB_MEM.address   <=  BRAM_MOSI(24).address(9-1 downto 0);
  Ctrl.SB24.SB_MEM.wr_data   <=  BRAM_MOSI(24).wr_data(32-1 downto 0);

  Ctrl.SB25.SB_MEM.clk       <=  BRAM_MOSI(25).clk;
  Ctrl.SB25.SB_MEM.enable    <=  BRAM_MOSI(25).enable;
  Ctrl.SB25.SB_MEM.wr_enable <=  BRAM_MOSI(25).wr_enable;
  Ctrl.SB25.SB_MEM.address   <=  BRAM_MOSI(25).address(9-1 downto 0);
  Ctrl.SB25.SB_MEM.wr_data   <=  BRAM_MOSI(25).wr_data(32-1 downto 0);

  Ctrl.SB26.SB_MEM.clk       <=  BRAM_MOSI(26).clk;
  Ctrl.SB26.SB_MEM.enable    <=  BRAM_MOSI(26).enable;
  Ctrl.SB26.SB_MEM.wr_enable <=  BRAM_MOSI(26).wr_enable;
  Ctrl.SB26.SB_MEM.address   <=  BRAM_MOSI(26).address(9-1 downto 0);
  Ctrl.SB26.SB_MEM.wr_data   <=  BRAM_MOSI(26).wr_data(32-1 downto 0);

  Ctrl.SB27.SB_MEM.clk       <=  BRAM_MOSI(27).clk;
  Ctrl.SB27.SB_MEM.enable    <=  BRAM_MOSI(27).enable;
  Ctrl.SB27.SB_MEM.wr_enable <=  BRAM_MOSI(27).wr_enable;
  Ctrl.SB27.SB_MEM.address   <=  BRAM_MOSI(27).address(9-1 downto 0);
  Ctrl.SB27.SB_MEM.wr_data   <=  BRAM_MOSI(27).wr_data(32-1 downto 0);

  Ctrl.SB28.SB_MEM.clk       <=  BRAM_MOSI(28).clk;
  Ctrl.SB28.SB_MEM.enable    <=  BRAM_MOSI(28).enable;
  Ctrl.SB28.SB_MEM.wr_enable <=  BRAM_MOSI(28).wr_enable;
  Ctrl.SB28.SB_MEM.address   <=  BRAM_MOSI(28).address(9-1 downto 0);
  Ctrl.SB28.SB_MEM.wr_data   <=  BRAM_MOSI(28).wr_data(32-1 downto 0);

  Ctrl.SB29.SB_MEM.clk       <=  BRAM_MOSI(29).clk;
  Ctrl.SB29.SB_MEM.enable    <=  BRAM_MOSI(29).enable;
  Ctrl.SB29.SB_MEM.wr_enable <=  BRAM_MOSI(29).wr_enable;
  Ctrl.SB29.SB_MEM.address   <=  BRAM_MOSI(29).address(9-1 downto 0);
  Ctrl.SB29.SB_MEM.wr_data   <=  BRAM_MOSI(29).wr_data(32-1 downto 0);

  Ctrl.SB30.SB_MEM.clk       <=  BRAM_MOSI(30).clk;
  Ctrl.SB30.SB_MEM.enable    <=  BRAM_MOSI(30).enable;
  Ctrl.SB30.SB_MEM.wr_enable <=  BRAM_MOSI(30).wr_enable;
  Ctrl.SB30.SB_MEM.address   <=  BRAM_MOSI(30).address(9-1 downto 0);
  Ctrl.SB30.SB_MEM.wr_data   <=  BRAM_MOSI(30).wr_data(32-1 downto 0);

  Ctrl.SB31.SB_MEM.clk       <=  BRAM_MOSI(31).clk;
  Ctrl.SB31.SB_MEM.enable    <=  BRAM_MOSI(31).enable;
  Ctrl.SB31.SB_MEM.wr_enable <=  BRAM_MOSI(31).wr_enable;
  Ctrl.SB31.SB_MEM.address   <=  BRAM_MOSI(31).address(9-1 downto 0);
  Ctrl.SB31.SB_MEM.wr_data   <=  BRAM_MOSI(31).wr_data(32-1 downto 0);

  Ctrl.SB32.SB_MEM.clk       <=  BRAM_MOSI(32).clk;
  Ctrl.SB32.SB_MEM.enable    <=  BRAM_MOSI(32).enable;
  Ctrl.SB32.SB_MEM.wr_enable <=  BRAM_MOSI(32).wr_enable;
  Ctrl.SB32.SB_MEM.address   <=  BRAM_MOSI(32).address(9-1 downto 0);
  Ctrl.SB32.SB_MEM.wr_data   <=  BRAM_MOSI(32).wr_data(32-1 downto 0);

  Ctrl.SB33.SB_MEM.clk       <=  BRAM_MOSI(33).clk;
  Ctrl.SB33.SB_MEM.enable    <=  BRAM_MOSI(33).enable;
  Ctrl.SB33.SB_MEM.wr_enable <=  BRAM_MOSI(33).wr_enable;
  Ctrl.SB33.SB_MEM.address   <=  BRAM_MOSI(33).address(9-1 downto 0);
  Ctrl.SB33.SB_MEM.wr_data   <=  BRAM_MOSI(33).wr_data(32-1 downto 0);

  Ctrl.SB34.SB_MEM.clk       <=  BRAM_MOSI(34).clk;
  Ctrl.SB34.SB_MEM.enable    <=  BRAM_MOSI(34).enable;
  Ctrl.SB34.SB_MEM.wr_enable <=  BRAM_MOSI(34).wr_enable;
  Ctrl.SB34.SB_MEM.address   <=  BRAM_MOSI(34).address(9-1 downto 0);
  Ctrl.SB34.SB_MEM.wr_data   <=  BRAM_MOSI(34).wr_data(32-1 downto 0);

  Ctrl.SB35.SB_MEM.clk       <=  BRAM_MOSI(35).clk;
  Ctrl.SB35.SB_MEM.enable    <=  BRAM_MOSI(35).enable;
  Ctrl.SB35.SB_MEM.wr_enable <=  BRAM_MOSI(35).wr_enable;
  Ctrl.SB35.SB_MEM.address   <=  BRAM_MOSI(35).address(9-1 downto 0);
  Ctrl.SB35.SB_MEM.wr_data   <=  BRAM_MOSI(35).wr_data(32-1 downto 0);

  Ctrl.SB36.SB_MEM.clk       <=  BRAM_MOSI(36).clk;
  Ctrl.SB36.SB_MEM.enable    <=  BRAM_MOSI(36).enable;
  Ctrl.SB36.SB_MEM.wr_enable <=  BRAM_MOSI(36).wr_enable;
  Ctrl.SB36.SB_MEM.address   <=  BRAM_MOSI(36).address(9-1 downto 0);
  Ctrl.SB36.SB_MEM.wr_data   <=  BRAM_MOSI(36).wr_data(32-1 downto 0);

  Ctrl.SB37.SB_MEM.clk       <=  BRAM_MOSI(37).clk;
  Ctrl.SB37.SB_MEM.enable    <=  BRAM_MOSI(37).enable;
  Ctrl.SB37.SB_MEM.wr_enable <=  BRAM_MOSI(37).wr_enable;
  Ctrl.SB37.SB_MEM.address   <=  BRAM_MOSI(37).address(9-1 downto 0);
  Ctrl.SB37.SB_MEM.wr_data   <=  BRAM_MOSI(37).wr_data(32-1 downto 0);

  Ctrl.SB38.SB_MEM.clk       <=  BRAM_MOSI(38).clk;
  Ctrl.SB38.SB_MEM.enable    <=  BRAM_MOSI(38).enable;
  Ctrl.SB38.SB_MEM.wr_enable <=  BRAM_MOSI(38).wr_enable;
  Ctrl.SB38.SB_MEM.address   <=  BRAM_MOSI(38).address(9-1 downto 0);
  Ctrl.SB38.SB_MEM.wr_data   <=  BRAM_MOSI(38).wr_data(32-1 downto 0);

  Ctrl.SB39.SB_MEM.clk       <=  BRAM_MOSI(39).clk;
  Ctrl.SB39.SB_MEM.enable    <=  BRAM_MOSI(39).enable;
  Ctrl.SB39.SB_MEM.wr_enable <=  BRAM_MOSI(39).wr_enable;
  Ctrl.SB39.SB_MEM.address   <=  BRAM_MOSI(39).address(9-1 downto 0);
  Ctrl.SB39.SB_MEM.wr_data   <=  BRAM_MOSI(39).wr_data(32-1 downto 0);

  Ctrl.SB40.SB_MEM.clk       <=  BRAM_MOSI(40).clk;
  Ctrl.SB40.SB_MEM.enable    <=  BRAM_MOSI(40).enable;
  Ctrl.SB40.SB_MEM.wr_enable <=  BRAM_MOSI(40).wr_enable;
  Ctrl.SB40.SB_MEM.address   <=  BRAM_MOSI(40).address(9-1 downto 0);
  Ctrl.SB40.SB_MEM.wr_data   <=  BRAM_MOSI(40).wr_data(32-1 downto 0);

  Ctrl.SB41.SB_MEM.clk       <=  BRAM_MOSI(41).clk;
  Ctrl.SB41.SB_MEM.enable    <=  BRAM_MOSI(41).enable;
  Ctrl.SB41.SB_MEM.wr_enable <=  BRAM_MOSI(41).wr_enable;
  Ctrl.SB41.SB_MEM.address   <=  BRAM_MOSI(41).address(9-1 downto 0);
  Ctrl.SB41.SB_MEM.wr_data   <=  BRAM_MOSI(41).wr_data(32-1 downto 0);

  Ctrl.SB42.SB_MEM.clk       <=  BRAM_MOSI(42).clk;
  Ctrl.SB42.SB_MEM.enable    <=  BRAM_MOSI(42).enable;
  Ctrl.SB42.SB_MEM.wr_enable <=  BRAM_MOSI(42).wr_enable;
  Ctrl.SB42.SB_MEM.address   <=  BRAM_MOSI(42).address(9-1 downto 0);
  Ctrl.SB42.SB_MEM.wr_data   <=  BRAM_MOSI(42).wr_data(32-1 downto 0);

  Ctrl.SB43.SB_MEM.clk       <=  BRAM_MOSI(43).clk;
  Ctrl.SB43.SB_MEM.enable    <=  BRAM_MOSI(43).enable;
  Ctrl.SB43.SB_MEM.wr_enable <=  BRAM_MOSI(43).wr_enable;
  Ctrl.SB43.SB_MEM.address   <=  BRAM_MOSI(43).address(9-1 downto 0);
  Ctrl.SB43.SB_MEM.wr_data   <=  BRAM_MOSI(43).wr_data(32-1 downto 0);

  Ctrl.SB44.SB_MEM.clk       <=  BRAM_MOSI(44).clk;
  Ctrl.SB44.SB_MEM.enable    <=  BRAM_MOSI(44).enable;
  Ctrl.SB44.SB_MEM.wr_enable <=  BRAM_MOSI(44).wr_enable;
  Ctrl.SB44.SB_MEM.address   <=  BRAM_MOSI(44).address(9-1 downto 0);
  Ctrl.SB44.SB_MEM.wr_data   <=  BRAM_MOSI(44).wr_data(32-1 downto 0);

  Ctrl.SB45.SB_MEM.clk       <=  BRAM_MOSI(45).clk;
  Ctrl.SB45.SB_MEM.enable    <=  BRAM_MOSI(45).enable;
  Ctrl.SB45.SB_MEM.wr_enable <=  BRAM_MOSI(45).wr_enable;
  Ctrl.SB45.SB_MEM.address   <=  BRAM_MOSI(45).address(9-1 downto 0);
  Ctrl.SB45.SB_MEM.wr_data   <=  BRAM_MOSI(45).wr_data(32-1 downto 0);

  Ctrl.SB46.SB_MEM.clk       <=  BRAM_MOSI(46).clk;
  Ctrl.SB46.SB_MEM.enable    <=  BRAM_MOSI(46).enable;
  Ctrl.SB46.SB_MEM.wr_enable <=  BRAM_MOSI(46).wr_enable;
  Ctrl.SB46.SB_MEM.address   <=  BRAM_MOSI(46).address(9-1 downto 0);
  Ctrl.SB46.SB_MEM.wr_data   <=  BRAM_MOSI(46).wr_data(32-1 downto 0);

  Ctrl.SB47.SB_MEM.clk       <=  BRAM_MOSI(47).clk;
  Ctrl.SB47.SB_MEM.enable    <=  BRAM_MOSI(47).enable;
  Ctrl.SB47.SB_MEM.wr_enable <=  BRAM_MOSI(47).wr_enable;
  Ctrl.SB47.SB_MEM.address   <=  BRAM_MOSI(47).address(9-1 downto 0);
  Ctrl.SB47.SB_MEM.wr_data   <=  BRAM_MOSI(47).wr_data(32-1 downto 0);

  Ctrl.SB48.SB_MEM.clk       <=  BRAM_MOSI(48).clk;
  Ctrl.SB48.SB_MEM.enable    <=  BRAM_MOSI(48).enable;
  Ctrl.SB48.SB_MEM.wr_enable <=  BRAM_MOSI(48).wr_enable;
  Ctrl.SB48.SB_MEM.address   <=  BRAM_MOSI(48).address(9-1 downto 0);
  Ctrl.SB48.SB_MEM.wr_data   <=  BRAM_MOSI(48).wr_data(32-1 downto 0);

  Ctrl.SB49.SB_MEM.clk       <=  BRAM_MOSI(49).clk;
  Ctrl.SB49.SB_MEM.enable    <=  BRAM_MOSI(49).enable;
  Ctrl.SB49.SB_MEM.wr_enable <=  BRAM_MOSI(49).wr_enable;
  Ctrl.SB49.SB_MEM.address   <=  BRAM_MOSI(49).address(9-1 downto 0);
  Ctrl.SB49.SB_MEM.wr_data   <=  BRAM_MOSI(49).wr_data(32-1 downto 0);

  Ctrl.SB50.SB_MEM.clk       <=  BRAM_MOSI(50).clk;
  Ctrl.SB50.SB_MEM.enable    <=  BRAM_MOSI(50).enable;
  Ctrl.SB50.SB_MEM.wr_enable <=  BRAM_MOSI(50).wr_enable;
  Ctrl.SB50.SB_MEM.address   <=  BRAM_MOSI(50).address(9-1 downto 0);
  Ctrl.SB50.SB_MEM.wr_data   <=  BRAM_MOSI(50).wr_data(32-1 downto 0);

  Ctrl.SB51.SB_MEM.clk       <=  BRAM_MOSI(51).clk;
  Ctrl.SB51.SB_MEM.enable    <=  BRAM_MOSI(51).enable;
  Ctrl.SB51.SB_MEM.wr_enable <=  BRAM_MOSI(51).wr_enable;
  Ctrl.SB51.SB_MEM.address   <=  BRAM_MOSI(51).address(9-1 downto 0);
  Ctrl.SB51.SB_MEM.wr_data   <=  BRAM_MOSI(51).wr_data(32-1 downto 0);

  Ctrl.SB52.SB_MEM.clk       <=  BRAM_MOSI(52).clk;
  Ctrl.SB52.SB_MEM.enable    <=  BRAM_MOSI(52).enable;
  Ctrl.SB52.SB_MEM.wr_enable <=  BRAM_MOSI(52).wr_enable;
  Ctrl.SB52.SB_MEM.address   <=  BRAM_MOSI(52).address(9-1 downto 0);
  Ctrl.SB52.SB_MEM.wr_data   <=  BRAM_MOSI(52).wr_data(32-1 downto 0);

  Ctrl.SB53.SB_MEM.clk       <=  BRAM_MOSI(53).clk;
  Ctrl.SB53.SB_MEM.enable    <=  BRAM_MOSI(53).enable;
  Ctrl.SB53.SB_MEM.wr_enable <=  BRAM_MOSI(53).wr_enable;
  Ctrl.SB53.SB_MEM.address   <=  BRAM_MOSI(53).address(9-1 downto 0);
  Ctrl.SB53.SB_MEM.wr_data   <=  BRAM_MOSI(53).wr_data(32-1 downto 0);

  Ctrl.SB54.SB_MEM.clk       <=  BRAM_MOSI(54).clk;
  Ctrl.SB54.SB_MEM.enable    <=  BRAM_MOSI(54).enable;
  Ctrl.SB54.SB_MEM.wr_enable <=  BRAM_MOSI(54).wr_enable;
  Ctrl.SB54.SB_MEM.address   <=  BRAM_MOSI(54).address(9-1 downto 0);
  Ctrl.SB54.SB_MEM.wr_data   <=  BRAM_MOSI(54).wr_data(32-1 downto 0);

  Ctrl.SB55.SB_MEM.clk       <=  BRAM_MOSI(55).clk;
  Ctrl.SB55.SB_MEM.enable    <=  BRAM_MOSI(55).enable;
  Ctrl.SB55.SB_MEM.wr_enable <=  BRAM_MOSI(55).wr_enable;
  Ctrl.SB55.SB_MEM.address   <=  BRAM_MOSI(55).address(9-1 downto 0);
  Ctrl.SB55.SB_MEM.wr_data   <=  BRAM_MOSI(55).wr_data(32-1 downto 0);

  Ctrl.SB56.SB_MEM.clk       <=  BRAM_MOSI(56).clk;
  Ctrl.SB56.SB_MEM.enable    <=  BRAM_MOSI(56).enable;
  Ctrl.SB56.SB_MEM.wr_enable <=  BRAM_MOSI(56).wr_enable;
  Ctrl.SB56.SB_MEM.address   <=  BRAM_MOSI(56).address(9-1 downto 0);
  Ctrl.SB56.SB_MEM.wr_data   <=  BRAM_MOSI(56).wr_data(32-1 downto 0);

  Ctrl.SB57.SB_MEM.clk       <=  BRAM_MOSI(57).clk;
  Ctrl.SB57.SB_MEM.enable    <=  BRAM_MOSI(57).enable;
  Ctrl.SB57.SB_MEM.wr_enable <=  BRAM_MOSI(57).wr_enable;
  Ctrl.SB57.SB_MEM.address   <=  BRAM_MOSI(57).address(9-1 downto 0);
  Ctrl.SB57.SB_MEM.wr_data   <=  BRAM_MOSI(57).wr_data(32-1 downto 0);

  Ctrl.SB58.SB_MEM.clk       <=  BRAM_MOSI(58).clk;
  Ctrl.SB58.SB_MEM.enable    <=  BRAM_MOSI(58).enable;
  Ctrl.SB58.SB_MEM.wr_enable <=  BRAM_MOSI(58).wr_enable;
  Ctrl.SB58.SB_MEM.address   <=  BRAM_MOSI(58).address(9-1 downto 0);
  Ctrl.SB58.SB_MEM.wr_data   <=  BRAM_MOSI(58).wr_data(32-1 downto 0);

  Ctrl.SB59.SB_MEM.clk       <=  BRAM_MOSI(59).clk;
  Ctrl.SB59.SB_MEM.enable    <=  BRAM_MOSI(59).enable;
  Ctrl.SB59.SB_MEM.wr_enable <=  BRAM_MOSI(59).wr_enable;
  Ctrl.SB59.SB_MEM.address   <=  BRAM_MOSI(59).address(9-1 downto 0);
  Ctrl.SB59.SB_MEM.wr_data   <=  BRAM_MOSI(59).wr_data(32-1 downto 0);

  Ctrl.SB60.SB_MEM.clk       <=  BRAM_MOSI(60).clk;
  Ctrl.SB60.SB_MEM.enable    <=  BRAM_MOSI(60).enable;
  Ctrl.SB60.SB_MEM.wr_enable <=  BRAM_MOSI(60).wr_enable;
  Ctrl.SB60.SB_MEM.address   <=  BRAM_MOSI(60).address(9-1 downto 0);
  Ctrl.SB60.SB_MEM.wr_data   <=  BRAM_MOSI(60).wr_data(32-1 downto 0);

  Ctrl.SB61.SB_MEM.clk       <=  BRAM_MOSI(61).clk;
  Ctrl.SB61.SB_MEM.enable    <=  BRAM_MOSI(61).enable;
  Ctrl.SB61.SB_MEM.wr_enable <=  BRAM_MOSI(61).wr_enable;
  Ctrl.SB61.SB_MEM.address   <=  BRAM_MOSI(61).address(9-1 downto 0);
  Ctrl.SB61.SB_MEM.wr_data   <=  BRAM_MOSI(61).wr_data(32-1 downto 0);

  Ctrl.SB62.SB_MEM.clk       <=  BRAM_MOSI(62).clk;
  Ctrl.SB62.SB_MEM.enable    <=  BRAM_MOSI(62).enable;
  Ctrl.SB62.SB_MEM.wr_enable <=  BRAM_MOSI(62).wr_enable;
  Ctrl.SB62.SB_MEM.address   <=  BRAM_MOSI(62).address(9-1 downto 0);
  Ctrl.SB62.SB_MEM.wr_data   <=  BRAM_MOSI(62).wr_data(32-1 downto 0);

  Ctrl.SB63.SB_MEM.clk       <=  BRAM_MOSI(63).clk;
  Ctrl.SB63.SB_MEM.enable    <=  BRAM_MOSI(63).enable;
  Ctrl.SB63.SB_MEM.wr_enable <=  BRAM_MOSI(63).wr_enable;
  Ctrl.SB63.SB_MEM.address   <=  BRAM_MOSI(63).address(9-1 downto 0);
  Ctrl.SB63.SB_MEM.wr_data   <=  BRAM_MOSI(63).wr_data(32-1 downto 0);

  Ctrl.SB64.SB_MEM.clk       <=  BRAM_MOSI(64).clk;
  Ctrl.SB64.SB_MEM.enable    <=  BRAM_MOSI(64).enable;
  Ctrl.SB64.SB_MEM.wr_enable <=  BRAM_MOSI(64).wr_enable;
  Ctrl.SB64.SB_MEM.address   <=  BRAM_MOSI(64).address(9-1 downto 0);
  Ctrl.SB64.SB_MEM.wr_data   <=  BRAM_MOSI(64).wr_data(32-1 downto 0);

  Ctrl.SB65.SB_MEM.clk       <=  BRAM_MOSI(65).clk;
  Ctrl.SB65.SB_MEM.enable    <=  BRAM_MOSI(65).enable;
  Ctrl.SB65.SB_MEM.wr_enable <=  BRAM_MOSI(65).wr_enable;
  Ctrl.SB65.SB_MEM.address   <=  BRAM_MOSI(65).address(9-1 downto 0);
  Ctrl.SB65.SB_MEM.wr_data   <=  BRAM_MOSI(65).wr_data(32-1 downto 0);

  Ctrl.SB66.SB_MEM.clk       <=  BRAM_MOSI(66).clk;
  Ctrl.SB66.SB_MEM.enable    <=  BRAM_MOSI(66).enable;
  Ctrl.SB66.SB_MEM.wr_enable <=  BRAM_MOSI(66).wr_enable;
  Ctrl.SB66.SB_MEM.address   <=  BRAM_MOSI(66).address(9-1 downto 0);
  Ctrl.SB66.SB_MEM.wr_data   <=  BRAM_MOSI(66).wr_data(32-1 downto 0);

  Ctrl.SB67.SB_MEM.clk       <=  BRAM_MOSI(67).clk;
  Ctrl.SB67.SB_MEM.enable    <=  BRAM_MOSI(67).enable;
  Ctrl.SB67.SB_MEM.wr_enable <=  BRAM_MOSI(67).wr_enable;
  Ctrl.SB67.SB_MEM.address   <=  BRAM_MOSI(67).address(9-1 downto 0);
  Ctrl.SB67.SB_MEM.wr_data   <=  BRAM_MOSI(67).wr_data(32-1 downto 0);

  Ctrl.SB68.SB_MEM.clk       <=  BRAM_MOSI(68).clk;
  Ctrl.SB68.SB_MEM.enable    <=  BRAM_MOSI(68).enable;
  Ctrl.SB68.SB_MEM.wr_enable <=  BRAM_MOSI(68).wr_enable;
  Ctrl.SB68.SB_MEM.address   <=  BRAM_MOSI(68).address(9-1 downto 0);
  Ctrl.SB68.SB_MEM.wr_data   <=  BRAM_MOSI(68).wr_data(32-1 downto 0);

  Ctrl.SB69.SB_MEM.clk       <=  BRAM_MOSI(69).clk;
  Ctrl.SB69.SB_MEM.enable    <=  BRAM_MOSI(69).enable;
  Ctrl.SB69.SB_MEM.wr_enable <=  BRAM_MOSI(69).wr_enable;
  Ctrl.SB69.SB_MEM.address   <=  BRAM_MOSI(69).address(9-1 downto 0);
  Ctrl.SB69.SB_MEM.wr_data   <=  BRAM_MOSI(69).wr_data(32-1 downto 0);

  Ctrl.SB70.SB_MEM.clk       <=  BRAM_MOSI(70).clk;
  Ctrl.SB70.SB_MEM.enable    <=  BRAM_MOSI(70).enable;
  Ctrl.SB70.SB_MEM.wr_enable <=  BRAM_MOSI(70).wr_enable;
  Ctrl.SB70.SB_MEM.address   <=  BRAM_MOSI(70).address(9-1 downto 0);
  Ctrl.SB70.SB_MEM.wr_data   <=  BRAM_MOSI(70).wr_data(32-1 downto 0);

  Ctrl.SB71.SB_MEM.clk       <=  BRAM_MOSI(71).clk;
  Ctrl.SB71.SB_MEM.enable    <=  BRAM_MOSI(71).enable;
  Ctrl.SB71.SB_MEM.wr_enable <=  BRAM_MOSI(71).wr_enable;
  Ctrl.SB71.SB_MEM.address   <=  BRAM_MOSI(71).address(9-1 downto 0);
  Ctrl.SB71.SB_MEM.wr_data   <=  BRAM_MOSI(71).wr_data(32-1 downto 0);

  Ctrl.SB72.SB_MEM.clk       <=  BRAM_MOSI(72).clk;
  Ctrl.SB72.SB_MEM.enable    <=  BRAM_MOSI(72).enable;
  Ctrl.SB72.SB_MEM.wr_enable <=  BRAM_MOSI(72).wr_enable;
  Ctrl.SB72.SB_MEM.address   <=  BRAM_MOSI(72).address(9-1 downto 0);
  Ctrl.SB72.SB_MEM.wr_data   <=  BRAM_MOSI(72).wr_data(32-1 downto 0);

  Ctrl.SB73.SB_MEM.clk       <=  BRAM_MOSI(73).clk;
  Ctrl.SB73.SB_MEM.enable    <=  BRAM_MOSI(73).enable;
  Ctrl.SB73.SB_MEM.wr_enable <=  BRAM_MOSI(73).wr_enable;
  Ctrl.SB73.SB_MEM.address   <=  BRAM_MOSI(73).address(9-1 downto 0);
  Ctrl.SB73.SB_MEM.wr_data   <=  BRAM_MOSI(73).wr_data(32-1 downto 0);

  Ctrl.SB74.SB_MEM.clk       <=  BRAM_MOSI(74).clk;
  Ctrl.SB74.SB_MEM.enable    <=  BRAM_MOSI(74).enable;
  Ctrl.SB74.SB_MEM.wr_enable <=  BRAM_MOSI(74).wr_enable;
  Ctrl.SB74.SB_MEM.address   <=  BRAM_MOSI(74).address(9-1 downto 0);
  Ctrl.SB74.SB_MEM.wr_data   <=  BRAM_MOSI(74).wr_data(32-1 downto 0);

  Ctrl.SB75.SB_MEM.clk       <=  BRAM_MOSI(75).clk;
  Ctrl.SB75.SB_MEM.enable    <=  BRAM_MOSI(75).enable;
  Ctrl.SB75.SB_MEM.wr_enable <=  BRAM_MOSI(75).wr_enable;
  Ctrl.SB75.SB_MEM.address   <=  BRAM_MOSI(75).address(9-1 downto 0);
  Ctrl.SB75.SB_MEM.wr_data   <=  BRAM_MOSI(75).wr_data(32-1 downto 0);

  Ctrl.SB76.SB_MEM.clk       <=  BRAM_MOSI(76).clk;
  Ctrl.SB76.SB_MEM.enable    <=  BRAM_MOSI(76).enable;
  Ctrl.SB76.SB_MEM.wr_enable <=  BRAM_MOSI(76).wr_enable;
  Ctrl.SB76.SB_MEM.address   <=  BRAM_MOSI(76).address(9-1 downto 0);
  Ctrl.SB76.SB_MEM.wr_data   <=  BRAM_MOSI(76).wr_data(32-1 downto 0);

  Ctrl.SB77.SB_MEM.clk       <=  BRAM_MOSI(77).clk;
  Ctrl.SB77.SB_MEM.enable    <=  BRAM_MOSI(77).enable;
  Ctrl.SB77.SB_MEM.wr_enable <=  BRAM_MOSI(77).wr_enable;
  Ctrl.SB77.SB_MEM.address   <=  BRAM_MOSI(77).address(9-1 downto 0);
  Ctrl.SB77.SB_MEM.wr_data   <=  BRAM_MOSI(77).wr_data(32-1 downto 0);

  Ctrl.SB78.SB_MEM.clk       <=  BRAM_MOSI(78).clk;
  Ctrl.SB78.SB_MEM.enable    <=  BRAM_MOSI(78).enable;
  Ctrl.SB78.SB_MEM.wr_enable <=  BRAM_MOSI(78).wr_enable;
  Ctrl.SB78.SB_MEM.address   <=  BRAM_MOSI(78).address(9-1 downto 0);
  Ctrl.SB78.SB_MEM.wr_data   <=  BRAM_MOSI(78).wr_data(32-1 downto 0);

  Ctrl.SB79.SB_MEM.clk       <=  BRAM_MOSI(79).clk;
  Ctrl.SB79.SB_MEM.enable    <=  BRAM_MOSI(79).enable;
  Ctrl.SB79.SB_MEM.wr_enable <=  BRAM_MOSI(79).wr_enable;
  Ctrl.SB79.SB_MEM.address   <=  BRAM_MOSI(79).address(9-1 downto 0);
  Ctrl.SB79.SB_MEM.wr_data   <=  BRAM_MOSI(79).wr_data(32-1 downto 0);

  Ctrl.SB80.SB_MEM.clk       <=  BRAM_MOSI(80).clk;
  Ctrl.SB80.SB_MEM.enable    <=  BRAM_MOSI(80).enable;
  Ctrl.SB80.SB_MEM.wr_enable <=  BRAM_MOSI(80).wr_enable;
  Ctrl.SB80.SB_MEM.address   <=  BRAM_MOSI(80).address(9-1 downto 0);
  Ctrl.SB80.SB_MEM.wr_data   <=  BRAM_MOSI(80).wr_data(32-1 downto 0);

  Ctrl.SB81.SB_MEM.clk       <=  BRAM_MOSI(81).clk;
  Ctrl.SB81.SB_MEM.enable    <=  BRAM_MOSI(81).enable;
  Ctrl.SB81.SB_MEM.wr_enable <=  BRAM_MOSI(81).wr_enable;
  Ctrl.SB81.SB_MEM.address   <=  BRAM_MOSI(81).address(9-1 downto 0);
  Ctrl.SB81.SB_MEM.wr_data   <=  BRAM_MOSI(81).wr_data(32-1 downto 0);

  Ctrl.SB82.SB_MEM.clk       <=  BRAM_MOSI(82).clk;
  Ctrl.SB82.SB_MEM.enable    <=  BRAM_MOSI(82).enable;
  Ctrl.SB82.SB_MEM.wr_enable <=  BRAM_MOSI(82).wr_enable;
  Ctrl.SB82.SB_MEM.address   <=  BRAM_MOSI(82).address(9-1 downto 0);
  Ctrl.SB82.SB_MEM.wr_data   <=  BRAM_MOSI(82).wr_data(32-1 downto 0);

  Ctrl.SB83.SB_MEM.clk       <=  BRAM_MOSI(83).clk;
  Ctrl.SB83.SB_MEM.enable    <=  BRAM_MOSI(83).enable;
  Ctrl.SB83.SB_MEM.wr_enable <=  BRAM_MOSI(83).wr_enable;
  Ctrl.SB83.SB_MEM.address   <=  BRAM_MOSI(83).address(9-1 downto 0);
  Ctrl.SB83.SB_MEM.wr_data   <=  BRAM_MOSI(83).wr_data(32-1 downto 0);

  Ctrl.SB84.SB_MEM.clk       <=  BRAM_MOSI(84).clk;
  Ctrl.SB84.SB_MEM.enable    <=  BRAM_MOSI(84).enable;
  Ctrl.SB84.SB_MEM.wr_enable <=  BRAM_MOSI(84).wr_enable;
  Ctrl.SB84.SB_MEM.address   <=  BRAM_MOSI(84).address(9-1 downto 0);
  Ctrl.SB84.SB_MEM.wr_data   <=  BRAM_MOSI(84).wr_data(32-1 downto 0);

  Ctrl.SB85.SB_MEM.clk       <=  BRAM_MOSI(85).clk;
  Ctrl.SB85.SB_MEM.enable    <=  BRAM_MOSI(85).enable;
  Ctrl.SB85.SB_MEM.wr_enable <=  BRAM_MOSI(85).wr_enable;
  Ctrl.SB85.SB_MEM.address   <=  BRAM_MOSI(85).address(9-1 downto 0);
  Ctrl.SB85.SB_MEM.wr_data   <=  BRAM_MOSI(85).wr_data(32-1 downto 0);

  Ctrl.SB86.SB_MEM.clk       <=  BRAM_MOSI(86).clk;
  Ctrl.SB86.SB_MEM.enable    <=  BRAM_MOSI(86).enable;
  Ctrl.SB86.SB_MEM.wr_enable <=  BRAM_MOSI(86).wr_enable;
  Ctrl.SB86.SB_MEM.address   <=  BRAM_MOSI(86).address(9-1 downto 0);
  Ctrl.SB86.SB_MEM.wr_data   <=  BRAM_MOSI(86).wr_data(32-1 downto 0);

  Ctrl.SB87.SB_MEM.clk       <=  BRAM_MOSI(87).clk;
  Ctrl.SB87.SB_MEM.enable    <=  BRAM_MOSI(87).enable;
  Ctrl.SB87.SB_MEM.wr_enable <=  BRAM_MOSI(87).wr_enable;
  Ctrl.SB87.SB_MEM.address   <=  BRAM_MOSI(87).address(9-1 downto 0);
  Ctrl.SB87.SB_MEM.wr_data   <=  BRAM_MOSI(87).wr_data(32-1 downto 0);

  Ctrl.SB88.SB_MEM.clk       <=  BRAM_MOSI(88).clk;
  Ctrl.SB88.SB_MEM.enable    <=  BRAM_MOSI(88).enable;
  Ctrl.SB88.SB_MEM.wr_enable <=  BRAM_MOSI(88).wr_enable;
  Ctrl.SB88.SB_MEM.address   <=  BRAM_MOSI(88).address(9-1 downto 0);
  Ctrl.SB88.SB_MEM.wr_data   <=  BRAM_MOSI(88).wr_data(32-1 downto 0);

  Ctrl.SB89.SB_MEM.clk       <=  BRAM_MOSI(89).clk;
  Ctrl.SB89.SB_MEM.enable    <=  BRAM_MOSI(89).enable;
  Ctrl.SB89.SB_MEM.wr_enable <=  BRAM_MOSI(89).wr_enable;
  Ctrl.SB89.SB_MEM.address   <=  BRAM_MOSI(89).address(9-1 downto 0);
  Ctrl.SB89.SB_MEM.wr_data   <=  BRAM_MOSI(89).wr_data(32-1 downto 0);

  Ctrl.SB90.SB_MEM.clk       <=  BRAM_MOSI(90).clk;
  Ctrl.SB90.SB_MEM.enable    <=  BRAM_MOSI(90).enable;
  Ctrl.SB90.SB_MEM.wr_enable <=  BRAM_MOSI(90).wr_enable;
  Ctrl.SB90.SB_MEM.address   <=  BRAM_MOSI(90).address(9-1 downto 0);
  Ctrl.SB90.SB_MEM.wr_data   <=  BRAM_MOSI(90).wr_data(32-1 downto 0);

  Ctrl.SB91.SB_MEM.clk       <=  BRAM_MOSI(91).clk;
  Ctrl.SB91.SB_MEM.enable    <=  BRAM_MOSI(91).enable;
  Ctrl.SB91.SB_MEM.wr_enable <=  BRAM_MOSI(91).wr_enable;
  Ctrl.SB91.SB_MEM.address   <=  BRAM_MOSI(91).address(9-1 downto 0);
  Ctrl.SB91.SB_MEM.wr_data   <=  BRAM_MOSI(91).wr_data(32-1 downto 0);

  Ctrl.SB92.SB_MEM.clk       <=  BRAM_MOSI(92).clk;
  Ctrl.SB92.SB_MEM.enable    <=  BRAM_MOSI(92).enable;
  Ctrl.SB92.SB_MEM.wr_enable <=  BRAM_MOSI(92).wr_enable;
  Ctrl.SB92.SB_MEM.address   <=  BRAM_MOSI(92).address(9-1 downto 0);
  Ctrl.SB92.SB_MEM.wr_data   <=  BRAM_MOSI(92).wr_data(32-1 downto 0);

  Ctrl.SB93.SB_MEM.clk       <=  BRAM_MOSI(93).clk;
  Ctrl.SB93.SB_MEM.enable    <=  BRAM_MOSI(93).enable;
  Ctrl.SB93.SB_MEM.wr_enable <=  BRAM_MOSI(93).wr_enable;
  Ctrl.SB93.SB_MEM.address   <=  BRAM_MOSI(93).address(9-1 downto 0);
  Ctrl.SB93.SB_MEM.wr_data   <=  BRAM_MOSI(93).wr_data(32-1 downto 0);

  Ctrl.SB94.SB_MEM.clk       <=  BRAM_MOSI(94).clk;
  Ctrl.SB94.SB_MEM.enable    <=  BRAM_MOSI(94).enable;
  Ctrl.SB94.SB_MEM.wr_enable <=  BRAM_MOSI(94).wr_enable;
  Ctrl.SB94.SB_MEM.address   <=  BRAM_MOSI(94).address(9-1 downto 0);
  Ctrl.SB94.SB_MEM.wr_data   <=  BRAM_MOSI(94).wr_data(32-1 downto 0);

  Ctrl.SB95.SB_MEM.clk       <=  BRAM_MOSI(95).clk;
  Ctrl.SB95.SB_MEM.enable    <=  BRAM_MOSI(95).enable;
  Ctrl.SB95.SB_MEM.wr_enable <=  BRAM_MOSI(95).wr_enable;
  Ctrl.SB95.SB_MEM.address   <=  BRAM_MOSI(95).address(9-1 downto 0);
  Ctrl.SB95.SB_MEM.wr_data   <=  BRAM_MOSI(95).wr_data(32-1 downto 0);

  Ctrl.SB96.SB_MEM.clk       <=  BRAM_MOSI(96).clk;
  Ctrl.SB96.SB_MEM.enable    <=  BRAM_MOSI(96).enable;
  Ctrl.SB96.SB_MEM.wr_enable <=  BRAM_MOSI(96).wr_enable;
  Ctrl.SB96.SB_MEM.address   <=  BRAM_MOSI(96).address(9-1 downto 0);
  Ctrl.SB96.SB_MEM.wr_data   <=  BRAM_MOSI(96).wr_data(32-1 downto 0);

  Ctrl.SB97.SB_MEM.clk       <=  BRAM_MOSI(97).clk;
  Ctrl.SB97.SB_MEM.enable    <=  BRAM_MOSI(97).enable;
  Ctrl.SB97.SB_MEM.wr_enable <=  BRAM_MOSI(97).wr_enable;
  Ctrl.SB97.SB_MEM.address   <=  BRAM_MOSI(97).address(9-1 downto 0);
  Ctrl.SB97.SB_MEM.wr_data   <=  BRAM_MOSI(97).wr_data(32-1 downto 0);

  Ctrl.SB98.SB_MEM.clk       <=  BRAM_MOSI(98).clk;
  Ctrl.SB98.SB_MEM.enable    <=  BRAM_MOSI(98).enable;
  Ctrl.SB98.SB_MEM.wr_enable <=  BRAM_MOSI(98).wr_enable;
  Ctrl.SB98.SB_MEM.address   <=  BRAM_MOSI(98).address(9-1 downto 0);
  Ctrl.SB98.SB_MEM.wr_data   <=  BRAM_MOSI(98).wr_data(32-1 downto 0);

  Ctrl.SB99.SB_MEM.clk       <=  BRAM_MOSI(99).clk;
  Ctrl.SB99.SB_MEM.enable    <=  BRAM_MOSI(99).enable;
  Ctrl.SB99.SB_MEM.wr_enable <=  BRAM_MOSI(99).wr_enable;
  Ctrl.SB99.SB_MEM.address   <=  BRAM_MOSI(99).address(9-1 downto 0);
  Ctrl.SB99.SB_MEM.wr_data   <=  BRAM_MOSI(99).wr_data(32-1 downto 0);

  Ctrl.SB100.SB_MEM.clk       <=  BRAM_MOSI(100).clk;
  Ctrl.SB100.SB_MEM.enable    <=  BRAM_MOSI(100).enable;
  Ctrl.SB100.SB_MEM.wr_enable <=  BRAM_MOSI(100).wr_enable;
  Ctrl.SB100.SB_MEM.address   <=  BRAM_MOSI(100).address(9-1 downto 0);
  Ctrl.SB100.SB_MEM.wr_data   <=  BRAM_MOSI(100).wr_data(32-1 downto 0);

  Ctrl.SB101.SB_MEM.clk       <=  BRAM_MOSI(101).clk;
  Ctrl.SB101.SB_MEM.enable    <=  BRAM_MOSI(101).enable;
  Ctrl.SB101.SB_MEM.wr_enable <=  BRAM_MOSI(101).wr_enable;
  Ctrl.SB101.SB_MEM.address   <=  BRAM_MOSI(101).address(9-1 downto 0);
  Ctrl.SB101.SB_MEM.wr_data   <=  BRAM_MOSI(101).wr_data(32-1 downto 0);

  Ctrl.SB102.SB_MEM.clk       <=  BRAM_MOSI(102).clk;
  Ctrl.SB102.SB_MEM.enable    <=  BRAM_MOSI(102).enable;
  Ctrl.SB102.SB_MEM.wr_enable <=  BRAM_MOSI(102).wr_enable;
  Ctrl.SB102.SB_MEM.address   <=  BRAM_MOSI(102).address(9-1 downto 0);
  Ctrl.SB102.SB_MEM.wr_data   <=  BRAM_MOSI(102).wr_data(32-1 downto 0);

  Ctrl.SB103.SB_MEM.clk       <=  BRAM_MOSI(103).clk;
  Ctrl.SB103.SB_MEM.enable    <=  BRAM_MOSI(103).enable;
  Ctrl.SB103.SB_MEM.wr_enable <=  BRAM_MOSI(103).wr_enable;
  Ctrl.SB103.SB_MEM.address   <=  BRAM_MOSI(103).address(9-1 downto 0);
  Ctrl.SB103.SB_MEM.wr_data   <=  BRAM_MOSI(103).wr_data(32-1 downto 0);

  Ctrl.SB104.SB_MEM.clk       <=  BRAM_MOSI(104).clk;
  Ctrl.SB104.SB_MEM.enable    <=  BRAM_MOSI(104).enable;
  Ctrl.SB104.SB_MEM.wr_enable <=  BRAM_MOSI(104).wr_enable;
  Ctrl.SB104.SB_MEM.address   <=  BRAM_MOSI(104).address(9-1 downto 0);
  Ctrl.SB104.SB_MEM.wr_data   <=  BRAM_MOSI(104).wr_data(32-1 downto 0);

  Ctrl.SB105.SB_MEM.clk       <=  BRAM_MOSI(105).clk;
  Ctrl.SB105.SB_MEM.enable    <=  BRAM_MOSI(105).enable;
  Ctrl.SB105.SB_MEM.wr_enable <=  BRAM_MOSI(105).wr_enable;
  Ctrl.SB105.SB_MEM.address   <=  BRAM_MOSI(105).address(9-1 downto 0);
  Ctrl.SB105.SB_MEM.wr_data   <=  BRAM_MOSI(105).wr_data(32-1 downto 0);

  Ctrl.SB106.SB_MEM.clk       <=  BRAM_MOSI(106).clk;
  Ctrl.SB106.SB_MEM.enable    <=  BRAM_MOSI(106).enable;
  Ctrl.SB106.SB_MEM.wr_enable <=  BRAM_MOSI(106).wr_enable;
  Ctrl.SB106.SB_MEM.address   <=  BRAM_MOSI(106).address(9-1 downto 0);
  Ctrl.SB106.SB_MEM.wr_data   <=  BRAM_MOSI(106).wr_data(32-1 downto 0);

  Ctrl.SB107.SB_MEM.clk       <=  BRAM_MOSI(107).clk;
  Ctrl.SB107.SB_MEM.enable    <=  BRAM_MOSI(107).enable;
  Ctrl.SB107.SB_MEM.wr_enable <=  BRAM_MOSI(107).wr_enable;
  Ctrl.SB107.SB_MEM.address   <=  BRAM_MOSI(107).address(9-1 downto 0);
  Ctrl.SB107.SB_MEM.wr_data   <=  BRAM_MOSI(107).wr_data(32-1 downto 0);

  Ctrl.SB108.SB_MEM.clk       <=  BRAM_MOSI(108).clk;
  Ctrl.SB108.SB_MEM.enable    <=  BRAM_MOSI(108).enable;
  Ctrl.SB108.SB_MEM.wr_enable <=  BRAM_MOSI(108).wr_enable;
  Ctrl.SB108.SB_MEM.address   <=  BRAM_MOSI(108).address(9-1 downto 0);
  Ctrl.SB108.SB_MEM.wr_data   <=  BRAM_MOSI(108).wr_data(32-1 downto 0);

  Ctrl.SB109.SB_MEM.clk       <=  BRAM_MOSI(109).clk;
  Ctrl.SB109.SB_MEM.enable    <=  BRAM_MOSI(109).enable;
  Ctrl.SB109.SB_MEM.wr_enable <=  BRAM_MOSI(109).wr_enable;
  Ctrl.SB109.SB_MEM.address   <=  BRAM_MOSI(109).address(9-1 downto 0);
  Ctrl.SB109.SB_MEM.wr_data   <=  BRAM_MOSI(109).wr_data(32-1 downto 0);

  Ctrl.SB110.SB_MEM.clk       <=  BRAM_MOSI(110).clk;
  Ctrl.SB110.SB_MEM.enable    <=  BRAM_MOSI(110).enable;
  Ctrl.SB110.SB_MEM.wr_enable <=  BRAM_MOSI(110).wr_enable;
  Ctrl.SB110.SB_MEM.address   <=  BRAM_MOSI(110).address(9-1 downto 0);
  Ctrl.SB110.SB_MEM.wr_data   <=  BRAM_MOSI(110).wr_data(32-1 downto 0);

  Ctrl.SB111.SB_MEM.clk       <=  BRAM_MOSI(111).clk;
  Ctrl.SB111.SB_MEM.enable    <=  BRAM_MOSI(111).enable;
  Ctrl.SB111.SB_MEM.wr_enable <=  BRAM_MOSI(111).wr_enable;
  Ctrl.SB111.SB_MEM.address   <=  BRAM_MOSI(111).address(9-1 downto 0);
  Ctrl.SB111.SB_MEM.wr_data   <=  BRAM_MOSI(111).wr_data(32-1 downto 0);

  Ctrl.SB112.SB_MEM.clk       <=  BRAM_MOSI(112).clk;
  Ctrl.SB112.SB_MEM.enable    <=  BRAM_MOSI(112).enable;
  Ctrl.SB112.SB_MEM.wr_enable <=  BRAM_MOSI(112).wr_enable;
  Ctrl.SB112.SB_MEM.address   <=  BRAM_MOSI(112).address(9-1 downto 0);
  Ctrl.SB112.SB_MEM.wr_data   <=  BRAM_MOSI(112).wr_data(32-1 downto 0);

  Ctrl.SB113.SB_MEM.clk       <=  BRAM_MOSI(113).clk;
  Ctrl.SB113.SB_MEM.enable    <=  BRAM_MOSI(113).enable;
  Ctrl.SB113.SB_MEM.wr_enable <=  BRAM_MOSI(113).wr_enable;
  Ctrl.SB113.SB_MEM.address   <=  BRAM_MOSI(113).address(9-1 downto 0);
  Ctrl.SB113.SB_MEM.wr_data   <=  BRAM_MOSI(113).wr_data(32-1 downto 0);


  BRAM_MISO(0).rd_data(32-1 downto 0) <= Mon.SB0.SB_MEM.rd_data;
  BRAM_MISO(0).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(0).rd_data_valid <= Mon.SB0.SB_MEM.rd_data_valid;

  BRAM_MISO(1).rd_data(32-1 downto 0) <= Mon.SB1.SB_MEM.rd_data;
  BRAM_MISO(1).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(1).rd_data_valid <= Mon.SB1.SB_MEM.rd_data_valid;

  BRAM_MISO(2).rd_data(32-1 downto 0) <= Mon.SB2.SB_MEM.rd_data;
  BRAM_MISO(2).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(2).rd_data_valid <= Mon.SB2.SB_MEM.rd_data_valid;

  BRAM_MISO(3).rd_data(32-1 downto 0) <= Mon.SB3.SB_MEM.rd_data;
  BRAM_MISO(3).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(3).rd_data_valid <= Mon.SB3.SB_MEM.rd_data_valid;

  BRAM_MISO(4).rd_data(32-1 downto 0) <= Mon.SB4.SB_MEM.rd_data;
  BRAM_MISO(4).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(4).rd_data_valid <= Mon.SB4.SB_MEM.rd_data_valid;

  BRAM_MISO(5).rd_data(32-1 downto 0) <= Mon.SB5.SB_MEM.rd_data;
  BRAM_MISO(5).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(5).rd_data_valid <= Mon.SB5.SB_MEM.rd_data_valid;

  BRAM_MISO(6).rd_data(32-1 downto 0) <= Mon.SB6.SB_MEM.rd_data;
  BRAM_MISO(6).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(6).rd_data_valid <= Mon.SB6.SB_MEM.rd_data_valid;

  BRAM_MISO(7).rd_data(32-1 downto 0) <= Mon.SB7.SB_MEM.rd_data;
  BRAM_MISO(7).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(7).rd_data_valid <= Mon.SB7.SB_MEM.rd_data_valid;

  BRAM_MISO(8).rd_data(32-1 downto 0) <= Mon.SB8.SB_MEM.rd_data;
  BRAM_MISO(8).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(8).rd_data_valid <= Mon.SB8.SB_MEM.rd_data_valid;

  BRAM_MISO(9).rd_data(32-1 downto 0) <= Mon.SB9.SB_MEM.rd_data;
  BRAM_MISO(9).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(9).rd_data_valid <= Mon.SB9.SB_MEM.rd_data_valid;

  BRAM_MISO(10).rd_data(32-1 downto 0) <= Mon.SB10.SB_MEM.rd_data;
  BRAM_MISO(10).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(10).rd_data_valid <= Mon.SB10.SB_MEM.rd_data_valid;

  BRAM_MISO(11).rd_data(32-1 downto 0) <= Mon.SB11.SB_MEM.rd_data;
  BRAM_MISO(11).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(11).rd_data_valid <= Mon.SB11.SB_MEM.rd_data_valid;

  BRAM_MISO(12).rd_data(32-1 downto 0) <= Mon.SB12.SB_MEM.rd_data;
  BRAM_MISO(12).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(12).rd_data_valid <= Mon.SB12.SB_MEM.rd_data_valid;

  BRAM_MISO(13).rd_data(32-1 downto 0) <= Mon.SB13.SB_MEM.rd_data;
  BRAM_MISO(13).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(13).rd_data_valid <= Mon.SB13.SB_MEM.rd_data_valid;

  BRAM_MISO(14).rd_data(32-1 downto 0) <= Mon.SB14.SB_MEM.rd_data;
  BRAM_MISO(14).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(14).rd_data_valid <= Mon.SB14.SB_MEM.rd_data_valid;

  BRAM_MISO(15).rd_data(32-1 downto 0) <= Mon.SB15.SB_MEM.rd_data;
  BRAM_MISO(15).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(15).rd_data_valid <= Mon.SB15.SB_MEM.rd_data_valid;

  BRAM_MISO(16).rd_data(32-1 downto 0) <= Mon.SB16.SB_MEM.rd_data;
  BRAM_MISO(16).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(16).rd_data_valid <= Mon.SB16.SB_MEM.rd_data_valid;

  BRAM_MISO(17).rd_data(32-1 downto 0) <= Mon.SB17.SB_MEM.rd_data;
  BRAM_MISO(17).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(17).rd_data_valid <= Mon.SB17.SB_MEM.rd_data_valid;

  BRAM_MISO(18).rd_data(32-1 downto 0) <= Mon.SB18.SB_MEM.rd_data;
  BRAM_MISO(18).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(18).rd_data_valid <= Mon.SB18.SB_MEM.rd_data_valid;

  BRAM_MISO(19).rd_data(32-1 downto 0) <= Mon.SB19.SB_MEM.rd_data;
  BRAM_MISO(19).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(19).rd_data_valid <= Mon.SB19.SB_MEM.rd_data_valid;

  BRAM_MISO(20).rd_data(32-1 downto 0) <= Mon.SB20.SB_MEM.rd_data;
  BRAM_MISO(20).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(20).rd_data_valid <= Mon.SB20.SB_MEM.rd_data_valid;

  BRAM_MISO(21).rd_data(32-1 downto 0) <= Mon.SB21.SB_MEM.rd_data;
  BRAM_MISO(21).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(21).rd_data_valid <= Mon.SB21.SB_MEM.rd_data_valid;

  BRAM_MISO(22).rd_data(32-1 downto 0) <= Mon.SB22.SB_MEM.rd_data;
  BRAM_MISO(22).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(22).rd_data_valid <= Mon.SB22.SB_MEM.rd_data_valid;

  BRAM_MISO(23).rd_data(32-1 downto 0) <= Mon.SB23.SB_MEM.rd_data;
  BRAM_MISO(23).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(23).rd_data_valid <= Mon.SB23.SB_MEM.rd_data_valid;

  BRAM_MISO(24).rd_data(32-1 downto 0) <= Mon.SB24.SB_MEM.rd_data;
  BRAM_MISO(24).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(24).rd_data_valid <= Mon.SB24.SB_MEM.rd_data_valid;

  BRAM_MISO(25).rd_data(32-1 downto 0) <= Mon.SB25.SB_MEM.rd_data;
  BRAM_MISO(25).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(25).rd_data_valid <= Mon.SB25.SB_MEM.rd_data_valid;

  BRAM_MISO(26).rd_data(32-1 downto 0) <= Mon.SB26.SB_MEM.rd_data;
  BRAM_MISO(26).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(26).rd_data_valid <= Mon.SB26.SB_MEM.rd_data_valid;

  BRAM_MISO(27).rd_data(32-1 downto 0) <= Mon.SB27.SB_MEM.rd_data;
  BRAM_MISO(27).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(27).rd_data_valid <= Mon.SB27.SB_MEM.rd_data_valid;

  BRAM_MISO(28).rd_data(32-1 downto 0) <= Mon.SB28.SB_MEM.rd_data;
  BRAM_MISO(28).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(28).rd_data_valid <= Mon.SB28.SB_MEM.rd_data_valid;

  BRAM_MISO(29).rd_data(32-1 downto 0) <= Mon.SB29.SB_MEM.rd_data;
  BRAM_MISO(29).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(29).rd_data_valid <= Mon.SB29.SB_MEM.rd_data_valid;

  BRAM_MISO(30).rd_data(32-1 downto 0) <= Mon.SB30.SB_MEM.rd_data;
  BRAM_MISO(30).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(30).rd_data_valid <= Mon.SB30.SB_MEM.rd_data_valid;

  BRAM_MISO(31).rd_data(32-1 downto 0) <= Mon.SB31.SB_MEM.rd_data;
  BRAM_MISO(31).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(31).rd_data_valid <= Mon.SB31.SB_MEM.rd_data_valid;

  BRAM_MISO(32).rd_data(32-1 downto 0) <= Mon.SB32.SB_MEM.rd_data;
  BRAM_MISO(32).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(32).rd_data_valid <= Mon.SB32.SB_MEM.rd_data_valid;

  BRAM_MISO(33).rd_data(32-1 downto 0) <= Mon.SB33.SB_MEM.rd_data;
  BRAM_MISO(33).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(33).rd_data_valid <= Mon.SB33.SB_MEM.rd_data_valid;

  BRAM_MISO(34).rd_data(32-1 downto 0) <= Mon.SB34.SB_MEM.rd_data;
  BRAM_MISO(34).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(34).rd_data_valid <= Mon.SB34.SB_MEM.rd_data_valid;

  BRAM_MISO(35).rd_data(32-1 downto 0) <= Mon.SB35.SB_MEM.rd_data;
  BRAM_MISO(35).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(35).rd_data_valid <= Mon.SB35.SB_MEM.rd_data_valid;

  BRAM_MISO(36).rd_data(32-1 downto 0) <= Mon.SB36.SB_MEM.rd_data;
  BRAM_MISO(36).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(36).rd_data_valid <= Mon.SB36.SB_MEM.rd_data_valid;

  BRAM_MISO(37).rd_data(32-1 downto 0) <= Mon.SB37.SB_MEM.rd_data;
  BRAM_MISO(37).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(37).rd_data_valid <= Mon.SB37.SB_MEM.rd_data_valid;

  BRAM_MISO(38).rd_data(32-1 downto 0) <= Mon.SB38.SB_MEM.rd_data;
  BRAM_MISO(38).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(38).rd_data_valid <= Mon.SB38.SB_MEM.rd_data_valid;

  BRAM_MISO(39).rd_data(32-1 downto 0) <= Mon.SB39.SB_MEM.rd_data;
  BRAM_MISO(39).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(39).rd_data_valid <= Mon.SB39.SB_MEM.rd_data_valid;

  BRAM_MISO(40).rd_data(32-1 downto 0) <= Mon.SB40.SB_MEM.rd_data;
  BRAM_MISO(40).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(40).rd_data_valid <= Mon.SB40.SB_MEM.rd_data_valid;

  BRAM_MISO(41).rd_data(32-1 downto 0) <= Mon.SB41.SB_MEM.rd_data;
  BRAM_MISO(41).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(41).rd_data_valid <= Mon.SB41.SB_MEM.rd_data_valid;

  BRAM_MISO(42).rd_data(32-1 downto 0) <= Mon.SB42.SB_MEM.rd_data;
  BRAM_MISO(42).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(42).rd_data_valid <= Mon.SB42.SB_MEM.rd_data_valid;

  BRAM_MISO(43).rd_data(32-1 downto 0) <= Mon.SB43.SB_MEM.rd_data;
  BRAM_MISO(43).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(43).rd_data_valid <= Mon.SB43.SB_MEM.rd_data_valid;

  BRAM_MISO(44).rd_data(32-1 downto 0) <= Mon.SB44.SB_MEM.rd_data;
  BRAM_MISO(44).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(44).rd_data_valid <= Mon.SB44.SB_MEM.rd_data_valid;

  BRAM_MISO(45).rd_data(32-1 downto 0) <= Mon.SB45.SB_MEM.rd_data;
  BRAM_MISO(45).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(45).rd_data_valid <= Mon.SB45.SB_MEM.rd_data_valid;

  BRAM_MISO(46).rd_data(32-1 downto 0) <= Mon.SB46.SB_MEM.rd_data;
  BRAM_MISO(46).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(46).rd_data_valid <= Mon.SB46.SB_MEM.rd_data_valid;

  BRAM_MISO(47).rd_data(32-1 downto 0) <= Mon.SB47.SB_MEM.rd_data;
  BRAM_MISO(47).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(47).rd_data_valid <= Mon.SB47.SB_MEM.rd_data_valid;

  BRAM_MISO(48).rd_data(32-1 downto 0) <= Mon.SB48.SB_MEM.rd_data;
  BRAM_MISO(48).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(48).rd_data_valid <= Mon.SB48.SB_MEM.rd_data_valid;

  BRAM_MISO(49).rd_data(32-1 downto 0) <= Mon.SB49.SB_MEM.rd_data;
  BRAM_MISO(49).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(49).rd_data_valid <= Mon.SB49.SB_MEM.rd_data_valid;

  BRAM_MISO(50).rd_data(32-1 downto 0) <= Mon.SB50.SB_MEM.rd_data;
  BRAM_MISO(50).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(50).rd_data_valid <= Mon.SB50.SB_MEM.rd_data_valid;

  BRAM_MISO(51).rd_data(32-1 downto 0) <= Mon.SB51.SB_MEM.rd_data;
  BRAM_MISO(51).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(51).rd_data_valid <= Mon.SB51.SB_MEM.rd_data_valid;

  BRAM_MISO(52).rd_data(32-1 downto 0) <= Mon.SB52.SB_MEM.rd_data;
  BRAM_MISO(52).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(52).rd_data_valid <= Mon.SB52.SB_MEM.rd_data_valid;

  BRAM_MISO(53).rd_data(32-1 downto 0) <= Mon.SB53.SB_MEM.rd_data;
  BRAM_MISO(53).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(53).rd_data_valid <= Mon.SB53.SB_MEM.rd_data_valid;

  BRAM_MISO(54).rd_data(32-1 downto 0) <= Mon.SB54.SB_MEM.rd_data;
  BRAM_MISO(54).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(54).rd_data_valid <= Mon.SB54.SB_MEM.rd_data_valid;

  BRAM_MISO(55).rd_data(32-1 downto 0) <= Mon.SB55.SB_MEM.rd_data;
  BRAM_MISO(55).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(55).rd_data_valid <= Mon.SB55.SB_MEM.rd_data_valid;

  BRAM_MISO(56).rd_data(32-1 downto 0) <= Mon.SB56.SB_MEM.rd_data;
  BRAM_MISO(56).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(56).rd_data_valid <= Mon.SB56.SB_MEM.rd_data_valid;

  BRAM_MISO(57).rd_data(32-1 downto 0) <= Mon.SB57.SB_MEM.rd_data;
  BRAM_MISO(57).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(57).rd_data_valid <= Mon.SB57.SB_MEM.rd_data_valid;

  BRAM_MISO(58).rd_data(32-1 downto 0) <= Mon.SB58.SB_MEM.rd_data;
  BRAM_MISO(58).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(58).rd_data_valid <= Mon.SB58.SB_MEM.rd_data_valid;

  BRAM_MISO(59).rd_data(32-1 downto 0) <= Mon.SB59.SB_MEM.rd_data;
  BRAM_MISO(59).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(59).rd_data_valid <= Mon.SB59.SB_MEM.rd_data_valid;

  BRAM_MISO(60).rd_data(32-1 downto 0) <= Mon.SB60.SB_MEM.rd_data;
  BRAM_MISO(60).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(60).rd_data_valid <= Mon.SB60.SB_MEM.rd_data_valid;

  BRAM_MISO(61).rd_data(32-1 downto 0) <= Mon.SB61.SB_MEM.rd_data;
  BRAM_MISO(61).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(61).rd_data_valid <= Mon.SB61.SB_MEM.rd_data_valid;

  BRAM_MISO(62).rd_data(32-1 downto 0) <= Mon.SB62.SB_MEM.rd_data;
  BRAM_MISO(62).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(62).rd_data_valid <= Mon.SB62.SB_MEM.rd_data_valid;

  BRAM_MISO(63).rd_data(32-1 downto 0) <= Mon.SB63.SB_MEM.rd_data;
  BRAM_MISO(63).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(63).rd_data_valid <= Mon.SB63.SB_MEM.rd_data_valid;

  BRAM_MISO(64).rd_data(32-1 downto 0) <= Mon.SB64.SB_MEM.rd_data;
  BRAM_MISO(64).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(64).rd_data_valid <= Mon.SB64.SB_MEM.rd_data_valid;

  BRAM_MISO(65).rd_data(32-1 downto 0) <= Mon.SB65.SB_MEM.rd_data;
  BRAM_MISO(65).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(65).rd_data_valid <= Mon.SB65.SB_MEM.rd_data_valid;

  BRAM_MISO(66).rd_data(32-1 downto 0) <= Mon.SB66.SB_MEM.rd_data;
  BRAM_MISO(66).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(66).rd_data_valid <= Mon.SB66.SB_MEM.rd_data_valid;

  BRAM_MISO(67).rd_data(32-1 downto 0) <= Mon.SB67.SB_MEM.rd_data;
  BRAM_MISO(67).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(67).rd_data_valid <= Mon.SB67.SB_MEM.rd_data_valid;

  BRAM_MISO(68).rd_data(32-1 downto 0) <= Mon.SB68.SB_MEM.rd_data;
  BRAM_MISO(68).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(68).rd_data_valid <= Mon.SB68.SB_MEM.rd_data_valid;

  BRAM_MISO(69).rd_data(32-1 downto 0) <= Mon.SB69.SB_MEM.rd_data;
  BRAM_MISO(69).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(69).rd_data_valid <= Mon.SB69.SB_MEM.rd_data_valid;

  BRAM_MISO(70).rd_data(32-1 downto 0) <= Mon.SB70.SB_MEM.rd_data;
  BRAM_MISO(70).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(70).rd_data_valid <= Mon.SB70.SB_MEM.rd_data_valid;

  BRAM_MISO(71).rd_data(32-1 downto 0) <= Mon.SB71.SB_MEM.rd_data;
  BRAM_MISO(71).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(71).rd_data_valid <= Mon.SB71.SB_MEM.rd_data_valid;

  BRAM_MISO(72).rd_data(32-1 downto 0) <= Mon.SB72.SB_MEM.rd_data;
  BRAM_MISO(72).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(72).rd_data_valid <= Mon.SB72.SB_MEM.rd_data_valid;

  BRAM_MISO(73).rd_data(32-1 downto 0) <= Mon.SB73.SB_MEM.rd_data;
  BRAM_MISO(73).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(73).rd_data_valid <= Mon.SB73.SB_MEM.rd_data_valid;

  BRAM_MISO(74).rd_data(32-1 downto 0) <= Mon.SB74.SB_MEM.rd_data;
  BRAM_MISO(74).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(74).rd_data_valid <= Mon.SB74.SB_MEM.rd_data_valid;

  BRAM_MISO(75).rd_data(32-1 downto 0) <= Mon.SB75.SB_MEM.rd_data;
  BRAM_MISO(75).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(75).rd_data_valid <= Mon.SB75.SB_MEM.rd_data_valid;

  BRAM_MISO(76).rd_data(32-1 downto 0) <= Mon.SB76.SB_MEM.rd_data;
  BRAM_MISO(76).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(76).rd_data_valid <= Mon.SB76.SB_MEM.rd_data_valid;

  BRAM_MISO(77).rd_data(32-1 downto 0) <= Mon.SB77.SB_MEM.rd_data;
  BRAM_MISO(77).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(77).rd_data_valid <= Mon.SB77.SB_MEM.rd_data_valid;

  BRAM_MISO(78).rd_data(32-1 downto 0) <= Mon.SB78.SB_MEM.rd_data;
  BRAM_MISO(78).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(78).rd_data_valid <= Mon.SB78.SB_MEM.rd_data_valid;

  BRAM_MISO(79).rd_data(32-1 downto 0) <= Mon.SB79.SB_MEM.rd_data;
  BRAM_MISO(79).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(79).rd_data_valid <= Mon.SB79.SB_MEM.rd_data_valid;

  BRAM_MISO(80).rd_data(32-1 downto 0) <= Mon.SB80.SB_MEM.rd_data;
  BRAM_MISO(80).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(80).rd_data_valid <= Mon.SB80.SB_MEM.rd_data_valid;

  BRAM_MISO(81).rd_data(32-1 downto 0) <= Mon.SB81.SB_MEM.rd_data;
  BRAM_MISO(81).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(81).rd_data_valid <= Mon.SB81.SB_MEM.rd_data_valid;

  BRAM_MISO(82).rd_data(32-1 downto 0) <= Mon.SB82.SB_MEM.rd_data;
  BRAM_MISO(82).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(82).rd_data_valid <= Mon.SB82.SB_MEM.rd_data_valid;

  BRAM_MISO(83).rd_data(32-1 downto 0) <= Mon.SB83.SB_MEM.rd_data;
  BRAM_MISO(83).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(83).rd_data_valid <= Mon.SB83.SB_MEM.rd_data_valid;

  BRAM_MISO(84).rd_data(32-1 downto 0) <= Mon.SB84.SB_MEM.rd_data;
  BRAM_MISO(84).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(84).rd_data_valid <= Mon.SB84.SB_MEM.rd_data_valid;

  BRAM_MISO(85).rd_data(32-1 downto 0) <= Mon.SB85.SB_MEM.rd_data;
  BRAM_MISO(85).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(85).rd_data_valid <= Mon.SB85.SB_MEM.rd_data_valid;

  BRAM_MISO(86).rd_data(32-1 downto 0) <= Mon.SB86.SB_MEM.rd_data;
  BRAM_MISO(86).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(86).rd_data_valid <= Mon.SB86.SB_MEM.rd_data_valid;

  BRAM_MISO(87).rd_data(32-1 downto 0) <= Mon.SB87.SB_MEM.rd_data;
  BRAM_MISO(87).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(87).rd_data_valid <= Mon.SB87.SB_MEM.rd_data_valid;

  BRAM_MISO(88).rd_data(32-1 downto 0) <= Mon.SB88.SB_MEM.rd_data;
  BRAM_MISO(88).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(88).rd_data_valid <= Mon.SB88.SB_MEM.rd_data_valid;

  BRAM_MISO(89).rd_data(32-1 downto 0) <= Mon.SB89.SB_MEM.rd_data;
  BRAM_MISO(89).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(89).rd_data_valid <= Mon.SB89.SB_MEM.rd_data_valid;

  BRAM_MISO(90).rd_data(32-1 downto 0) <= Mon.SB90.SB_MEM.rd_data;
  BRAM_MISO(90).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(90).rd_data_valid <= Mon.SB90.SB_MEM.rd_data_valid;

  BRAM_MISO(91).rd_data(32-1 downto 0) <= Mon.SB91.SB_MEM.rd_data;
  BRAM_MISO(91).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(91).rd_data_valid <= Mon.SB91.SB_MEM.rd_data_valid;

  BRAM_MISO(92).rd_data(32-1 downto 0) <= Mon.SB92.SB_MEM.rd_data;
  BRAM_MISO(92).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(92).rd_data_valid <= Mon.SB92.SB_MEM.rd_data_valid;

  BRAM_MISO(93).rd_data(32-1 downto 0) <= Mon.SB93.SB_MEM.rd_data;
  BRAM_MISO(93).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(93).rd_data_valid <= Mon.SB93.SB_MEM.rd_data_valid;

  BRAM_MISO(94).rd_data(32-1 downto 0) <= Mon.SB94.SB_MEM.rd_data;
  BRAM_MISO(94).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(94).rd_data_valid <= Mon.SB94.SB_MEM.rd_data_valid;

  BRAM_MISO(95).rd_data(32-1 downto 0) <= Mon.SB95.SB_MEM.rd_data;
  BRAM_MISO(95).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(95).rd_data_valid <= Mon.SB95.SB_MEM.rd_data_valid;

  BRAM_MISO(96).rd_data(32-1 downto 0) <= Mon.SB96.SB_MEM.rd_data;
  BRAM_MISO(96).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(96).rd_data_valid <= Mon.SB96.SB_MEM.rd_data_valid;

  BRAM_MISO(97).rd_data(32-1 downto 0) <= Mon.SB97.SB_MEM.rd_data;
  BRAM_MISO(97).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(97).rd_data_valid <= Mon.SB97.SB_MEM.rd_data_valid;

  BRAM_MISO(98).rd_data(32-1 downto 0) <= Mon.SB98.SB_MEM.rd_data;
  BRAM_MISO(98).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(98).rd_data_valid <= Mon.SB98.SB_MEM.rd_data_valid;

  BRAM_MISO(99).rd_data(32-1 downto 0) <= Mon.SB99.SB_MEM.rd_data;
  BRAM_MISO(99).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(99).rd_data_valid <= Mon.SB99.SB_MEM.rd_data_valid;

  BRAM_MISO(100).rd_data(32-1 downto 0) <= Mon.SB100.SB_MEM.rd_data;
  BRAM_MISO(100).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(100).rd_data_valid <= Mon.SB100.SB_MEM.rd_data_valid;

  BRAM_MISO(101).rd_data(32-1 downto 0) <= Mon.SB101.SB_MEM.rd_data;
  BRAM_MISO(101).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(101).rd_data_valid <= Mon.SB101.SB_MEM.rd_data_valid;

  BRAM_MISO(102).rd_data(32-1 downto 0) <= Mon.SB102.SB_MEM.rd_data;
  BRAM_MISO(102).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(102).rd_data_valid <= Mon.SB102.SB_MEM.rd_data_valid;

  BRAM_MISO(103).rd_data(32-1 downto 0) <= Mon.SB103.SB_MEM.rd_data;
  BRAM_MISO(103).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(103).rd_data_valid <= Mon.SB103.SB_MEM.rd_data_valid;

  BRAM_MISO(104).rd_data(32-1 downto 0) <= Mon.SB104.SB_MEM.rd_data;
  BRAM_MISO(104).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(104).rd_data_valid <= Mon.SB104.SB_MEM.rd_data_valid;

  BRAM_MISO(105).rd_data(32-1 downto 0) <= Mon.SB105.SB_MEM.rd_data;
  BRAM_MISO(105).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(105).rd_data_valid <= Mon.SB105.SB_MEM.rd_data_valid;

  BRAM_MISO(106).rd_data(32-1 downto 0) <= Mon.SB106.SB_MEM.rd_data;
  BRAM_MISO(106).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(106).rd_data_valid <= Mon.SB106.SB_MEM.rd_data_valid;

  BRAM_MISO(107).rd_data(32-1 downto 0) <= Mon.SB107.SB_MEM.rd_data;
  BRAM_MISO(107).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(107).rd_data_valid <= Mon.SB107.SB_MEM.rd_data_valid;

  BRAM_MISO(108).rd_data(32-1 downto 0) <= Mon.SB108.SB_MEM.rd_data;
  BRAM_MISO(108).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(108).rd_data_valid <= Mon.SB108.SB_MEM.rd_data_valid;

  BRAM_MISO(109).rd_data(32-1 downto 0) <= Mon.SB109.SB_MEM.rd_data;
  BRAM_MISO(109).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(109).rd_data_valid <= Mon.SB109.SB_MEM.rd_data_valid;

  BRAM_MISO(110).rd_data(32-1 downto 0) <= Mon.SB110.SB_MEM.rd_data;
  BRAM_MISO(110).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(110).rd_data_valid <= Mon.SB110.SB_MEM.rd_data_valid;

  BRAM_MISO(111).rd_data(32-1 downto 0) <= Mon.SB111.SB_MEM.rd_data;
  BRAM_MISO(111).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(111).rd_data_valid <= Mon.SB111.SB_MEM.rd_data_valid;

  BRAM_MISO(112).rd_data(32-1 downto 0) <= Mon.SB112.SB_MEM.rd_data;
  BRAM_MISO(112).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(112).rd_data_valid <= Mon.SB112.SB_MEM.rd_data_valid;

  BRAM_MISO(113).rd_data(32-1 downto 0) <= Mon.SB113.SB_MEM.rd_data;
  BRAM_MISO(113).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(113).rd_data_valid <= Mon.SB113.SB_MEM.rd_data_valid;

    

  BRAM_writes: for iBRAM in 0 to BRAM_COUNT-1 generate
    BRAM_write: process (clk_axi,reset_axi_n) is    
    begin  -- process BRAM_reads
      if reset_axi_n = '0' then
        BRAM_MOSI(iBRAM).wr_enable   <= '0';
      elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
        BRAM_MOSI(iBRAM).wr_enable   <= '0';
        if localAddress(15 downto BRAM_range(iBRAM)) = BRAM_addr(iBRAM)(15 downto BRAM_range(iBRAM)) then
          BRAM_MOSI(iBRAM).wr_enable   <= localWrEn;
        end if;
      end if;
    end process BRAM_write;
  end generate BRAM_writes;


  
end architecture behavioral;