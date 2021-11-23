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
    READ_TIMEOUT     : integer := 2048
    );
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    Mon              : in FM_Mon_t;
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


  constant BRAM_COUNT       : integer := 54;
--  signal latchBRAM          : std_logic_vector(BRAM_COUNT-1 downto 0);
--  signal delayLatchBRAM          : std_logic_vector(BRAM_COUNT-1 downto 0);
  constant BRAM_range       : int_array_t(0 to BRAM_COUNT-1) := (0 => 8
,			1 => 8
,			2 => 8
,			3 => 8
,			4 => 8
,			5 => 8
,			6 => 8
,			7 => 8
,			8 => 8
,			9 => 8
,			10 => 8
,			11 => 8
,			12 => 8
,			13 => 8
,			14 => 8
,			15 => 8
,			16 => 8
,			17 => 8
,			18 => 8
,			19 => 8
,			20 => 8
,			21 => 8
,			22 => 8
,			23 => 8
,			24 => 8
,			25 => 8
,			26 => 8
,			27 => 8
,			28 => 8
,			29 => 8
,			30 => 8
,			31 => 8
,			32 => 8
,			33 => 8
,			34 => 8
,			35 => 8
,			36 => 8
,			37 => 8
,			38 => 8
,			39 => 8
,			40 => 8
,			41 => 8
,			42 => 8
,			43 => 8
,			44 => 8
,			45 => 8
,			46 => 8
,			47 => 8
,			48 => 8
,			49 => 8
,			50 => 8
,			51 => 8
,			52 => 8
,			53 => 8);
  constant BRAM_addr        : slv32_array_t(0 to BRAM_COUNT-1) := (0 => x"00000100"
,			1 => x"00000200"
,			2 => x"00000300"
,			3 => x"00000400"
,			4 => x"00000500"
,			5 => x"00000600"
,			6 => x"00000700"
,			7 => x"00000800"
,			8 => x"00000900"
,			9 => x"00000A00"
,			10 => x"00000B00"
,			11 => x"00000C00"
,			12 => x"00000D00"
,			13 => x"00000E00"
,			14 => x"00000F00"
,			15 => x"00001000"
,			16 => x"00001100"
,			17 => x"00001200"
,			18 => x"00001300"
,			19 => x"00001400"
,			20 => x"00001500"
,			21 => x"00001600"
,			22 => x"00001700"
,			23 => x"00001800"
,			24 => x"00001900"
,			25 => x"00001A00"
,			26 => x"00001B00"
,			27 => x"00001C00"
,			28 => x"00001D00"
,			29 => x"00001E00"
,			30 => x"00001F00"
,			31 => x"00002000"
,			32 => x"00002100"
,			33 => x"00002200"
,			34 => x"00002300"
,			35 => x"00002400"
,			36 => x"00002500"
,			37 => x"00002600"
,			38 => x"00002700"
,			39 => x"00002800"
,			40 => x"00002900"
,			41 => x"00002A00"
,			42 => x"00003B00"
,			43 => x"00003C00"
,			44 => x"00003D00"
,			45 => x"00003E00"
,			46 => x"00003F00"
,			47 => x"00004000"
,			48 => x"00004100"
,			49 => x"00004200"
,			50 => x"00004300"
,			51 => x"00004400"
,			52 => x"00004500"
,			53 => x"00004600");
  signal BRAM_MOSI          : BRAMPortMOSI_array_t(0 to BRAM_COUNT-1);
  signal BRAM_MISO          : BRAMPortMISO_array_t(0 to BRAM_COUNT-1);


  signal reg_data :  slv32_array_t(integer range 0 to 18176);
  constant Default_reg_data : slv32_array_t(integer range 0 to 18176) := (others => x"00000000");
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
        case to_integer(unsigned(localAddress(14 downto 0))) is
          when 0 =>
            localRdData(2 downto 0) <= Ctrl.SPY_CTRL.GLOBAL_PLAYBACK_MODE & Ctrl.SPY_CTRL.GLOBAL_FREEZE;
          when 1 =>
            localRdData <= Ctrl.FREEZE_MASK_0;
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


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      Ctrl.SPY_CTRL.GLOBAL_FREEZE <= '0'; --priya
      Ctrl.SPY_CTRL.GLOBAL_PLAYBACK_MODE <= (others => '0');
      Ctrl.FREEZE_MASK_0 <= (others => '0');
      Ctrl.FREEZE_MASK_1 <= (others => '0');
      Ctrl.PLAYBACK_MASK_0 <= (others => '0');
      Ctrl.PLAYBACK_MASK_1 <= (others => '0');
    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
       if localWrEn = '1' then
        case to_integer(unsigned(localAddress(14 downto 0))) is
        when 0 => --0x0
          Ctrl.SPY_CTRL.GLOBAL_FREEZE         <=  localWrData( 0);
          Ctrl.SPY_CTRL.GLOBAL_PLAYBACK_MODE  <=  localWrData( 2 downto  1);
        when 1 => --0x1
          Ctrl.FREEZE_MASK_0                  <=  localWrData(31 downto  0);
        when 2 => --0x2
          Ctrl.FREEZE_MASK_1                  <=  localWrData(31 downto  0);
        when 5 => --0x5
          Ctrl.PLAYBACK_MASK_0                <=  localWrData(31 downto  0);
        when 6 => --0x6
          Ctrl.PLAYBACK_MASK_1                <=  localWrData(31 downto  0);

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
        if localAddress(14 downto BRAM_range(iBRAM)) = BRAM_addr(iBRAM)(14 downto BRAM_range(iBRAM)) then
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
  Ctrl.SB0.SB_MEM.address   <=  BRAM_MOSI(0).address(8-1 downto 0);
  Ctrl.SB0.SB_MEM.wr_data   <=  BRAM_MOSI(0).wr_data(32-1 downto 0);

  Ctrl.SB0.SB_META.clk       <=  BRAM_MOSI(1).clk;
  Ctrl.SB0.SB_META.enable    <=  BRAM_MOSI(1).enable;
  Ctrl.SB0.SB_META.wr_enable <=  BRAM_MOSI(1).wr_enable;
  Ctrl.SB0.SB_META.address   <=  BRAM_MOSI(1).address(8-1 downto 0);
  Ctrl.SB0.SB_META.wr_data   <=  BRAM_MOSI(1).wr_data(32-1 downto 0);

  Ctrl.SB1.SB_MEM.clk       <=  BRAM_MOSI(2).clk;
  Ctrl.SB1.SB_MEM.enable    <=  BRAM_MOSI(2).enable;
  Ctrl.SB1.SB_MEM.wr_enable <=  BRAM_MOSI(2).wr_enable;
  Ctrl.SB1.SB_MEM.address   <=  BRAM_MOSI(2).address(8-1 downto 0);
  Ctrl.SB1.SB_MEM.wr_data   <=  BRAM_MOSI(2).wr_data(32-1 downto 0);

  Ctrl.SB1.SB_META.clk       <=  BRAM_MOSI(3).clk;
  Ctrl.SB1.SB_META.enable    <=  BRAM_MOSI(3).enable;
  Ctrl.SB1.SB_META.wr_enable <=  BRAM_MOSI(3).wr_enable;
  Ctrl.SB1.SB_META.address   <=  BRAM_MOSI(3).address(8-1 downto 0);
  Ctrl.SB1.SB_META.wr_data   <=  BRAM_MOSI(3).wr_data(32-1 downto 0);

  Ctrl.SB2.SB_MEM.clk       <=  BRAM_MOSI(4).clk;
  Ctrl.SB2.SB_MEM.enable    <=  BRAM_MOSI(4).enable;
  Ctrl.SB2.SB_MEM.wr_enable <=  BRAM_MOSI(4).wr_enable;
  Ctrl.SB2.SB_MEM.address   <=  BRAM_MOSI(4).address(8-1 downto 0);
  Ctrl.SB2.SB_MEM.wr_data   <=  BRAM_MOSI(4).wr_data(32-1 downto 0);

  Ctrl.SB2.SB_META.clk       <=  BRAM_MOSI(5).clk;
  Ctrl.SB2.SB_META.enable    <=  BRAM_MOSI(5).enable;
  Ctrl.SB2.SB_META.wr_enable <=  BRAM_MOSI(5).wr_enable;
  Ctrl.SB2.SB_META.address   <=  BRAM_MOSI(5).address(8-1 downto 0);
  Ctrl.SB2.SB_META.wr_data   <=  BRAM_MOSI(5).wr_data(32-1 downto 0);

  Ctrl.SB3.SB_MEM.clk       <=  BRAM_MOSI(6).clk;
  Ctrl.SB3.SB_MEM.enable    <=  BRAM_MOSI(6).enable;
  Ctrl.SB3.SB_MEM.wr_enable <=  BRAM_MOSI(6).wr_enable;
  Ctrl.SB3.SB_MEM.address   <=  BRAM_MOSI(6).address(8-1 downto 0);
  Ctrl.SB3.SB_MEM.wr_data   <=  BRAM_MOSI(6).wr_data(32-1 downto 0);

  Ctrl.SB3.SB_META.clk       <=  BRAM_MOSI(7).clk;
  Ctrl.SB3.SB_META.enable    <=  BRAM_MOSI(7).enable;
  Ctrl.SB3.SB_META.wr_enable <=  BRAM_MOSI(7).wr_enable;
  Ctrl.SB3.SB_META.address   <=  BRAM_MOSI(7).address(8-1 downto 0);
  Ctrl.SB3.SB_META.wr_data   <=  BRAM_MOSI(7).wr_data(32-1 downto 0);

  Ctrl.SB4.SB_MEM.clk       <=  BRAM_MOSI(8).clk;
  Ctrl.SB4.SB_MEM.enable    <=  BRAM_MOSI(8).enable;
  Ctrl.SB4.SB_MEM.wr_enable <=  BRAM_MOSI(8).wr_enable;
  Ctrl.SB4.SB_MEM.address   <=  BRAM_MOSI(8).address(8-1 downto 0);
  Ctrl.SB4.SB_MEM.wr_data   <=  BRAM_MOSI(8).wr_data(32-1 downto 0);

  Ctrl.SB4.SB_META.clk       <=  BRAM_MOSI(9).clk;
  Ctrl.SB4.SB_META.enable    <=  BRAM_MOSI(9).enable;
  Ctrl.SB4.SB_META.wr_enable <=  BRAM_MOSI(9).wr_enable;
  Ctrl.SB4.SB_META.address   <=  BRAM_MOSI(9).address(8-1 downto 0);
  Ctrl.SB4.SB_META.wr_data   <=  BRAM_MOSI(9).wr_data(32-1 downto 0);

  Ctrl.SB5.SB_MEM.clk       <=  BRAM_MOSI(10).clk;
  Ctrl.SB5.SB_MEM.enable    <=  BRAM_MOSI(10).enable;
  Ctrl.SB5.SB_MEM.wr_enable <=  BRAM_MOSI(10).wr_enable;
  Ctrl.SB5.SB_MEM.address   <=  BRAM_MOSI(10).address(8-1 downto 0);
  Ctrl.SB5.SB_MEM.wr_data   <=  BRAM_MOSI(10).wr_data(32-1 downto 0);

  Ctrl.SB5.SB_META.clk       <=  BRAM_MOSI(11).clk;
  Ctrl.SB5.SB_META.enable    <=  BRAM_MOSI(11).enable;
  Ctrl.SB5.SB_META.wr_enable <=  BRAM_MOSI(11).wr_enable;
  Ctrl.SB5.SB_META.address   <=  BRAM_MOSI(11).address(8-1 downto 0);
  Ctrl.SB5.SB_META.wr_data   <=  BRAM_MOSI(11).wr_data(32-1 downto 0);

  Ctrl.SB6.SB_MEM.clk       <=  BRAM_MOSI(12).clk;
  Ctrl.SB6.SB_MEM.enable    <=  BRAM_MOSI(12).enable;
  Ctrl.SB6.SB_MEM.wr_enable <=  BRAM_MOSI(12).wr_enable;
  Ctrl.SB6.SB_MEM.address   <=  BRAM_MOSI(12).address(8-1 downto 0);
  Ctrl.SB6.SB_MEM.wr_data   <=  BRAM_MOSI(12).wr_data(32-1 downto 0);

  Ctrl.SB6.SB_META.clk       <=  BRAM_MOSI(13).clk;
  Ctrl.SB6.SB_META.enable    <=  BRAM_MOSI(13).enable;
  Ctrl.SB6.SB_META.wr_enable <=  BRAM_MOSI(13).wr_enable;
  Ctrl.SB6.SB_META.address   <=  BRAM_MOSI(13).address(8-1 downto 0);
  Ctrl.SB6.SB_META.wr_data   <=  BRAM_MOSI(13).wr_data(32-1 downto 0);

  Ctrl.SB7.SB_MEM.clk       <=  BRAM_MOSI(14).clk;
  Ctrl.SB7.SB_MEM.enable    <=  BRAM_MOSI(14).enable;
  Ctrl.SB7.SB_MEM.wr_enable <=  BRAM_MOSI(14).wr_enable;
  Ctrl.SB7.SB_MEM.address   <=  BRAM_MOSI(14).address(8-1 downto 0);
  Ctrl.SB7.SB_MEM.wr_data   <=  BRAM_MOSI(14).wr_data(32-1 downto 0);

  Ctrl.SB7.SB_META.clk       <=  BRAM_MOSI(15).clk;
  Ctrl.SB7.SB_META.enable    <=  BRAM_MOSI(15).enable;
  Ctrl.SB7.SB_META.wr_enable <=  BRAM_MOSI(15).wr_enable;
  Ctrl.SB7.SB_META.address   <=  BRAM_MOSI(15).address(8-1 downto 0);
  Ctrl.SB7.SB_META.wr_data   <=  BRAM_MOSI(15).wr_data(32-1 downto 0);

  Ctrl.SB8.SB_MEM.clk       <=  BRAM_MOSI(16).clk;
  Ctrl.SB8.SB_MEM.enable    <=  BRAM_MOSI(16).enable;
  Ctrl.SB8.SB_MEM.wr_enable <=  BRAM_MOSI(16).wr_enable;
  Ctrl.SB8.SB_MEM.address   <=  BRAM_MOSI(16).address(8-1 downto 0);
  Ctrl.SB8.SB_MEM.wr_data   <=  BRAM_MOSI(16).wr_data(32-1 downto 0);

  Ctrl.SB8.SB_META.clk       <=  BRAM_MOSI(17).clk;
  Ctrl.SB8.SB_META.enable    <=  BRAM_MOSI(17).enable;
  Ctrl.SB8.SB_META.wr_enable <=  BRAM_MOSI(17).wr_enable;
  Ctrl.SB8.SB_META.address   <=  BRAM_MOSI(17).address(8-1 downto 0);
  Ctrl.SB8.SB_META.wr_data   <=  BRAM_MOSI(17).wr_data(32-1 downto 0);

  Ctrl.SB9.SB_MEM.clk       <=  BRAM_MOSI(18).clk;
  Ctrl.SB9.SB_MEM.enable    <=  BRAM_MOSI(18).enable;
  Ctrl.SB9.SB_MEM.wr_enable <=  BRAM_MOSI(18).wr_enable;
  Ctrl.SB9.SB_MEM.address   <=  BRAM_MOSI(18).address(8-1 downto 0);
  Ctrl.SB9.SB_MEM.wr_data   <=  BRAM_MOSI(18).wr_data(32-1 downto 0);

  Ctrl.SB9.SB_META.clk       <=  BRAM_MOSI(19).clk;
  Ctrl.SB9.SB_META.enable    <=  BRAM_MOSI(19).enable;
  Ctrl.SB9.SB_META.wr_enable <=  BRAM_MOSI(19).wr_enable;
  Ctrl.SB9.SB_META.address   <=  BRAM_MOSI(19).address(8-1 downto 0);
  Ctrl.SB9.SB_META.wr_data   <=  BRAM_MOSI(19).wr_data(32-1 downto 0);

  Ctrl.SB10.SB_MEM.clk       <=  BRAM_MOSI(20).clk;
  Ctrl.SB10.SB_MEM.enable    <=  BRAM_MOSI(20).enable;
  Ctrl.SB10.SB_MEM.wr_enable <=  BRAM_MOSI(20).wr_enable;
  Ctrl.SB10.SB_MEM.address   <=  BRAM_MOSI(20).address(8-1 downto 0);
  Ctrl.SB10.SB_MEM.wr_data   <=  BRAM_MOSI(20).wr_data(32-1 downto 0);

  Ctrl.SB10.SB_META.clk       <=  BRAM_MOSI(21).clk;
  Ctrl.SB10.SB_META.enable    <=  BRAM_MOSI(21).enable;
  Ctrl.SB10.SB_META.wr_enable <=  BRAM_MOSI(21).wr_enable;
  Ctrl.SB10.SB_META.address   <=  BRAM_MOSI(21).address(8-1 downto 0);
  Ctrl.SB10.SB_META.wr_data   <=  BRAM_MOSI(21).wr_data(32-1 downto 0);

  Ctrl.SB11.SB_MEM.clk       <=  BRAM_MOSI(22).clk;
  Ctrl.SB11.SB_MEM.enable    <=  BRAM_MOSI(22).enable;
  Ctrl.SB11.SB_MEM.wr_enable <=  BRAM_MOSI(22).wr_enable;
  Ctrl.SB11.SB_MEM.address   <=  BRAM_MOSI(22).address(8-1 downto 0);
  Ctrl.SB11.SB_MEM.wr_data   <=  BRAM_MOSI(22).wr_data(32-1 downto 0);

  Ctrl.SB11.SB_META.clk       <=  BRAM_MOSI(23).clk;
  Ctrl.SB11.SB_META.enable    <=  BRAM_MOSI(23).enable;
  Ctrl.SB11.SB_META.wr_enable <=  BRAM_MOSI(23).wr_enable;
  Ctrl.SB11.SB_META.address   <=  BRAM_MOSI(23).address(8-1 downto 0);
  Ctrl.SB11.SB_META.wr_data   <=  BRAM_MOSI(23).wr_data(32-1 downto 0);

  Ctrl.SB12.SB_MEM.clk       <=  BRAM_MOSI(24).clk;
  Ctrl.SB12.SB_MEM.enable    <=  BRAM_MOSI(24).enable;
  Ctrl.SB12.SB_MEM.wr_enable <=  BRAM_MOSI(24).wr_enable;
  Ctrl.SB12.SB_MEM.address   <=  BRAM_MOSI(24).address(8-1 downto 0);
  Ctrl.SB12.SB_MEM.wr_data   <=  BRAM_MOSI(24).wr_data(32-1 downto 0);

  Ctrl.SB12.SB_META.clk       <=  BRAM_MOSI(25).clk;
  Ctrl.SB12.SB_META.enable    <=  BRAM_MOSI(25).enable;
  Ctrl.SB12.SB_META.wr_enable <=  BRAM_MOSI(25).wr_enable;
  Ctrl.SB12.SB_META.address   <=  BRAM_MOSI(25).address(8-1 downto 0);
  Ctrl.SB12.SB_META.wr_data   <=  BRAM_MOSI(25).wr_data(32-1 downto 0);

  Ctrl.SB13.SB_MEM.clk       <=  BRAM_MOSI(26).clk;
  Ctrl.SB13.SB_MEM.enable    <=  BRAM_MOSI(26).enable;
  Ctrl.SB13.SB_MEM.wr_enable <=  BRAM_MOSI(26).wr_enable;
  Ctrl.SB13.SB_MEM.address   <=  BRAM_MOSI(26).address(8-1 downto 0);
  Ctrl.SB13.SB_MEM.wr_data   <=  BRAM_MOSI(26).wr_data(32-1 downto 0);

  Ctrl.SB13.SB_META.clk       <=  BRAM_MOSI(27).clk;
  Ctrl.SB13.SB_META.enable    <=  BRAM_MOSI(27).enable;
  Ctrl.SB13.SB_META.wr_enable <=  BRAM_MOSI(27).wr_enable;
  Ctrl.SB13.SB_META.address   <=  BRAM_MOSI(27).address(8-1 downto 0);
  Ctrl.SB13.SB_META.wr_data   <=  BRAM_MOSI(27).wr_data(32-1 downto 0);

  Ctrl.SB14.SB_MEM.clk       <=  BRAM_MOSI(28).clk;
  Ctrl.SB14.SB_MEM.enable    <=  BRAM_MOSI(28).enable;
  Ctrl.SB14.SB_MEM.wr_enable <=  BRAM_MOSI(28).wr_enable;
  Ctrl.SB14.SB_MEM.address   <=  BRAM_MOSI(28).address(8-1 downto 0);
  Ctrl.SB14.SB_MEM.wr_data   <=  BRAM_MOSI(28).wr_data(32-1 downto 0);

  Ctrl.SB14.SB_META.clk       <=  BRAM_MOSI(29).clk;
  Ctrl.SB14.SB_META.enable    <=  BRAM_MOSI(29).enable;
  Ctrl.SB14.SB_META.wr_enable <=  BRAM_MOSI(29).wr_enable;
  Ctrl.SB14.SB_META.address   <=  BRAM_MOSI(29).address(8-1 downto 0);
  Ctrl.SB14.SB_META.wr_data   <=  BRAM_MOSI(29).wr_data(32-1 downto 0);

  Ctrl.SB15.SB_MEM.clk       <=  BRAM_MOSI(30).clk;
  Ctrl.SB15.SB_MEM.enable    <=  BRAM_MOSI(30).enable;
  Ctrl.SB15.SB_MEM.wr_enable <=  BRAM_MOSI(30).wr_enable;
  Ctrl.SB15.SB_MEM.address   <=  BRAM_MOSI(30).address(8-1 downto 0);
  Ctrl.SB15.SB_MEM.wr_data   <=  BRAM_MOSI(30).wr_data(32-1 downto 0);

  Ctrl.SB15.SB_META.clk       <=  BRAM_MOSI(31).clk;
  Ctrl.SB15.SB_META.enable    <=  BRAM_MOSI(31).enable;
  Ctrl.SB15.SB_META.wr_enable <=  BRAM_MOSI(31).wr_enable;
  Ctrl.SB15.SB_META.address   <=  BRAM_MOSI(31).address(8-1 downto 0);
  Ctrl.SB15.SB_META.wr_data   <=  BRAM_MOSI(31).wr_data(32-1 downto 0);

  Ctrl.SB16.SB_MEM.clk       <=  BRAM_MOSI(32).clk;
  Ctrl.SB16.SB_MEM.enable    <=  BRAM_MOSI(32).enable;
  Ctrl.SB16.SB_MEM.wr_enable <=  BRAM_MOSI(32).wr_enable;
  Ctrl.SB16.SB_MEM.address   <=  BRAM_MOSI(32).address(8-1 downto 0);
  Ctrl.SB16.SB_MEM.wr_data   <=  BRAM_MOSI(32).wr_data(32-1 downto 0);

  Ctrl.SB16.SB_META.clk       <=  BRAM_MOSI(33).clk;
  Ctrl.SB16.SB_META.enable    <=  BRAM_MOSI(33).enable;
  Ctrl.SB16.SB_META.wr_enable <=  BRAM_MOSI(33).wr_enable;
  Ctrl.SB16.SB_META.address   <=  BRAM_MOSI(33).address(8-1 downto 0);
  Ctrl.SB16.SB_META.wr_data   <=  BRAM_MOSI(33).wr_data(32-1 downto 0);

  Ctrl.SB17.SB_MEM.clk       <=  BRAM_MOSI(34).clk;
  Ctrl.SB17.SB_MEM.enable    <=  BRAM_MOSI(34).enable;
  Ctrl.SB17.SB_MEM.wr_enable <=  BRAM_MOSI(34).wr_enable;
  Ctrl.SB17.SB_MEM.address   <=  BRAM_MOSI(34).address(8-1 downto 0);
  Ctrl.SB17.SB_MEM.wr_data   <=  BRAM_MOSI(34).wr_data(32-1 downto 0);

  Ctrl.SB17.SB_META.clk       <=  BRAM_MOSI(35).clk;
  Ctrl.SB17.SB_META.enable    <=  BRAM_MOSI(35).enable;
  Ctrl.SB17.SB_META.wr_enable <=  BRAM_MOSI(35).wr_enable;
  Ctrl.SB17.SB_META.address   <=  BRAM_MOSI(35).address(8-1 downto 0);
  Ctrl.SB17.SB_META.wr_data   <=  BRAM_MOSI(35).wr_data(32-1 downto 0);

  Ctrl.SB18.SB_MEM.clk       <=  BRAM_MOSI(36).clk;
  Ctrl.SB18.SB_MEM.enable    <=  BRAM_MOSI(36).enable;
  Ctrl.SB18.SB_MEM.wr_enable <=  BRAM_MOSI(36).wr_enable;
  Ctrl.SB18.SB_MEM.address   <=  BRAM_MOSI(36).address(8-1 downto 0);
  Ctrl.SB18.SB_MEM.wr_data   <=  BRAM_MOSI(36).wr_data(32-1 downto 0);

  Ctrl.SB18.SB_META.clk       <=  BRAM_MOSI(37).clk;
  Ctrl.SB18.SB_META.enable    <=  BRAM_MOSI(37).enable;
  Ctrl.SB18.SB_META.wr_enable <=  BRAM_MOSI(37).wr_enable;
  Ctrl.SB18.SB_META.address   <=  BRAM_MOSI(37).address(8-1 downto 0);
  Ctrl.SB18.SB_META.wr_data   <=  BRAM_MOSI(37).wr_data(32-1 downto 0);

  Ctrl.SB19.SB_MEM.clk       <=  BRAM_MOSI(38).clk;
  Ctrl.SB19.SB_MEM.enable    <=  BRAM_MOSI(38).enable;
  Ctrl.SB19.SB_MEM.wr_enable <=  BRAM_MOSI(38).wr_enable;
  Ctrl.SB19.SB_MEM.address   <=  BRAM_MOSI(38).address(8-1 downto 0);
  Ctrl.SB19.SB_MEM.wr_data   <=  BRAM_MOSI(38).wr_data(32-1 downto 0);

  Ctrl.SB19.SB_META.clk       <=  BRAM_MOSI(39).clk;
  Ctrl.SB19.SB_META.enable    <=  BRAM_MOSI(39).enable;
  Ctrl.SB19.SB_META.wr_enable <=  BRAM_MOSI(39).wr_enable;
  Ctrl.SB19.SB_META.address   <=  BRAM_MOSI(39).address(8-1 downto 0);
  Ctrl.SB19.SB_META.wr_data   <=  BRAM_MOSI(39).wr_data(32-1 downto 0);

  Ctrl.SB20.SB_MEM.clk       <=  BRAM_MOSI(40).clk;
  Ctrl.SB20.SB_MEM.enable    <=  BRAM_MOSI(40).enable;
  Ctrl.SB20.SB_MEM.wr_enable <=  BRAM_MOSI(40).wr_enable;
  Ctrl.SB20.SB_MEM.address   <=  BRAM_MOSI(40).address(8-1 downto 0);
  Ctrl.SB20.SB_MEM.wr_data   <=  BRAM_MOSI(40).wr_data(32-1 downto 0);

  Ctrl.SB20.SB_META.clk       <=  BRAM_MOSI(41).clk;
  Ctrl.SB20.SB_META.enable    <=  BRAM_MOSI(41).enable;
  Ctrl.SB20.SB_META.wr_enable <=  BRAM_MOSI(41).wr_enable;
  Ctrl.SB20.SB_META.address   <=  BRAM_MOSI(41).address(8-1 downto 0);
  Ctrl.SB20.SB_META.wr_data   <=  BRAM_MOSI(41).wr_data(32-1 downto 0);

  Ctrl.SB21.SB_MEM.clk       <=  BRAM_MOSI(42).clk;
  Ctrl.SB21.SB_MEM.enable    <=  BRAM_MOSI(42).enable;
  Ctrl.SB21.SB_MEM.wr_enable <=  BRAM_MOSI(42).wr_enable;
  Ctrl.SB21.SB_MEM.address   <=  BRAM_MOSI(42).address(8-1 downto 0);
  Ctrl.SB21.SB_MEM.wr_data   <=  BRAM_MOSI(42).wr_data(32-1 downto 0);

  Ctrl.SB21.SB_META.clk       <=  BRAM_MOSI(43).clk;
  Ctrl.SB21.SB_META.enable    <=  BRAM_MOSI(43).enable;
  Ctrl.SB21.SB_META.wr_enable <=  BRAM_MOSI(43).wr_enable;
  Ctrl.SB21.SB_META.address   <=  BRAM_MOSI(43).address(8-1 downto 0);
  Ctrl.SB21.SB_META.wr_data   <=  BRAM_MOSI(43).wr_data(32-1 downto 0);

  Ctrl.SB22.SB_MEM.clk       <=  BRAM_MOSI(44).clk;
  Ctrl.SB22.SB_MEM.enable    <=  BRAM_MOSI(44).enable;
  Ctrl.SB22.SB_MEM.wr_enable <=  BRAM_MOSI(44).wr_enable;
  Ctrl.SB22.SB_MEM.address   <=  BRAM_MOSI(44).address(8-1 downto 0);
  Ctrl.SB22.SB_MEM.wr_data   <=  BRAM_MOSI(44).wr_data(32-1 downto 0);

  Ctrl.SB22.SB_META.clk       <=  BRAM_MOSI(45).clk;
  Ctrl.SB22.SB_META.enable    <=  BRAM_MOSI(45).enable;
  Ctrl.SB22.SB_META.wr_enable <=  BRAM_MOSI(45).wr_enable;
  Ctrl.SB22.SB_META.address   <=  BRAM_MOSI(45).address(8-1 downto 0);
  Ctrl.SB22.SB_META.wr_data   <=  BRAM_MOSI(45).wr_data(32-1 downto 0);

  Ctrl.SB23.SB_MEM.clk       <=  BRAM_MOSI(46).clk;
  Ctrl.SB23.SB_MEM.enable    <=  BRAM_MOSI(46).enable;
  Ctrl.SB23.SB_MEM.wr_enable <=  BRAM_MOSI(46).wr_enable;
  Ctrl.SB23.SB_MEM.address   <=  BRAM_MOSI(46).address(8-1 downto 0);
  Ctrl.SB23.SB_MEM.wr_data   <=  BRAM_MOSI(46).wr_data(32-1 downto 0);

  Ctrl.SB23.SB_META.clk       <=  BRAM_MOSI(47).clk;
  Ctrl.SB23.SB_META.enable    <=  BRAM_MOSI(47).enable;
  Ctrl.SB23.SB_META.wr_enable <=  BRAM_MOSI(47).wr_enable;
  Ctrl.SB23.SB_META.address   <=  BRAM_MOSI(47).address(8-1 downto 0);
  Ctrl.SB23.SB_META.wr_data   <=  BRAM_MOSI(47).wr_data(32-1 downto 0);

  Ctrl.SB24.SB_MEM.clk       <=  BRAM_MOSI(48).clk;
  Ctrl.SB24.SB_MEM.enable    <=  BRAM_MOSI(48).enable;
  Ctrl.SB24.SB_MEM.wr_enable <=  BRAM_MOSI(48).wr_enable;
  Ctrl.SB24.SB_MEM.address   <=  BRAM_MOSI(48).address(8-1 downto 0);
  Ctrl.SB24.SB_MEM.wr_data   <=  BRAM_MOSI(48).wr_data(32-1 downto 0);

  Ctrl.SB24.SB_META.clk       <=  BRAM_MOSI(49).clk;
  Ctrl.SB24.SB_META.enable    <=  BRAM_MOSI(49).enable;
  Ctrl.SB24.SB_META.wr_enable <=  BRAM_MOSI(49).wr_enable;
  Ctrl.SB24.SB_META.address   <=  BRAM_MOSI(49).address(8-1 downto 0);
  Ctrl.SB24.SB_META.wr_data   <=  BRAM_MOSI(49).wr_data(32-1 downto 0);

  Ctrl.SB25.SB_MEM.clk       <=  BRAM_MOSI(50).clk;
  Ctrl.SB25.SB_MEM.enable    <=  BRAM_MOSI(50).enable;
  Ctrl.SB25.SB_MEM.wr_enable <=  BRAM_MOSI(50).wr_enable;
  Ctrl.SB25.SB_MEM.address   <=  BRAM_MOSI(50).address(8-1 downto 0);
  Ctrl.SB25.SB_MEM.wr_data   <=  BRAM_MOSI(50).wr_data(32-1 downto 0);

  Ctrl.SB25.SB_META.clk       <=  BRAM_MOSI(51).clk;
  Ctrl.SB25.SB_META.enable    <=  BRAM_MOSI(51).enable;
  Ctrl.SB25.SB_META.wr_enable <=  BRAM_MOSI(51).wr_enable;
  Ctrl.SB25.SB_META.address   <=  BRAM_MOSI(51).address(8-1 downto 0);
  Ctrl.SB25.SB_META.wr_data   <=  BRAM_MOSI(51).wr_data(32-1 downto 0);

  Ctrl.SB26.SB_MEM.clk       <=  BRAM_MOSI(52).clk;
  Ctrl.SB26.SB_MEM.enable    <=  BRAM_MOSI(52).enable;
  Ctrl.SB26.SB_MEM.wr_enable <=  BRAM_MOSI(52).wr_enable;
  Ctrl.SB26.SB_MEM.address   <=  BRAM_MOSI(52).address(8-1 downto 0);
  Ctrl.SB26.SB_MEM.wr_data   <=  BRAM_MOSI(52).wr_data(32-1 downto 0);

  Ctrl.SB26.SB_META.clk       <=  BRAM_MOSI(53).clk;
  Ctrl.SB26.SB_META.enable    <=  BRAM_MOSI(53).enable;
  Ctrl.SB26.SB_META.wr_enable <=  BRAM_MOSI(53).wr_enable;
  Ctrl.SB26.SB_META.address   <=  BRAM_MOSI(53).address(8-1 downto 0);
  Ctrl.SB26.SB_META.wr_data   <=  BRAM_MOSI(53).wr_data(32-1 downto 0);


  BRAM_MISO(0).rd_data(32-1 downto 0) <= Mon.SB0.SB_MEM.rd_data;
  --BRAM_MISO(0).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(0).rd_data_valid <= Mon.SB0.SB_MEM.rd_data_valid;

  BRAM_MISO(1).rd_data(32-1 downto 0) <= Mon.SB0.SB_META.rd_data;
  --BRAM_MISO(1).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(1).rd_data_valid <= Mon.SB0.SB_META.rd_data_valid;

  BRAM_MISO(2).rd_data(32-1 downto 0) <= Mon.SB1.SB_MEM.rd_data;
  --BRAM_MISO(2).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(2).rd_data_valid <= Mon.SB1.SB_MEM.rd_data_valid;

  BRAM_MISO(3).rd_data(32-1 downto 0) <= Mon.SB1.SB_META.rd_data;
  --BRAM_MISO(3).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(3).rd_data_valid <= Mon.SB1.SB_META.rd_data_valid;

  BRAM_MISO(4).rd_data(32-1 downto 0) <= Mon.SB2.SB_MEM.rd_data;
  --BRAM_MISO(4).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(4).rd_data_valid <= Mon.SB2.SB_MEM.rd_data_valid;

  BRAM_MISO(5).rd_data(32-1 downto 0) <= Mon.SB2.SB_META.rd_data;
  --BRAM_MISO(5).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(5).rd_data_valid <= Mon.SB2.SB_META.rd_data_valid;

  BRAM_MISO(6).rd_data(32-1 downto 0) <= Mon.SB3.SB_MEM.rd_data;
  --BRAM_MISO(6).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(6).rd_data_valid <= Mon.SB3.SB_MEM.rd_data_valid;

  BRAM_MISO(7).rd_data(32-1 downto 0) <= Mon.SB3.SB_META.rd_data;
  --BRAM_MISO(7).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(7).rd_data_valid <= Mon.SB3.SB_META.rd_data_valid;

  BRAM_MISO(8).rd_data(32-1 downto 0) <= Mon.SB4.SB_MEM.rd_data;
  --BRAM_MISO(8).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(8).rd_data_valid <= Mon.SB4.SB_MEM.rd_data_valid;

  BRAM_MISO(9).rd_data(32-1 downto 0) <= Mon.SB4.SB_META.rd_data;
  --BRAM_MISO(9).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(9).rd_data_valid <= Mon.SB4.SB_META.rd_data_valid;

  BRAM_MISO(10).rd_data(32-1 downto 0) <= Mon.SB5.SB_MEM.rd_data;
  --BRAM_MISO(10).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(10).rd_data_valid <= Mon.SB5.SB_MEM.rd_data_valid;

  BRAM_MISO(11).rd_data(32-1 downto 0) <= Mon.SB5.SB_META.rd_data;
  --BRAM_MISO(11).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(11).rd_data_valid <= Mon.SB5.SB_META.rd_data_valid;

  BRAM_MISO(12).rd_data(32-1 downto 0) <= Mon.SB6.SB_MEM.rd_data;
  --BRAM_MISO(12).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(12).rd_data_valid <= Mon.SB6.SB_MEM.rd_data_valid;

  BRAM_MISO(13).rd_data(32-1 downto 0) <= Mon.SB6.SB_META.rd_data;
  --BRAM_MISO(13).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(13).rd_data_valid <= Mon.SB6.SB_META.rd_data_valid;

  BRAM_MISO(14).rd_data(32-1 downto 0) <= Mon.SB7.SB_MEM.rd_data;
  --BRAM_MISO(14).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(14).rd_data_valid <= Mon.SB7.SB_MEM.rd_data_valid;

  BRAM_MISO(15).rd_data(32-1 downto 0) <= Mon.SB7.SB_META.rd_data;
  --BRAM_MISO(15).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(15).rd_data_valid <= Mon.SB7.SB_META.rd_data_valid;

  BRAM_MISO(16).rd_data(32-1 downto 0) <= Mon.SB8.SB_MEM.rd_data;
  --BRAM_MISO(16).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(16).rd_data_valid <= Mon.SB8.SB_MEM.rd_data_valid;

  BRAM_MISO(17).rd_data(32-1 downto 0) <= Mon.SB8.SB_META.rd_data;
  --BRAM_MISO(17).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(17).rd_data_valid <= Mon.SB8.SB_META.rd_data_valid;

  BRAM_MISO(18).rd_data(32-1 downto 0) <= Mon.SB9.SB_MEM.rd_data;
  --BRAM_MISO(18).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(18).rd_data_valid <= Mon.SB9.SB_MEM.rd_data_valid;

  BRAM_MISO(19).rd_data(32-1 downto 0) <= Mon.SB9.SB_META.rd_data;
  --BRAM_MISO(19).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(19).rd_data_valid <= Mon.SB9.SB_META.rd_data_valid;

  BRAM_MISO(20).rd_data(32-1 downto 0) <= Mon.SB10.SB_MEM.rd_data;
  --BRAM_MISO(20).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(20).rd_data_valid <= Mon.SB10.SB_MEM.rd_data_valid;

  BRAM_MISO(21).rd_data(32-1 downto 0) <= Mon.SB10.SB_META.rd_data;
  --BRAM_MISO(21).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(21).rd_data_valid <= Mon.SB10.SB_META.rd_data_valid;

  BRAM_MISO(22).rd_data(32-1 downto 0) <= Mon.SB11.SB_MEM.rd_data;
  --BRAM_MISO(22).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(22).rd_data_valid <= Mon.SB11.SB_MEM.rd_data_valid;

  BRAM_MISO(23).rd_data(32-1 downto 0) <= Mon.SB11.SB_META.rd_data;
  --BRAM_MISO(23).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(23).rd_data_valid <= Mon.SB11.SB_META.rd_data_valid;

  BRAM_MISO(24).rd_data(32-1 downto 0) <= Mon.SB12.SB_MEM.rd_data;
  --BRAM_MISO(24).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(24).rd_data_valid <= Mon.SB12.SB_MEM.rd_data_valid;

  BRAM_MISO(25).rd_data(32-1 downto 0) <= Mon.SB12.SB_META.rd_data;
  --BRAM_MISO(25).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(25).rd_data_valid <= Mon.SB12.SB_META.rd_data_valid;

  BRAM_MISO(26).rd_data(32-1 downto 0) <= Mon.SB13.SB_MEM.rd_data;
  --BRAM_MISO(26).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(26).rd_data_valid <= Mon.SB13.SB_MEM.rd_data_valid;

  BRAM_MISO(27).rd_data(32-1 downto 0) <= Mon.SB13.SB_META.rd_data;
  --BRAM_MISO(27).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(27).rd_data_valid <= Mon.SB13.SB_META.rd_data_valid;

  BRAM_MISO(28).rd_data(32-1 downto 0) <= Mon.SB14.SB_MEM.rd_data;
  --BRAM_MISO(28).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(28).rd_data_valid <= Mon.SB14.SB_MEM.rd_data_valid;

  BRAM_MISO(29).rd_data(32-1 downto 0) <= Mon.SB14.SB_META.rd_data;
  --BRAM_MISO(29).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(29).rd_data_valid <= Mon.SB14.SB_META.rd_data_valid;

  BRAM_MISO(30).rd_data(32-1 downto 0) <= Mon.SB15.SB_MEM.rd_data;
  --BRAM_MISO(30).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(30).rd_data_valid <= Mon.SB15.SB_MEM.rd_data_valid;

  BRAM_MISO(31).rd_data(32-1 downto 0) <= Mon.SB15.SB_META.rd_data;
  --BRAM_MISO(31).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(31).rd_data_valid <= Mon.SB15.SB_META.rd_data_valid;

  BRAM_MISO(32).rd_data(32-1 downto 0) <= Mon.SB16.SB_MEM.rd_data;
  --BRAM_MISO(32).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(32).rd_data_valid <= Mon.SB16.SB_MEM.rd_data_valid;

  BRAM_MISO(33).rd_data(32-1 downto 0) <= Mon.SB16.SB_META.rd_data;
  --BRAM_MISO(33).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(33).rd_data_valid <= Mon.SB16.SB_META.rd_data_valid;

  BRAM_MISO(34).rd_data(32-1 downto 0) <= Mon.SB17.SB_MEM.rd_data;
  --BRAM_MISO(34).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(34).rd_data_valid <= Mon.SB17.SB_MEM.rd_data_valid;

  BRAM_MISO(35).rd_data(32-1 downto 0) <= Mon.SB17.SB_META.rd_data;
  --BRAM_MISO(35).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(35).rd_data_valid <= Mon.SB17.SB_META.rd_data_valid;

  BRAM_MISO(36).rd_data(32-1 downto 0) <= Mon.SB18.SB_MEM.rd_data;
  --BRAM_MISO(36).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(36).rd_data_valid <= Mon.SB18.SB_MEM.rd_data_valid;

  BRAM_MISO(37).rd_data(32-1 downto 0) <= Mon.SB18.SB_META.rd_data;
  --BRAM_MISO(37).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(37).rd_data_valid <= Mon.SB18.SB_META.rd_data_valid;

  BRAM_MISO(38).rd_data(32-1 downto 0) <= Mon.SB19.SB_MEM.rd_data;
  --BRAM_MISO(38).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(38).rd_data_valid <= Mon.SB19.SB_MEM.rd_data_valid;

  BRAM_MISO(39).rd_data(32-1 downto 0) <= Mon.SB19.SB_META.rd_data;
  --BRAM_MISO(39).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(39).rd_data_valid <= Mon.SB19.SB_META.rd_data_valid;

  BRAM_MISO(40).rd_data(32-1 downto 0) <= Mon.SB20.SB_MEM.rd_data;
  --BRAM_MISO(40).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(40).rd_data_valid <= Mon.SB20.SB_MEM.rd_data_valid;

  BRAM_MISO(41).rd_data(32-1 downto 0) <= Mon.SB20.SB_META.rd_data;
  --BRAM_MISO(41).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(41).rd_data_valid <= Mon.SB20.SB_META.rd_data_valid;

  BRAM_MISO(42).rd_data(32-1 downto 0) <= Mon.SB21.SB_MEM.rd_data;
  --BRAM_MISO(42).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(42).rd_data_valid <= Mon.SB21.SB_MEM.rd_data_valid;

  BRAM_MISO(43).rd_data(32-1 downto 0) <= Mon.SB21.SB_META.rd_data;
  --BRAM_MISO(43).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(43).rd_data_valid <= Mon.SB21.SB_META.rd_data_valid;

  BRAM_MISO(44).rd_data(32-1 downto 0) <= Mon.SB22.SB_MEM.rd_data;
  --BRAM_MISO(44).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(44).rd_data_valid <= Mon.SB22.SB_MEM.rd_data_valid;

  BRAM_MISO(45).rd_data(32-1 downto 0) <= Mon.SB22.SB_META.rd_data;
  --BRAM_MISO(45).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(45).rd_data_valid <= Mon.SB22.SB_META.rd_data_valid;

  BRAM_MISO(46).rd_data(32-1 downto 0) <= Mon.SB23.SB_MEM.rd_data;
  --BRAM_MISO(46).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(46).rd_data_valid <= Mon.SB23.SB_MEM.rd_data_valid;

  BRAM_MISO(47).rd_data(32-1 downto 0) <= Mon.SB23.SB_META.rd_data;
  --BRAM_MISO(47).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(47).rd_data_valid <= Mon.SB23.SB_META.rd_data_valid;

  BRAM_MISO(48).rd_data(32-1 downto 0) <= Mon.SB24.SB_MEM.rd_data;
  --BRAM_MISO(48).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(48).rd_data_valid <= Mon.SB24.SB_MEM.rd_data_valid;

  BRAM_MISO(49).rd_data(32-1 downto 0) <= Mon.SB24.SB_META.rd_data;
  --BRAM_MISO(49).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(49).rd_data_valid <= Mon.SB24.SB_META.rd_data_valid;

  BRAM_MISO(50).rd_data(32-1 downto 0) <= Mon.SB25.SB_MEM.rd_data;
  --BRAM_MISO(50).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(50).rd_data_valid <= Mon.SB25.SB_MEM.rd_data_valid;

  BRAM_MISO(51).rd_data(32-1 downto 0) <= Mon.SB25.SB_META.rd_data;
  --BRAM_MISO(51).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(51).rd_data_valid <= Mon.SB25.SB_META.rd_data_valid;

  BRAM_MISO(52).rd_data(32-1 downto 0) <= Mon.SB26.SB_MEM.rd_data;
  --BRAM_MISO(52).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(52).rd_data_valid <= Mon.SB26.SB_MEM.rd_data_valid;

  BRAM_MISO(53).rd_data(32-1 downto 0) <= Mon.SB26.SB_META.rd_data;
  --BRAM_MISO(53).rd_data(31 downto 32) <= (others => '0');
  BRAM_MISO(53).rd_data_valid <= Mon.SB26.SB_META.rd_data_valid;


  BRAM_writes: for iBRAM in 0 to BRAM_COUNT-1 generate
    BRAM_write: process (clk_axi,reset_axi_n) is
    begin  -- process BRAM_reads
      if reset_axi_n = '0' then
        BRAM_MOSI(iBRAM).wr_enable   <= '0';
      elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
        BRAM_MOSI(iBRAM).wr_enable   <= '0';
        if localAddress(14 downto BRAM_range(iBRAM)) = BRAM_addr(iBRAM)(14 downto BRAM_range(iBRAM)) then
          BRAM_MOSI(iBRAM).wr_enable   <= localWrEn;
        end if;
      end if;
    end process BRAM_write;
  end generate BRAM_writes;



end architecture behavioral;
