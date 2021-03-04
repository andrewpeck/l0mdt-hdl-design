--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.AXIRegPkg.all;
use work.types.all;
use work.MPL_Ctrl.all;
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


  signal reg_data :  slv32_array_t(integer range 0 to 33048);
  constant Default_reg_data : slv32_array_t(integer range 0 to 33048) := (others => x"00000000");
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
      case to_integer(unsigned(localAddress(15 downto 0))) is

        when 1 => --0x1
          localRdData( 3 downto  0)  <=  reg_data( 1)( 3 downto  0);          --
          localRdData( 4)            <=  reg_data( 1)( 4);                    --
          localRdData( 5)            <=  reg_data( 1)( 5);                    --
          localRdData( 6)            <=  reg_data( 1)( 6);                    --
        when 4372 => --0x1114
          localRdData(31 downto  0)  <=  reg_data(4372)(31 downto  0);        --Write Data 0
        when 16661 => --0x4115
          localRdData(25 downto  0)  <=  reg_data(16661)(25 downto  0);       --Write Data 1
        when 4374 => --0x1116
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(1).rd_data_0;      --Read Data 0
        when 4358 => --0x1106
          localRdData( 9 downto  0)  <=  reg_data(4358)( 9 downto  0);        --Address
          localRdData(12)            <=  reg_data(4358)(12);                  --Enable
          localRdData(13)            <=  Mon.PL_MEM.PL_MEM(1).rd_rdy;         --Read ready
        when 16 => --0x10
          localRdData( 0)            <=  Mon.STATUS.ENABLED;                  --
          localRdData( 1)            <=  Mon.STATUS.READY;                    --
          localRdData( 2)            <=  Mon.STATUS.ERROR;                    --
        when 4376 => --0x1118
          localRdData(25 downto  0)  <=  Mon.PL_MEM.PL_MEM(1).rd_data_1;      --Read Data 1
        when 8468 => --0x2114
          localRdData(31 downto  0)  <=  reg_data(8468)(31 downto  0);        --Write Data 0
        when 8469 => --0x2115
          localRdData(25 downto  0)  <=  reg_data(8469)(25 downto  0);        --Write Data 1
        when 8470 => --0x2116
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(2).rd_data_0;      --Read Data 0
        when 16664 => --0x4118
          localRdData(25 downto  0)  <=  Mon.PL_MEM.PL_MEM(3).rd_data_1;      --Read Data 1
        when 4373 => --0x1115
          localRdData(25 downto  0)  <=  reg_data(4373)(25 downto  0);        --Write Data 1
        when 33044 => --0x8114
          localRdData(31 downto  0)  <=  reg_data(33044)(31 downto  0);       --Write Data 0
        when 16662 => --0x4116
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(3).rd_data_0;      --Read Data 0
        when 262 => --0x106
          localRdData( 9 downto  0)  <=  reg_data(262)( 9 downto  0);         --Address
          localRdData(12)            <=  reg_data(262)(12);                   --Enable
          localRdData(13)            <=  Mon.PL_MEM.PL_MEM(0).rd_rdy;         --Read ready
        when 278 => --0x116
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(0).rd_data_0;      --Read Data 0
        when 33045 => --0x8115
          localRdData(25 downto  0)  <=  reg_data(33045)(25 downto  0);       --Write Data 1
        when 8454 => --0x2106
          localRdData( 9 downto  0)  <=  reg_data(8454)( 9 downto  0);        --Address
          localRdData(12)            <=  reg_data(8454)(12);                  --Enable
          localRdData(13)            <=  Mon.PL_MEM.PL_MEM(2).rd_rdy;         --Read ready
        when 33046 => --0x8116
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(4).rd_data_0;      --Read Data 0
        when 16646 => --0x4106
          localRdData( 9 downto  0)  <=  reg_data(16646)( 9 downto  0);       --Address
          localRdData(12)            <=  reg_data(16646)(12);                 --Enable
          localRdData(13)            <=  Mon.PL_MEM.PL_MEM(3).rd_rdy;         --Read ready
        when 280 => --0x118
          localRdData(25 downto  0)  <=  Mon.PL_MEM.PL_MEM(0).rd_data_1;      --Read Data 1
        when 8472 => --0x2118
          localRdData(25 downto  0)  <=  Mon.PL_MEM.PL_MEM(2).rd_data_1;      --Read Data 1
        when 276 => --0x114
          localRdData(31 downto  0)  <=  reg_data(276)(31 downto  0);         --Write Data 0
        when 33030 => --0x8106
          localRdData( 9 downto  0)  <=  reg_data(33030)( 9 downto  0);       --Address
          localRdData(12)            <=  reg_data(33030)(12);                 --Enable
          localRdData(13)            <=  Mon.PL_MEM.PL_MEM(4).rd_rdy;         --Read ready
        when 33048 => --0x8118
          localRdData(25 downto  0)  <=  Mon.PL_MEM.PL_MEM(4).rd_data_1;      --Read Data 1
        when 16660 => --0x4114
          localRdData(31 downto  0)  <=  reg_data(16660)(31 downto  0);       --Write Data 0
        when 277 => --0x115
          localRdData(25 downto  0)  <=  reg_data(277)(25 downto  0);         --Write Data 1


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.CONFIGS.THREADS             <=  reg_data( 1)( 3 downto  0);        
  Ctrl.CONFIGS.INPUT_EN            <=  reg_data( 1)( 4);                  
  Ctrl.CONFIGS.OUTPUT_EN           <=  reg_data( 1)( 5);                  
  Ctrl.CONFIGS.FLUSH_MEM_RESET     <=  reg_data( 1)( 6);                  
  Ctrl.PL_MEM.PL_MEM(0).wr_addr    <=  reg_data(262)( 9 downto  0);       
  Ctrl.PL_MEM.PL_MEM(0).en         <=  reg_data(262)(12);                 
  Ctrl.PL_MEM.PL_MEM(0).wr_data_1  <=  reg_data(277)(25 downto  0);       
  Ctrl.PL_MEM.PL_MEM(0).wr_data_0  <=  reg_data(276)(31 downto  0);       
  Ctrl.PL_MEM.PL_MEM(1).wr_addr    <=  reg_data(4358)( 9 downto  0);      
  Ctrl.PL_MEM.PL_MEM(1).en         <=  reg_data(4358)(12);                
  Ctrl.PL_MEM.PL_MEM(1).wr_data_1  <=  reg_data(4373)(25 downto  0);      
  Ctrl.PL_MEM.PL_MEM(1).wr_data_0  <=  reg_data(4372)(31 downto  0);      
  Ctrl.PL_MEM.PL_MEM(2).wr_addr    <=  reg_data(8454)( 9 downto  0);      
  Ctrl.PL_MEM.PL_MEM(2).en         <=  reg_data(8454)(12);                
  Ctrl.PL_MEM.PL_MEM(2).wr_data_1  <=  reg_data(8469)(25 downto  0);      
  Ctrl.PL_MEM.PL_MEM(2).wr_data_0  <=  reg_data(8468)(31 downto  0);      
  Ctrl.PL_MEM.PL_MEM(3).wr_addr    <=  reg_data(16646)( 9 downto  0);     
  Ctrl.PL_MEM.PL_MEM(3).en         <=  reg_data(16646)(12);               
  Ctrl.PL_MEM.PL_MEM(3).wr_data_1  <=  reg_data(16661)(25 downto  0);     
  Ctrl.PL_MEM.PL_MEM(3).wr_data_0  <=  reg_data(16660)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).wr_addr    <=  reg_data(33030)( 9 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).en         <=  reg_data(33030)(12);               
  Ctrl.PL_MEM.PL_MEM(4).wr_data_1  <=  reg_data(33045)(25 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).wr_data_0  <=  reg_data(33044)(31 downto  0);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 1)( 3 downto  0)  <= DEFAULT_MPL_CTRL_t.CONFIGS.THREADS;
      reg_data( 1)( 4)  <= DEFAULT_MPL_CTRL_t.CONFIGS.INPUT_EN;
      reg_data( 1)( 5)  <= DEFAULT_MPL_CTRL_t.CONFIGS.OUTPUT_EN;
      reg_data( 1)( 6)  <= DEFAULT_MPL_CTRL_t.CONFIGS.FLUSH_MEM_RESET;
      reg_data(262)( 9 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_addr;
      reg_data(262)(12)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).en;
      reg_data(277)(25 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_data_1;
      reg_data(276)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_data_0;
      reg_data(4358)( 9 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_addr;
      reg_data(4358)(12)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).en;
      reg_data(4373)(25 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_data_1;
      reg_data(4372)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_data_0;
      reg_data(8454)( 9 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_addr;
      reg_data(8454)(12)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).en;
      reg_data(8469)(25 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_data_1;
      reg_data(8468)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_data_0;
      reg_data(16646)( 9 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_addr;
      reg_data(16646)(12)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).en;
      reg_data(16661)(25 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_data_1;
      reg_data(16660)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_data_0;
      reg_data(33030)( 9 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_addr;
      reg_data(33030)(12)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).en;
      reg_data(33045)(25 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_data_1;
      reg_data(33044)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_data_0;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.ACTIONS.RESET <= '0';
      Ctrl.ACTIONS.ENABLE <= '0';
      Ctrl.ACTIONS.DISABLE <= '0';
      Ctrl.ACTIONS.FREEZE <= '0';
      Ctrl.PL_MEM.PL_MEM(0).wr_en <= '0';
      Ctrl.PL_MEM.PL_MEM(0).rd_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(1).wr_en <= '0';
      Ctrl.PL_MEM.PL_MEM(1).rd_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(2).wr_en <= '0';
      Ctrl.PL_MEM.PL_MEM(2).rd_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(3).wr_en <= '0';
      Ctrl.PL_MEM.PL_MEM(3).rd_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(4).wr_en <= '0';
      Ctrl.PL_MEM.PL_MEM(4).rd_ack <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(15 downto 0))) is
        when 0 => --0x0
          Ctrl.ACTIONS.RESET             <=  localWrData( 0);               
          Ctrl.ACTIONS.ENABLE            <=  localWrData( 1);               
          Ctrl.ACTIONS.DISABLE           <=  localWrData( 2);               
          Ctrl.ACTIONS.FREEZE            <=  localWrData( 3);               
        when 1 => --0x1
          reg_data( 1)( 3 downto  0)     <=  localWrData( 3 downto  0);      --
          reg_data( 1)( 4)               <=  localWrData( 4);                --
          reg_data( 1)( 5)               <=  localWrData( 5);                --
          reg_data( 1)( 6)               <=  localWrData( 6);                --
        when 260 => --0x104
          Ctrl.PL_MEM.PL_MEM(0).wr_en    <=  localWrData( 0);               
        when 261 => --0x105
          Ctrl.PL_MEM.PL_MEM(0).rd_ack   <=  localWrData( 1);               
        when 4358 => --0x1106
          reg_data(4358)( 9 downto  0)   <=  localWrData( 9 downto  0);      --Address
          reg_data(4358)(12)             <=  localWrData(12);                --Enable
        when 4372 => --0x1114
          reg_data(4372)(31 downto  0)   <=  localWrData(31 downto  0);      --Write Data 0
        when 16661 => --0x4115
          reg_data(16661)(25 downto  0)  <=  localWrData(25 downto  0);      --Write Data 1
        when 8452 => --0x2104
          Ctrl.PL_MEM.PL_MEM(2).wr_en    <=  localWrData( 0);               
        when 33044 => --0x8114
          reg_data(33044)(31 downto  0)  <=  localWrData(31 downto  0);      --Write Data 0
        when 16645 => --0x4105
          Ctrl.PL_MEM.PL_MEM(3).rd_ack   <=  localWrData( 1);               
        when 4356 => --0x1104
          Ctrl.PL_MEM.PL_MEM(1).wr_en    <=  localWrData( 0);               
        when 8453 => --0x2105
          Ctrl.PL_MEM.PL_MEM(2).rd_ack   <=  localWrData( 1);               
        when 262 => --0x106
          reg_data(262)( 9 downto  0)    <=  localWrData( 9 downto  0);      --Address
          reg_data(262)(12)              <=  localWrData(12);                --Enable
        when 16644 => --0x4104
          Ctrl.PL_MEM.PL_MEM(3).wr_en    <=  localWrData( 0);               
        when 33045 => --0x8115
          reg_data(33045)(25 downto  0)  <=  localWrData(25 downto  0);      --Write Data 1
        when 4357 => --0x1105
          Ctrl.PL_MEM.PL_MEM(1).rd_ack   <=  localWrData( 1);               
        when 33028 => --0x8104
          Ctrl.PL_MEM.PL_MEM(4).wr_en    <=  localWrData( 0);               
        when 8454 => --0x2106
          reg_data(8454)( 9 downto  0)   <=  localWrData( 9 downto  0);      --Address
          reg_data(8454)(12)             <=  localWrData(12);                --Enable
        when 33029 => --0x8105
          Ctrl.PL_MEM.PL_MEM(4).rd_ack   <=  localWrData( 1);               
        when 16646 => --0x4106
          reg_data(16646)( 9 downto  0)  <=  localWrData( 9 downto  0);      --Address
          reg_data(16646)(12)            <=  localWrData(12);                --Enable
        when 16660 => --0x4114
          reg_data(16660)(31 downto  0)  <=  localWrData(31 downto  0);      --Write Data 0
        when 277 => --0x115
          reg_data(277)(25 downto  0)    <=  localWrData(25 downto  0);      --Write Data 1
        when 33030 => --0x8106
          reg_data(33030)( 9 downto  0)  <=  localWrData( 9 downto  0);      --Address
          reg_data(33030)(12)            <=  localWrData(12);                --Enable
        when 8468 => --0x2114
          reg_data(8468)(31 downto  0)   <=  localWrData(31 downto  0);      --Write Data 0
        when 276 => --0x114
          reg_data(276)(31 downto  0)    <=  localWrData(31 downto  0);      --Write Data 0
        when 4373 => --0x1115
          reg_data(4373)(25 downto  0)   <=  localWrData(25 downto  0);      --Write Data 1
        when 8469 => --0x2115
          reg_data(8469)(25 downto  0)   <=  localWrData(25 downto  0);      --Write Data 1

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;