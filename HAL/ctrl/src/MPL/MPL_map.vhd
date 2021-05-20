--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.AXIRegPkg.all;
use work.types.all;
use work.MPL_Ctrl.all;
use work.MPL_Ctrl_DEF.all;
entity MPL_interface is
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    Mon              : in  MPL_Mon_t;
    Ctrl             : out MPL_Ctrl_t
    );
end entity MPL_interface;
architecture behavioral of MPL_interface is
  signal localAddress       : slv_32_t;
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;


  signal reg_data :  slv32_array_t(integer range 0 to 16680);
  constant Default_reg_data : slv32_array_t(integer range 0 to 16680) := (others => x"00000000");
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
      case to_integer(unsigned(localAddress(14 downto 0))) is

        when 1 => --0x1
          localRdData( 3 downto  0)  <=  reg_data(1)( 3 downto  0);                   -- 
          localRdData( 4)            <=  reg_data(1)( 4);                             -- 
          localRdData( 5)            <=  reg_data(1)( 5);                             -- 
          localRdData( 6)            <=  reg_data(1)( 6);                             -- 
        when 8485 => --0x2125
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(2).rd_data.rd_data_1;      -- Read Data 1
        when 4390 => --0x1126
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(1).rd_data.rd_data_2;      -- Read Data 2
        when 8469 => --0x2115
          localRdData(31 downto  0)  <=  reg_data(8469)(31 downto  0);                -- Write Data 1
        when 261 => --0x105
          localRdData( 0)            <=  Mon.PL_MEM.PL_MEM(0).rd_rdy;                 -- Read ready
        when 4358 => --0x1106
          localRdData(11 downto  0)  <=  reg_data(4358)(11 downto  0);                -- wr_Address
          localRdData(27 downto 16)  <=  reg_data(4358)(27 downto 16);                -- rd_Address
        when 16677 => --0x4125
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(4).rd_data.rd_data_1;      -- Read Data 1
        when 279 => --0x117
          localRdData(31 downto  0)  <=  reg_data(279)(31 downto  0);                 -- Write Data 3
        when 12582 => --0x3126
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(3).rd_data.rd_data_2;      -- Read Data 2
        when 16660 => --0x4114
          localRdData(31 downto  0)  <=  reg_data(16660)(31 downto  0);               -- Write Data 0
        when 16 => --0x10
          localRdData( 0)            <=  Mon.STATUS.ENABLED;                          -- 
          localRdData( 1)            <=  Mon.STATUS.READY;                            -- 
          localRdData( 2)            <=  Mon.STATUS.ERROR;                            -- 
        when 4376 => --0x1118
          localRdData(19 downto  0)  <=  reg_data(4376)(19 downto  0);                -- Write Data 4
        when 4372 => --0x1114
          localRdData(31 downto  0)  <=  reg_data(4372)(31 downto  0);                -- Write Data 0
        when 277 => --0x115
          localRdData(31 downto  0)  <=  reg_data(277)(31 downto  0);                 -- Write Data 1
        when 4374 => --0x1116
          localRdData(31 downto  0)  <=  reg_data(4374)(31 downto  0);                -- Write Data 2
        when 4375 => --0x1117
          localRdData(31 downto  0)  <=  reg_data(4375)(31 downto  0);                -- Write Data 3
        when 280 => --0x118
          localRdData(19 downto  0)  <=  reg_data(280)(19 downto  0);                 -- Write Data 4
        when 12581 => --0x3125
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(3).rd_data.rd_data_1;      -- Read Data 1
        when 4357 => --0x1105
          localRdData( 0)            <=  Mon.PL_MEM.PL_MEM(1).rd_rdy;                 -- Read ready
        when 16678 => --0x4126
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(4).rd_data.rd_data_2;      -- Read Data 2
        when 8487 => --0x2127
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(2).rd_data.rd_data_3;      -- Read Data 3
        when 278 => --0x116
          localRdData(31 downto  0)  <=  reg_data(278)(31 downto  0);                 -- Write Data 2
        when 292 => --0x124
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(0).rd_data.rd_data_0;      -- Read Data 0
        when 262 => --0x106
          localRdData(11 downto  0)  <=  reg_data(262)(11 downto  0);                 -- wr_Address
          localRdData(27 downto 16)  <=  reg_data(262)(27 downto 16);                 -- rd_Address
        when 294 => --0x126
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(0).rd_data.rd_data_2;      -- Read Data 2
        when 295 => --0x127
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(0).rd_data.rd_data_3;      -- Read Data 3
        when 296 => --0x128
          localRdData(19 downto  0)  <=  Mon.PL_MEM.PL_MEM(0).rd_data.rd_data_4;      -- Read Data 4
        when 12583 => --0x3127
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(3).rd_data.rd_data_3;      -- Read Data 3
        when 8470 => --0x2116
          localRdData(31 downto  0)  <=  reg_data(8470)(31 downto  0);                -- Write Data 2
        when 12550 => --0x3106
          localRdData(11 downto  0)  <=  reg_data(12550)(11 downto  0);               -- wr_Address
          localRdData(27 downto 16)  <=  reg_data(12550)(27 downto 16);               -- rd_Address
        when 16679 => --0x4127
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(4).rd_data.rd_data_3;      -- Read Data 3
        when 12566 => --0x3116
          localRdData(31 downto  0)  <=  reg_data(12566)(31 downto  0);               -- Write Data 2
        when 12564 => --0x3114
          localRdData(31 downto  0)  <=  reg_data(12564)(31 downto  0);               -- Write Data 0
        when 16661 => --0x4115
          localRdData(31 downto  0)  <=  reg_data(16661)(31 downto  0);               -- Write Data 1
        when 16662 => --0x4116
          localRdData(31 downto  0)  <=  reg_data(16662)(31 downto  0);               -- Write Data 2
        when 12565 => --0x3115
          localRdData(31 downto  0)  <=  reg_data(12565)(31 downto  0);               -- Write Data 1
        when 8453 => --0x2105
          localRdData( 0)            <=  Mon.PL_MEM.PL_MEM(2).rd_rdy;                 -- Read ready
        when 8488 => --0x2128
          localRdData(19 downto  0)  <=  Mon.PL_MEM.PL_MEM(2).rd_data.rd_data_4;      -- Read Data 4
        when 8471 => --0x2117
          localRdData(31 downto  0)  <=  reg_data(8471)(31 downto  0);                -- Write Data 3
        when 12549 => --0x3105
          localRdData( 0)            <=  Mon.PL_MEM.PL_MEM(3).rd_rdy;                 -- Read ready
        when 8454 => --0x2106
          localRdData(11 downto  0)  <=  reg_data(8454)(11 downto  0);                -- wr_Address
          localRdData(27 downto 16)  <=  reg_data(8454)(27 downto 16);                -- rd_Address
        when 16645 => --0x4105
          localRdData( 0)            <=  Mon.PL_MEM.PL_MEM(4).rd_rdy;                 -- Read ready
        when 8484 => --0x2124
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(2).rd_data.rd_data_0;      -- Read Data 0
        when 12584 => --0x3128
          localRdData(19 downto  0)  <=  Mon.PL_MEM.PL_MEM(3).rd_data.rd_data_4;      -- Read Data 4
        when 16680 => --0x4128
          localRdData(19 downto  0)  <=  Mon.PL_MEM.PL_MEM(4).rd_data.rd_data_4;      -- Read Data 4
        when 12567 => --0x3117
          localRdData(31 downto  0)  <=  reg_data(12567)(31 downto  0);               -- Write Data 3
        when 16663 => --0x4117
          localRdData(31 downto  0)  <=  reg_data(16663)(31 downto  0);               -- Write Data 3
        when 8486 => --0x2126
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(2).rd_data.rd_data_2;      -- Read Data 2
        when 4388 => --0x1124
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(1).rd_data.rd_data_0;      -- Read Data 0
        when 16646 => --0x4106
          localRdData(11 downto  0)  <=  reg_data(16646)(11 downto  0);               -- wr_Address
          localRdData(27 downto 16)  <=  reg_data(16646)(27 downto 16);               -- rd_Address
        when 8472 => --0x2118
          localRdData(19 downto  0)  <=  reg_data(8472)(19 downto  0);                -- Write Data 4
        when 293 => --0x125
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(0).rd_data.rd_data_1;      -- Read Data 1
        when 12568 => --0x3118
          localRdData(19 downto  0)  <=  reg_data(12568)(19 downto  0);               -- Write Data 4
        when 4389 => --0x1125
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(1).rd_data.rd_data_1;      -- Read Data 1
        when 8468 => --0x2114
          localRdData(31 downto  0)  <=  reg_data(8468)(31 downto  0);                -- Write Data 0
        when 16664 => --0x4118
          localRdData(19 downto  0)  <=  reg_data(16664)(19 downto  0);               -- Write Data 4
        when 4391 => --0x1127
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(1).rd_data.rd_data_3;      -- Read Data 3
        when 12580 => --0x3124
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(3).rd_data.rd_data_0;      -- Read Data 0
        when 4392 => --0x1128
          localRdData(19 downto  0)  <=  Mon.PL_MEM.PL_MEM(1).rd_data.rd_data_4;      -- Read Data 4
        when 16676 => --0x4124
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(4).rd_data.rd_data_0;      -- Read Data 0
        when 276 => --0x114
          localRdData(31 downto  0)  <=  reg_data(276)(31 downto  0);                 -- Write Data 0
        when 4373 => --0x1115
          localRdData(31 downto  0)  <=  reg_data(4373)(31 downto  0);                -- Write Data 1


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.CONFIGS.THREADS                     <=  reg_data(1)( 3 downto  0);         
  Ctrl.CONFIGS.INPUT_EN                    <=  reg_data(1)( 4);                   
  Ctrl.CONFIGS.OUTPUT_EN                   <=  reg_data(1)( 5);                   
  Ctrl.CONFIGS.FLUSH_MEM_RESET             <=  reg_data(1)( 6);                   
  Ctrl.PL_MEM.PL_MEM(0).wr_addr            <=  reg_data(262)(11 downto  0);       
  Ctrl.PL_MEM.PL_MEM(0).rd_addr            <=  reg_data(262)(27 downto 16);       
  Ctrl.PL_MEM.PL_MEM(0).wr_data.wr_data_0  <=  reg_data(276)(31 downto  0);       
  Ctrl.PL_MEM.PL_MEM(0).wr_data.wr_data_4  <=  reg_data(280)(19 downto  0);       
  Ctrl.PL_MEM.PL_MEM(0).wr_data.wr_data_1  <=  reg_data(277)(31 downto  0);       
  Ctrl.PL_MEM.PL_MEM(0).wr_data.wr_data_2  <=  reg_data(278)(31 downto  0);       
  Ctrl.PL_MEM.PL_MEM(0).wr_data.wr_data_3  <=  reg_data(279)(31 downto  0);       
  Ctrl.PL_MEM.PL_MEM(1).wr_addr            <=  reg_data(4358)(11 downto  0);      
  Ctrl.PL_MEM.PL_MEM(1).rd_addr            <=  reg_data(4358)(27 downto 16);      
  Ctrl.PL_MEM.PL_MEM(1).wr_data.wr_data_0  <=  reg_data(4372)(31 downto  0);      
  Ctrl.PL_MEM.PL_MEM(1).wr_data.wr_data_4  <=  reg_data(4376)(19 downto  0);      
  Ctrl.PL_MEM.PL_MEM(1).wr_data.wr_data_1  <=  reg_data(4373)(31 downto  0);      
  Ctrl.PL_MEM.PL_MEM(1).wr_data.wr_data_2  <=  reg_data(4374)(31 downto  0);      
  Ctrl.PL_MEM.PL_MEM(1).wr_data.wr_data_3  <=  reg_data(4375)(31 downto  0);      
  Ctrl.PL_MEM.PL_MEM(2).wr_addr            <=  reg_data(8454)(11 downto  0);      
  Ctrl.PL_MEM.PL_MEM(2).rd_addr            <=  reg_data(8454)(27 downto 16);      
  Ctrl.PL_MEM.PL_MEM(2).wr_data.wr_data_0  <=  reg_data(8468)(31 downto  0);      
  Ctrl.PL_MEM.PL_MEM(2).wr_data.wr_data_4  <=  reg_data(8472)(19 downto  0);      
  Ctrl.PL_MEM.PL_MEM(2).wr_data.wr_data_1  <=  reg_data(8469)(31 downto  0);      
  Ctrl.PL_MEM.PL_MEM(2).wr_data.wr_data_2  <=  reg_data(8470)(31 downto  0);      
  Ctrl.PL_MEM.PL_MEM(2).wr_data.wr_data_3  <=  reg_data(8471)(31 downto  0);      
  Ctrl.PL_MEM.PL_MEM(3).wr_addr            <=  reg_data(12550)(11 downto  0);     
  Ctrl.PL_MEM.PL_MEM(3).rd_addr            <=  reg_data(12550)(27 downto 16);     
  Ctrl.PL_MEM.PL_MEM(3).wr_data.wr_data_0  <=  reg_data(12564)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(3).wr_data.wr_data_4  <=  reg_data(12568)(19 downto  0);     
  Ctrl.PL_MEM.PL_MEM(3).wr_data.wr_data_1  <=  reg_data(12565)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(3).wr_data.wr_data_2  <=  reg_data(12566)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(3).wr_data.wr_data_3  <=  reg_data(12567)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).wr_addr            <=  reg_data(16646)(11 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).rd_addr            <=  reg_data(16646)(27 downto 16);     
  Ctrl.PL_MEM.PL_MEM(4).wr_data.wr_data_0  <=  reg_data(16660)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).wr_data.wr_data_4  <=  reg_data(16664)(19 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).wr_data.wr_data_1  <=  reg_data(16661)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).wr_data.wr_data_2  <=  reg_data(16662)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).wr_data.wr_data_3  <=  reg_data(16663)(31 downto  0);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data(1)( 3 downto  0)  <= DEFAULT_MPL_CTRL_t.CONFIGS.THREADS;
      reg_data(1)( 4)  <= DEFAULT_MPL_CTRL_t.CONFIGS.INPUT_EN;
      reg_data(1)( 5)  <= DEFAULT_MPL_CTRL_t.CONFIGS.OUTPUT_EN;
      reg_data(1)( 6)  <= DEFAULT_MPL_CTRL_t.CONFIGS.FLUSH_MEM_RESET;
      reg_data(262)(11 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_addr;
      reg_data(262)(27 downto 16)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).rd_addr;
      reg_data(276)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_data.wr_data_0;
      reg_data(280)(19 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_data.wr_data_4;
      reg_data(277)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_data.wr_data_1;
      reg_data(278)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_data.wr_data_2;
      reg_data(279)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_data.wr_data_3;
      reg_data(4358)(11 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_addr;
      reg_data(4358)(27 downto 16)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).rd_addr;
      reg_data(4372)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_data.wr_data_0;
      reg_data(4376)(19 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_data.wr_data_4;
      reg_data(4373)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_data.wr_data_1;
      reg_data(4374)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_data.wr_data_2;
      reg_data(4375)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_data.wr_data_3;
      reg_data(8454)(11 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_addr;
      reg_data(8454)(27 downto 16)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).rd_addr;
      reg_data(8468)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_data.wr_data_0;
      reg_data(8472)(19 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_data.wr_data_4;
      reg_data(8469)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_data.wr_data_1;
      reg_data(8470)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_data.wr_data_2;
      reg_data(8471)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_data.wr_data_3;
      reg_data(12550)(11 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_addr;
      reg_data(12550)(27 downto 16)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).rd_addr;
      reg_data(12564)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_data.wr_data_0;
      reg_data(12568)(19 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_data.wr_data_4;
      reg_data(12565)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_data.wr_data_1;
      reg_data(12566)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_data.wr_data_2;
      reg_data(12567)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_data.wr_data_3;
      reg_data(16646)(11 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_addr;
      reg_data(16646)(27 downto 16)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).rd_addr;
      reg_data(16660)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_data.wr_data_0;
      reg_data(16664)(19 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_data.wr_data_4;
      reg_data(16661)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_data.wr_data_1;
      reg_data(16662)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_data.wr_data_2;
      reg_data(16663)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_data.wr_data_3;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.ACTIONS.RESET <= '0';
      Ctrl.ACTIONS.ENABLE <= '0';
      Ctrl.ACTIONS.DISABLE <= '0';
      Ctrl.ACTIONS.FREEZE <= '0';
      Ctrl.PL_MEM.PL_MEM(0).wr_req <= '0';
      Ctrl.PL_MEM.PL_MEM(0).wr_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(0).rd_req <= '0';
      Ctrl.PL_MEM.PL_MEM(0).rd_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(0).flush_req <= '0';
      Ctrl.PL_MEM.PL_MEM(1).wr_req <= '0';
      Ctrl.PL_MEM.PL_MEM(1).wr_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(1).rd_req <= '0';
      Ctrl.PL_MEM.PL_MEM(1).rd_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(1).flush_req <= '0';
      Ctrl.PL_MEM.PL_MEM(2).wr_req <= '0';
      Ctrl.PL_MEM.PL_MEM(2).wr_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(2).rd_req <= '0';
      Ctrl.PL_MEM.PL_MEM(2).rd_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(2).flush_req <= '0';
      Ctrl.PL_MEM.PL_MEM(3).wr_req <= '0';
      Ctrl.PL_MEM.PL_MEM(3).wr_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(3).rd_req <= '0';
      Ctrl.PL_MEM.PL_MEM(3).rd_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(3).flush_req <= '0';
      Ctrl.PL_MEM.PL_MEM(4).wr_req <= '0';
      Ctrl.PL_MEM.PL_MEM(4).wr_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(4).rd_req <= '0';
      Ctrl.PL_MEM.PL_MEM(4).rd_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(4).flush_req <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(14 downto 0))) is
        when 0 => --0x0
          Ctrl.ACTIONS.RESET               <=  localWrData( 0);               
          Ctrl.ACTIONS.ENABLE              <=  localWrData( 1);               
          Ctrl.ACTIONS.DISABLE             <=  localWrData( 2);               
          Ctrl.ACTIONS.FREEZE              <=  localWrData( 3);               
        when 1 => --0x1
          reg_data(1)( 3 downto  0)        <=  localWrData( 3 downto  0);      -- 
          reg_data(1)( 4)                  <=  localWrData( 4);                -- 
          reg_data(1)( 5)                  <=  localWrData( 5);                -- 
          reg_data(1)( 6)                  <=  localWrData( 6);                -- 
        when 260 => --0x104
          Ctrl.PL_MEM.PL_MEM(0).wr_req     <=  localWrData( 0);               
          Ctrl.PL_MEM.PL_MEM(0).wr_ack     <=  localWrData( 1);               
          Ctrl.PL_MEM.PL_MEM(0).rd_req     <=  localWrData( 2);               
          Ctrl.PL_MEM.PL_MEM(0).rd_ack     <=  localWrData( 3);               
          Ctrl.PL_MEM.PL_MEM(0).flush_req  <=  localWrData( 4);               
        when 278 => --0x116
          reg_data(278)(31 downto  0)      <=  localWrData(31 downto  0);      -- Write Data 2
        when 4358 => --0x1106
          reg_data(4358)(11 downto  0)     <=  localWrData(11 downto  0);      -- wr_Address
          reg_data(4358)(27 downto 16)     <=  localWrData(27 downto 16);      -- rd_Address
        when 279 => --0x117
          reg_data(279)(31 downto  0)      <=  localWrData(31 downto  0);      -- Write Data 3
        when 16660 => --0x4114
          reg_data(16660)(31 downto  0)    <=  localWrData(31 downto  0);      -- Write Data 0
        when 280 => --0x118
          reg_data(280)(19 downto  0)      <=  localWrData(19 downto  0);      -- Write Data 4
        when 4372 => --0x1114
          reg_data(4372)(31 downto  0)     <=  localWrData(31 downto  0);      -- Write Data 0
        when 277 => --0x115
          reg_data(277)(31 downto  0)      <=  localWrData(31 downto  0);      -- Write Data 1
        when 4374 => --0x1116
          reg_data(4374)(31 downto  0)     <=  localWrData(31 downto  0);      -- Write Data 2
        when 4375 => --0x1117
          reg_data(4375)(31 downto  0)     <=  localWrData(31 downto  0);      -- Write Data 3
        when 4376 => --0x1118
          reg_data(4376)(19 downto  0)     <=  localWrData(19 downto  0);      -- Write Data 4
        when 8452 => --0x2104
          Ctrl.PL_MEM.PL_MEM(2).wr_req     <=  localWrData( 0);               
          Ctrl.PL_MEM.PL_MEM(2).wr_ack     <=  localWrData( 1);               
          Ctrl.PL_MEM.PL_MEM(2).rd_req     <=  localWrData( 2);               
          Ctrl.PL_MEM.PL_MEM(2).rd_ack     <=  localWrData( 3);               
          Ctrl.PL_MEM.PL_MEM(2).flush_req  <=  localWrData( 4);               
        when 12565 => --0x3115
          reg_data(12565)(31 downto  0)    <=  localWrData(31 downto  0);      -- Write Data 1
        when 8470 => --0x2116
          reg_data(8470)(31 downto  0)     <=  localWrData(31 downto  0);      -- Write Data 2
        when 4356 => --0x1104
          Ctrl.PL_MEM.PL_MEM(1).wr_req     <=  localWrData( 0);               
          Ctrl.PL_MEM.PL_MEM(1).wr_ack     <=  localWrData( 1);               
          Ctrl.PL_MEM.PL_MEM(1).rd_req     <=  localWrData( 2);               
          Ctrl.PL_MEM.PL_MEM(1).rd_ack     <=  localWrData( 3);               
          Ctrl.PL_MEM.PL_MEM(1).flush_req  <=  localWrData( 4);               
        when 262 => --0x106
          reg_data(262)(11 downto  0)      <=  localWrData(11 downto  0);      -- wr_Address
          reg_data(262)(27 downto 16)      <=  localWrData(27 downto 16);      -- rd_Address
        when 12548 => --0x3104
          Ctrl.PL_MEM.PL_MEM(3).wr_req     <=  localWrData( 0);               
          Ctrl.PL_MEM.PL_MEM(3).wr_ack     <=  localWrData( 1);               
          Ctrl.PL_MEM.PL_MEM(3).rd_req     <=  localWrData( 2);               
          Ctrl.PL_MEM.PL_MEM(3).rd_ack     <=  localWrData( 3);               
          Ctrl.PL_MEM.PL_MEM(3).flush_req  <=  localWrData( 4);               
        when 16644 => --0x4104
          Ctrl.PL_MEM.PL_MEM(4).wr_req     <=  localWrData( 0);               
          Ctrl.PL_MEM.PL_MEM(4).wr_ack     <=  localWrData( 1);               
          Ctrl.PL_MEM.PL_MEM(4).rd_req     <=  localWrData( 2);               
          Ctrl.PL_MEM.PL_MEM(4).rd_ack     <=  localWrData( 3);               
          Ctrl.PL_MEM.PL_MEM(4).flush_req  <=  localWrData( 4);               
        when 12566 => --0x3116
          reg_data(12566)(31 downto  0)    <=  localWrData(31 downto  0);      -- Write Data 2
        when 12564 => --0x3114
          reg_data(12564)(31 downto  0)    <=  localWrData(31 downto  0);      -- Write Data 0
        when 16661 => --0x4115
          reg_data(16661)(31 downto  0)    <=  localWrData(31 downto  0);      -- Write Data 1
        when 16662 => --0x4116
          reg_data(16662)(31 downto  0)    <=  localWrData(31 downto  0);      -- Write Data 2
        when 8471 => --0x2117
          reg_data(8471)(31 downto  0)     <=  localWrData(31 downto  0);      -- Write Data 3
        when 8454 => --0x2106
          reg_data(8454)(11 downto  0)     <=  localWrData(11 downto  0);      -- wr_Address
          reg_data(8454)(27 downto 16)     <=  localWrData(27 downto 16);      -- rd_Address
        when 12567 => --0x3117
          reg_data(12567)(31 downto  0)    <=  localWrData(31 downto  0);      -- Write Data 3
        when 16663 => --0x4117
          reg_data(16663)(31 downto  0)    <=  localWrData(31 downto  0);      -- Write Data 3
        when 12550 => --0x3106
          reg_data(12550)(11 downto  0)    <=  localWrData(11 downto  0);      -- wr_Address
          reg_data(12550)(27 downto 16)    <=  localWrData(27 downto 16);      -- rd_Address
        when 16646 => --0x4106
          reg_data(16646)(11 downto  0)    <=  localWrData(11 downto  0);      -- wr_Address
          reg_data(16646)(27 downto 16)    <=  localWrData(27 downto 16);      -- rd_Address
        when 8472 => --0x2118
          reg_data(8472)(19 downto  0)     <=  localWrData(19 downto  0);      -- Write Data 4
        when 12568 => --0x3118
          reg_data(12568)(19 downto  0)    <=  localWrData(19 downto  0);      -- Write Data 4
        when 276 => --0x114
          reg_data(276)(31 downto  0)      <=  localWrData(31 downto  0);      -- Write Data 0
        when 16664 => --0x4118
          reg_data(16664)(19 downto  0)    <=  localWrData(19 downto  0);      -- Write Data 4
        when 8468 => --0x2114
          reg_data(8468)(31 downto  0)     <=  localWrData(31 downto  0);      -- Write Data 0
        when 4373 => --0x1115
          reg_data(4373)(31 downto  0)     <=  localWrData(31 downto  0);      -- Write Data 1
        when 8469 => --0x2115
          reg_data(8469)(31 downto  0)     <=  localWrData(31 downto  0);      -- Write Data 1

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;
