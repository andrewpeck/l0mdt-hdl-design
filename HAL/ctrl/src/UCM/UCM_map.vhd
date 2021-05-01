--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.AXIRegPkg.all;
use work.types.all;
use work.UCM_Ctrl.all;
use work.UCM_Ctrl_DEF.all;
entity UCM_interface is
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    Mon              : in  UCM_Mon_t;
    Ctrl             : out UCM_Ctrl_t
    );
end entity UCM_interface;
architecture behavioral of UCM_interface is
  signal localAddress       : slv_32_t;
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;


  signal reg_data :  slv32_array_t(integer range 0 to 16658);
  constant Default_reg_data : slv32_array_t(integer range 0 to 16658) := (others => x"00000000");
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
          localRdData( 3 downto  0)  <=  reg_data(1)( 3 downto  0);                     -- 
          localRdData( 4)            <=  reg_data(1)( 4);                               -- 
          localRdData( 5)            <=  reg_data(1)( 5);                               -- 
        when 258 => --0x102
          localRdData( 9 downto  0)  <=  Mon.SECTOR_PHI.rd_data;                        -- Read Data
          localRdData(25 downto 16)  <=  reg_data(258)(25 downto 16);                   -- Write Data
        when 16658 => --0x4112
          localRdData(15 downto  0)  <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(16658)(31 downto 16);                 -- Write Data
        when 8453 => --0x2105
          localRdData( 7 downto  0)  <=  reg_data(8453)( 7 downto  0);                  -- Write Address
          localRdData(13)            <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(8453)(23 downto 16);                  -- Read Address
        when 261 => --0x105
          localRdData( 7 downto  0)  <=  reg_data(261)( 7 downto  0);                   -- Write Address
          localRdData(13)            <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(261)(23 downto 16);                   -- Read Address
        when 262 => --0x106
          localRdData(15 downto  0)  <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(262)(31 downto 16);                   -- Write Data
        when 4369 => --0x1111
          localRdData( 7 downto  0)  <=  reg_data(4369)( 7 downto  0);                  -- Write Address
          localRdData(13)            <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(4369)(23 downto 16);                  -- Read Address
        when 8466 => --0x2112
          localRdData(15 downto  0)  <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(8466)(31 downto 16);                  -- Write Data
        when 16657 => --0x4111
          localRdData( 7 downto  0)  <=  reg_data(16657)( 7 downto  0);                 -- Write Address
          localRdData(13)            <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(16657)(23 downto 16);                 -- Read Address
        when 8465 => --0x2111
          localRdData( 7 downto  0)  <=  reg_data(8465)( 7 downto  0);                  -- Write Address
          localRdData(13)            <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(8465)(23 downto 16);                  -- Read Address
        when 4370 => --0x1112
          localRdData(15 downto  0)  <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(4370)(31 downto 16);                  -- Write Data
        when 4358 => --0x1106
          localRdData(15 downto  0)  <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(4358)(31 downto 16);                  -- Write Data
        when 16 => --0x10
          localRdData( 7 downto  0)  <=  Mon.STATUS.ENABLED;                            -- 
          localRdData(15 downto  8)  <=  Mon.STATUS.READY;                              -- 
          localRdData(23 downto 16)  <=  Mon.STATUS.ERROR;                              -- 
        when 273 => --0x111
          localRdData( 7 downto  0)  <=  reg_data(273)( 7 downto  0);                   -- Write Address
          localRdData(13)            <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(273)(23 downto 16);                   -- Read Address
        when 274 => --0x112
          localRdData(15 downto  0)  <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(274)(31 downto 16);                   -- Write Data
        when 8454 => --0x2106
          localRdData(15 downto  0)  <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(8454)(31 downto 16);                  -- Write Data
        when 16645 => --0x4105
          localRdData( 7 downto  0)  <=  reg_data(16645)( 7 downto  0);                 -- Write Address
          localRdData(13)            <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(16645)(23 downto 16);                 -- Read Address
        when 16646 => --0x4106
          localRdData(15 downto  0)  <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(16646)(31 downto 16);                 -- Write Data
        when 4357 => --0x1105
          localRdData( 7 downto  0)  <=  reg_data(4357)( 7 downto  0);                  -- Write Address
          localRdData(13)            <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(4357)(23 downto 16);                  -- Read Address


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.CONFIGS.THREADS                       <=  reg_data(1)( 3 downto  0);         
  Ctrl.CONFIGS.INPUT_EN                      <=  reg_data(1)( 4);                   
  Ctrl.CONFIGS.OUTPUT_EN                     <=  reg_data(1)( 5);                   
  Ctrl.SECTOR_PHI.wr_data                    <=  reg_data(258)(25 downto 16);       
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_addr  <=  reg_data(261)( 7 downto  0);       
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_addr  <=  reg_data(261)(23 downto 16);       
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_data  <=  reg_data(262)(31 downto 16);       
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_addr  <=  reg_data(4357)( 7 downto  0);      
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_addr  <=  reg_data(4357)(23 downto 16);      
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_data  <=  reg_data(4358)(31 downto 16);      
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_addr  <=  reg_data(8453)( 7 downto  0);      
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_addr  <=  reg_data(8453)(23 downto 16);      
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_data  <=  reg_data(8454)(31 downto 16);      
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_addr  <=  reg_data(16645)( 7 downto  0);     
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_addr  <=  reg_data(16645)(23 downto 16);     
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_data  <=  reg_data(16646)(31 downto 16);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_addr  <=  reg_data(273)( 7 downto  0);       
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_addr  <=  reg_data(273)(23 downto 16);       
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_data  <=  reg_data(274)(31 downto 16);       
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_addr  <=  reg_data(4369)( 7 downto  0);      
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_addr  <=  reg_data(4369)(23 downto 16);      
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_data  <=  reg_data(4370)(31 downto 16);      
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_addr  <=  reg_data(8465)( 7 downto  0);      
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_addr  <=  reg_data(8465)(23 downto 16);      
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_data  <=  reg_data(8466)(31 downto 16);      
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_addr  <=  reg_data(16657)( 7 downto  0);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_addr  <=  reg_data(16657)(23 downto 16);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_data  <=  reg_data(16658)(31 downto 16);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data(1)( 3 downto  0)  <= DEFAULT_UCM_CTRL_t.CONFIGS.THREADS;
      reg_data(1)( 4)  <= DEFAULT_UCM_CTRL_t.CONFIGS.INPUT_EN;
      reg_data(1)( 5)  <= DEFAULT_UCM_CTRL_t.CONFIGS.OUTPUT_EN;
      reg_data(258)(25 downto 16)  <= DEFAULT_UCM_CTRL_t.SECTOR_PHI.wr_data;
      reg_data(261)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_addr;
      reg_data(261)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_addr;
      reg_data(262)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_data;
      reg_data(4357)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_addr;
      reg_data(4357)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_addr;
      reg_data(4358)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_data;
      reg_data(8453)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_addr;
      reg_data(8453)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_addr;
      reg_data(8454)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_data;
      reg_data(16645)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_addr;
      reg_data(16645)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_addr;
      reg_data(16646)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_data;
      reg_data(273)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_addr;
      reg_data(273)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_addr;
      reg_data(274)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_data;
      reg_data(4369)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_addr;
      reg_data(4369)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_addr;
      reg_data(4370)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_data;
      reg_data(8465)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_addr;
      reg_data(8465)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_addr;
      reg_data(8466)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_data;
      reg_data(16657)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_addr;
      reg_data(16657)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_addr;
      reg_data(16658)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_data;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.ACTIONS.RESET <= '0';
      Ctrl.ACTIONS.ENABLE <= '0';
      Ctrl.ACTIONS.DISABLE <= '0';
      Ctrl.ACTIONS.FREEZE <= '0';
      Ctrl.SECTOR_PHI.wr_req <= '0';
      Ctrl.SECTOR_PHI.rd_req <= '0';
      Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_req <= '0';
      Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_req <= '0';
      Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_req <= '0';
      Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_req <= '0';
      Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_req <= '0';
      Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_req <= '0';
      Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_req <= '0';
      Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_req <= '0';
      Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_req <= '0';
      Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_req <= '0';
      Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_req <= '0';
      Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_req <= '0';
      Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_req <= '0';
      Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_req <= '0';
      Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_req <= '0';
      Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_req <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(14 downto 0))) is
        when 0 => --0x0
          Ctrl.ACTIONS.RESET                        <=  localWrData( 0);               
          Ctrl.ACTIONS.ENABLE                       <=  localWrData( 1);               
          Ctrl.ACTIONS.DISABLE                      <=  localWrData( 2);               
          Ctrl.ACTIONS.FREEZE                       <=  localWrData( 3);               
        when 1 => --0x1
          reg_data(1)( 3 downto  0)                 <=  localWrData( 3 downto  0);      -- 
          reg_data(1)( 4)                           <=  localWrData( 4);                -- 
          reg_data(1)( 5)                           <=  localWrData( 5);                -- 
        when 258 => --0x102
          reg_data(258)(25 downto 16)               <=  localWrData(25 downto 16);      -- Write Data
        when 260 => --0x104
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_req  <=  localWrData( 0);               
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_req  <=  localWrData( 1);               
        when 261 => --0x105
          reg_data(261)( 7 downto  0)               <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(261)(23 downto 16)               <=  localWrData(23 downto 16);      -- Read Address
        when 262 => --0x106
          reg_data(262)(31 downto 16)               <=  localWrData(31 downto 16);      -- Write Data
        when 8465 => --0x2111
          reg_data(8465)( 7 downto  0)              <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(8465)(23 downto 16)              <=  localWrData(23 downto 16);      -- Read Address
        when 256 => --0x100
          Ctrl.SECTOR_PHI.wr_req                    <=  localWrData( 0);               
          Ctrl.SECTOR_PHI.rd_req                    <=  localWrData( 1);               
        when 4368 => --0x1110
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_req  <=  localWrData( 0);               
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_req  <=  localWrData( 1);               
        when 273 => --0x111
          reg_data(273)( 7 downto  0)               <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(273)(23 downto 16)               <=  localWrData(23 downto 16);      -- Read Address
        when 4370 => --0x1112
          reg_data(4370)(31 downto 16)              <=  localWrData(31 downto 16);      -- Write Data
        when 8452 => --0x2104
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_req  <=  localWrData( 0);               
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_req  <=  localWrData( 1);               
        when 16645 => --0x4105
          reg_data(16645)( 7 downto  0)             <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(16645)(23 downto 16)             <=  localWrData(23 downto 16);      -- Read Address
        when 4356 => --0x1104
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_req  <=  localWrData( 0);               
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_req  <=  localWrData( 1);               
        when 8453 => --0x2105
          reg_data(8453)( 7 downto  0)              <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(8453)(23 downto 16)              <=  localWrData(23 downto 16);      -- Read Address
        when 4358 => --0x1106
          reg_data(4358)(31 downto 16)              <=  localWrData(31 downto 16);      -- Write Data
        when 8466 => --0x2112
          reg_data(8466)(31 downto 16)              <=  localWrData(31 downto 16);      -- Write Data
        when 16644 => --0x4104
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_req  <=  localWrData( 0);               
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_req  <=  localWrData( 1);               
        when 16656 => --0x4110
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_req  <=  localWrData( 0);               
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_req  <=  localWrData( 1);               
        when 4357 => --0x1105
          reg_data(4357)( 7 downto  0)              <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(4357)(23 downto 16)              <=  localWrData(23 downto 16);      -- Read Address
        when 8454 => --0x2106
          reg_data(8454)(31 downto 16)              <=  localWrData(31 downto 16);      -- Write Data
        when 16657 => --0x4111
          reg_data(16657)( 7 downto  0)             <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(16657)(23 downto 16)             <=  localWrData(23 downto 16);      -- Read Address
        when 16646 => --0x4106
          reg_data(16646)(31 downto 16)             <=  localWrData(31 downto 16);      -- Write Data
        when 272 => --0x110
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_req  <=  localWrData( 0);               
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_req  <=  localWrData( 1);               
        when 16658 => --0x4112
          reg_data(16658)(31 downto 16)             <=  localWrData(31 downto 16);      -- Write Data
        when 4369 => --0x1111
          reg_data(4369)( 7 downto  0)              <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(4369)(23 downto 16)              <=  localWrData(23 downto 16);      -- Read Address
        when 274 => --0x112
          reg_data(274)(31 downto 16)               <=  localWrData(31 downto 16);      -- Write Data
        when 8464 => --0x2110
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_req  <=  localWrData( 0);               
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_req  <=  localWrData( 1);               

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;