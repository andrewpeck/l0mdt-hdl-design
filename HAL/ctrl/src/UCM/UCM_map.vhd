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


  signal reg_data :  slv32_array_t(integer range 0 to 71);
  constant Default_reg_data : slv32_array_t(integer range 0 to 71) := (others => x"00000000");
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
      case to_integer(unsigned(localAddress(6 downto 0))) is

        when 1 => --0x1
          localRdData( 3 downto  0)  <=  reg_data(1)( 3 downto  0);                     -- 
          localRdData( 4)            <=  reg_data(1)( 4);                               -- 
          localRdData( 5)            <=  reg_data(1)( 5);                               -- 
        when 2 => --0x2
          localRdData( 7 downto  0)  <=  Mon.STATUS.ENABLED;                            -- 
          localRdData(15 downto  8)  <=  Mon.STATUS.READY;                              -- 
          localRdData(23 downto 16)  <=  Mon.STATUS.ERROR;                              -- 
        when 17 => --0x11
          localRdData( 9 downto  0)  <=  Mon.SECTOR_PHI.rd_data;                        -- Read Data
          localRdData(25 downto 16)  <=  reg_data(17)(25 downto 16);                    -- Write Data
        when 33 => --0x21
          localRdData( 7 downto  0)  <=  reg_data(33)( 7 downto  0);                    -- Write Address
          localRdData(13)            <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(33)(23 downto 16);                    -- Read Address
        when 34 => --0x22
          localRdData(15 downto  0)  <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(34)(31 downto 16);                    -- Write Data
        when 36 => --0x24
          localRdData( 7 downto  0)  <=  reg_data(36)( 7 downto  0);                    -- Write Address
          localRdData(13)            <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(36)(23 downto 16);                    -- Read Address
        when 37 => --0x25
          localRdData(15 downto  0)  <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(37)(31 downto 16);                    -- Write Data
        when 39 => --0x27
          localRdData( 7 downto  0)  <=  reg_data(39)( 7 downto  0);                    -- Write Address
          localRdData(13)            <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(39)(23 downto 16);                    -- Read Address
        when 40 => --0x28
          localRdData(15 downto  0)  <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(40)(31 downto 16);                    -- Write Data
        when 42 => --0x2a
          localRdData( 7 downto  0)  <=  reg_data(42)( 7 downto  0);                    -- Write Address
          localRdData(13)            <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(42)(23 downto 16);                    -- Read Address
        when 43 => --0x2b
          localRdData(15 downto  0)  <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(43)(31 downto 16);                    -- Write Data
        when 49 => --0x31
          localRdData( 7 downto  0)  <=  reg_data(49)( 7 downto  0);                    -- Write Address
          localRdData(13)            <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(49)(23 downto 16);                    -- Read Address
        when 50 => --0x32
          localRdData(15 downto  0)  <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(50)(31 downto 16);                    -- Write Data
        when 52 => --0x34
          localRdData( 7 downto  0)  <=  reg_data(52)( 7 downto  0);                    -- Write Address
          localRdData(13)            <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(52)(23 downto 16);                    -- Read Address
        when 53 => --0x35
          localRdData(15 downto  0)  <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(53)(31 downto 16);                    -- Write Data
        when 55 => --0x37
          localRdData( 7 downto  0)  <=  reg_data(55)( 7 downto  0);                    -- Write Address
          localRdData(13)            <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(55)(23 downto 16);                    -- Read Address
        when 56 => --0x38
          localRdData(15 downto  0)  <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(56)(31 downto 16);                    -- Write Data
        when 58 => --0x3a
          localRdData( 7 downto  0)  <=  reg_data(58)( 7 downto  0);                    -- Write Address
          localRdData(13)            <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(58)(23 downto 16);                    -- Read Address
        when 59 => --0x3b
          localRdData(15 downto  0)  <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(59)(31 downto 16);                    -- Write Data
        when 64 => --0x40
          localRdData( 3 downto  0)  <=  reg_data(64)( 3 downto  0);                    -- selected station
          localRdData( 7 downto  4)  <=  reg_data(64)( 7 downto  4);                    -- selected position 0x:rpc_layer 1x:center chamber
          localRdData( 8)            <=  reg_data(64)( 8);                              -- external access to mem
        when 66 => --0x42
          localRdData( 4 downto  0)  <=  reg_data(66)( 4 downto  0);                    -- Write Address
          localRdData(13)            <=  Mon.RPC_R_COMP.MEM_INTERFACE.rd_rdy;           -- Read ready
          localRdData(20 downto 16)  <=  reg_data(66)(20 downto 16);                    -- Read Address
        when 67 => --0x43
          localRdData(11 downto  0)  <=  Mon.RPC_R_COMP.MEM_INTERFACE.rd_data;          -- Read Data
          localRdData(27 downto 16)  <=  reg_data(67)(27 downto 16);                    -- Write Data
        when 68 => --0x44
          localRdData( 3 downto  0)  <=  reg_data(68)( 3 downto  0);                    -- selected station
          localRdData( 7 downto  4)  <=  reg_data(68)( 7 downto  4);                    -- selected position 0x:rpc_layer 1x:center chamber
          localRdData( 8)            <=  reg_data(68)( 8);                              -- external access to mem
        when 70 => --0x46
          localRdData( 4 downto  0)  <=  reg_data(70)( 4 downto  0);                    -- Write Address
          localRdData(13)            <=  Mon.MDT_R_COMP.MEM_INTERFACE.rd_rdy;           -- Read ready
          localRdData(20 downto 16)  <=  reg_data(70)(20 downto 16);                    -- Read Address
        when 71 => --0x47
          localRdData(13 downto  0)  <=  Mon.MDT_R_COMP.MEM_INTERFACE.rd_data;          -- Read Data
          localRdData(29 downto 16)  <=  reg_data(71)(29 downto 16);                    -- Write Data


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.CONFIGS.THREADS                       <=  reg_data(1)( 3 downto  0);      
  Ctrl.CONFIGS.INPUT_EN                      <=  reg_data(1)( 4);                
  Ctrl.CONFIGS.OUTPUT_EN                     <=  reg_data(1)( 5);                
  Ctrl.SECTOR_PHI.wr_data                    <=  reg_data(17)(25 downto 16);     
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_addr  <=  reg_data(33)( 7 downto  0);     
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_addr  <=  reg_data(33)(23 downto 16);     
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_data  <=  reg_data(34)(31 downto 16);     
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_addr  <=  reg_data(36)( 7 downto  0);     
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_addr  <=  reg_data(36)(23 downto 16);     
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_data  <=  reg_data(37)(31 downto 16);     
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_addr  <=  reg_data(39)( 7 downto  0);     
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_addr  <=  reg_data(39)(23 downto 16);     
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_data  <=  reg_data(40)(31 downto 16);     
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_addr  <=  reg_data(42)( 7 downto  0);     
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_addr  <=  reg_data(42)(23 downto 16);     
  Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_data  <=  reg_data(43)(31 downto 16);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_addr  <=  reg_data(49)( 7 downto  0);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_addr  <=  reg_data(49)(23 downto 16);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_data  <=  reg_data(50)(31 downto 16);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_addr  <=  reg_data(52)( 7 downto  0);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_addr  <=  reg_data(52)(23 downto 16);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_data  <=  reg_data(53)(31 downto 16);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_addr  <=  reg_data(55)( 7 downto  0);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_addr  <=  reg_data(55)(23 downto 16);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_data  <=  reg_data(56)(31 downto 16);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_addr  <=  reg_data(58)( 7 downto  0);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_addr  <=  reg_data(58)(23 downto 16);     
  Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_data  <=  reg_data(59)(31 downto 16);     
  Ctrl.RPC_R_COMP.ext_ctrl                   <=  reg_data(64)( 8);               
  Ctrl.RPC_R_COMP.sel_station                <=  reg_data(64)( 3 downto  0);     
  Ctrl.RPC_R_COMP.sel_layer                  <=  reg_data(64)( 7 downto  4);     
  Ctrl.RPC_R_COMP.MEM_INTERFACE.wr_addr      <=  reg_data(66)( 4 downto  0);     
  Ctrl.RPC_R_COMP.MEM_INTERFACE.rd_addr      <=  reg_data(66)(20 downto 16);     
  Ctrl.RPC_R_COMP.MEM_INTERFACE.wr_data      <=  reg_data(67)(27 downto 16);     
  Ctrl.MDT_R_COMP.ext_ctrl                   <=  reg_data(68)( 8);               
  Ctrl.MDT_R_COMP.sel_station                <=  reg_data(68)( 3 downto  0);     
  Ctrl.MDT_R_COMP.sel_layer                  <=  reg_data(68)( 7 downto  4);     
  Ctrl.MDT_R_COMP.MEM_INTERFACE.wr_addr      <=  reg_data(70)( 4 downto  0);     
  Ctrl.MDT_R_COMP.MEM_INTERFACE.rd_addr      <=  reg_data(70)(20 downto 16);     
  Ctrl.MDT_R_COMP.MEM_INTERFACE.wr_data      <=  reg_data(71)(29 downto 16);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data(1)( 3 downto  0)  <= DEFAULT_UCM_CTRL_t.CONFIGS.THREADS;
      reg_data(1)( 4)  <= DEFAULT_UCM_CTRL_t.CONFIGS.INPUT_EN;
      reg_data(1)( 5)  <= DEFAULT_UCM_CTRL_t.CONFIGS.OUTPUT_EN;
      reg_data(17)(25 downto 16)  <= DEFAULT_UCM_CTRL_t.SECTOR_PHI.wr_data;
      reg_data(33)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_addr;
      reg_data(33)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_addr;
      reg_data(34)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_data;
      reg_data(36)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_addr;
      reg_data(36)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_addr;
      reg_data(37)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_data;
      reg_data(39)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_addr;
      reg_data(39)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_addr;
      reg_data(40)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_data;
      reg_data(42)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_addr;
      reg_data(42)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_addr;
      reg_data(43)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_data;
      reg_data(49)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_addr;
      reg_data(49)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_addr;
      reg_data(50)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_data;
      reg_data(52)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_addr;
      reg_data(52)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_addr;
      reg_data(53)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_data;
      reg_data(55)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_addr;
      reg_data(55)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_addr;
      reg_data(56)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_data;
      reg_data(58)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_addr;
      reg_data(58)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_addr;
      reg_data(59)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_data;
      reg_data(64)( 8)  <= DEFAULT_UCM_CTRL_t.RPC_R_COMP.ext_ctrl;
      reg_data(64)( 3 downto  0)  <= DEFAULT_UCM_CTRL_t.RPC_R_COMP.sel_station;
      reg_data(64)( 7 downto  4)  <= DEFAULT_UCM_CTRL_t.RPC_R_COMP.sel_layer;
      reg_data(66)( 4 downto  0)  <= DEFAULT_UCM_CTRL_t.RPC_R_COMP.MEM_INTERFACE.wr_addr;
      reg_data(66)(20 downto 16)  <= DEFAULT_UCM_CTRL_t.RPC_R_COMP.MEM_INTERFACE.rd_addr;
      reg_data(67)(27 downto 16)  <= DEFAULT_UCM_CTRL_t.RPC_R_COMP.MEM_INTERFACE.wr_data;
      reg_data(68)( 8)  <= DEFAULT_UCM_CTRL_t.MDT_R_COMP.ext_ctrl;
      reg_data(68)( 3 downto  0)  <= DEFAULT_UCM_CTRL_t.MDT_R_COMP.sel_station;
      reg_data(68)( 7 downto  4)  <= DEFAULT_UCM_CTRL_t.MDT_R_COMP.sel_layer;
      reg_data(70)( 4 downto  0)  <= DEFAULT_UCM_CTRL_t.MDT_R_COMP.MEM_INTERFACE.wr_addr;
      reg_data(70)(20 downto 16)  <= DEFAULT_UCM_CTRL_t.MDT_R_COMP.MEM_INTERFACE.rd_addr;
      reg_data(71)(29 downto 16)  <= DEFAULT_UCM_CTRL_t.MDT_R_COMP.MEM_INTERFACE.wr_data;

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
      Ctrl.RPC_R_COMP.MEM_INTERFACE.wr_req <= '0';
      Ctrl.RPC_R_COMP.MEM_INTERFACE.rd_req <= '0';
      Ctrl.MDT_R_COMP.MEM_INTERFACE.wr_req <= '0';
      Ctrl.MDT_R_COMP.MEM_INTERFACE.rd_req <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(6 downto 0))) is
        when 0 => --0x0
          Ctrl.ACTIONS.RESET                        <=  localWrData( 0);               
          Ctrl.ACTIONS.ENABLE                       <=  localWrData( 1);               
          Ctrl.ACTIONS.DISABLE                      <=  localWrData( 2);               
          Ctrl.ACTIONS.FREEZE                       <=  localWrData( 3);               
        when 1 => --0x1
          reg_data(1)( 3 downto  0)                 <=  localWrData( 3 downto  0);      -- 
          reg_data(1)( 4)                           <=  localWrData( 4);                -- 
          reg_data(1)( 5)                           <=  localWrData( 5);                -- 
        when 16 => --0x10
          Ctrl.SECTOR_PHI.wr_req                    <=  localWrData( 0);               
          Ctrl.SECTOR_PHI.rd_req                    <=  localWrData( 1);               
        when 17 => --0x11
          reg_data(17)(25 downto 16)                <=  localWrData(25 downto 16);      -- Write Data
        when 32 => --0x20
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_req  <=  localWrData( 0);               
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_req  <=  localWrData( 1);               
        when 33 => --0x21
          reg_data(33)( 7 downto  0)                <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(33)(23 downto 16)                <=  localWrData(23 downto 16);      -- Read Address
        when 34 => --0x22
          reg_data(34)(31 downto 16)                <=  localWrData(31 downto 16);      -- Write Data
        when 35 => --0x23
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_req  <=  localWrData( 0);               
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_req  <=  localWrData( 1);               
        when 36 => --0x24
          reg_data(36)( 7 downto  0)                <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(36)(23 downto 16)                <=  localWrData(23 downto 16);      -- Read Address
        when 37 => --0x25
          reg_data(37)(31 downto 16)                <=  localWrData(31 downto 16);      -- Write Data
        when 38 => --0x26
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_req  <=  localWrData( 0);               
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_req  <=  localWrData( 1);               
        when 39 => --0x27
          reg_data(39)( 7 downto  0)                <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(39)(23 downto 16)                <=  localWrData(23 downto 16);      -- Read Address
        when 40 => --0x28
          reg_data(40)(31 downto 16)                <=  localWrData(31 downto 16);      -- Write Data
        when 41 => --0x29
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_req  <=  localWrData( 0);               
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_req  <=  localWrData( 1);               
        when 42 => --0x2a
          reg_data(42)( 7 downto  0)                <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(42)(23 downto 16)                <=  localWrData(23 downto 16);      -- Read Address
        when 43 => --0x2b
          reg_data(43)(31 downto 16)                <=  localWrData(31 downto 16);      -- Write Data
        when 48 => --0x30
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_req  <=  localWrData( 0);               
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_req  <=  localWrData( 1);               
        when 49 => --0x31
          reg_data(49)( 7 downto  0)                <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(49)(23 downto 16)                <=  localWrData(23 downto 16);      -- Read Address
        when 50 => --0x32
          reg_data(50)(31 downto 16)                <=  localWrData(31 downto 16);      -- Write Data
        when 51 => --0x33
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_req  <=  localWrData( 0);               
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_req  <=  localWrData( 1);               
        when 52 => --0x34
          reg_data(52)( 7 downto  0)                <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(52)(23 downto 16)                <=  localWrData(23 downto 16);      -- Read Address
        when 53 => --0x35
          reg_data(53)(31 downto 16)                <=  localWrData(31 downto 16);      -- Write Data
        when 54 => --0x36
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_req  <=  localWrData( 0);               
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_req  <=  localWrData( 1);               
        when 55 => --0x37
          reg_data(55)( 7 downto  0)                <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(55)(23 downto 16)                <=  localWrData(23 downto 16);      -- Read Address
        when 56 => --0x38
          reg_data(56)(31 downto 16)                <=  localWrData(31 downto 16);      -- Write Data
        when 57 => --0x39
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_req  <=  localWrData( 0);               
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_req  <=  localWrData( 1);               
        when 58 => --0x3a
          reg_data(58)( 7 downto  0)                <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(58)(23 downto 16)                <=  localWrData(23 downto 16);      -- Read Address
        when 59 => --0x3b
          reg_data(59)(31 downto 16)                <=  localWrData(31 downto 16);      -- Write Data
        when 64 => --0x40
          reg_data(64)( 3 downto  0)                <=  localWrData( 3 downto  0);      -- selected station
          reg_data(64)( 7 downto  4)                <=  localWrData( 7 downto  4);      -- selected position 0x:rpc_layer 1x:center chamber
          reg_data(64)( 8)                          <=  localWrData( 8);                -- external access to mem
        when 65 => --0x41
          Ctrl.RPC_R_COMP.MEM_INTERFACE.wr_req      <=  localWrData( 0);               
          Ctrl.RPC_R_COMP.MEM_INTERFACE.rd_req      <=  localWrData( 1);               
        when 66 => --0x42
          reg_data(66)( 4 downto  0)                <=  localWrData( 4 downto  0);      -- Write Address
          reg_data(66)(20 downto 16)                <=  localWrData(20 downto 16);      -- Read Address
        when 67 => --0x43
          reg_data(67)(27 downto 16)                <=  localWrData(27 downto 16);      -- Write Data
        when 68 => --0x44
          reg_data(68)( 3 downto  0)                <=  localWrData( 3 downto  0);      -- selected station
          reg_data(68)( 7 downto  4)                <=  localWrData( 7 downto  4);      -- selected position 0x:rpc_layer 1x:center chamber
          reg_data(68)( 8)                          <=  localWrData( 8);                -- external access to mem
        when 69 => --0x45
          Ctrl.MDT_R_COMP.MEM_INTERFACE.wr_req      <=  localWrData( 0);               
          Ctrl.MDT_R_COMP.MEM_INTERFACE.rd_req      <=  localWrData( 1);               
        when 70 => --0x46
          reg_data(70)( 4 downto  0)                <=  localWrData( 4 downto  0);      -- Write Address
          reg_data(70)(20 downto 16)                <=  localWrData(20 downto 16);      -- Read Address
        when 71 => --0x47
          reg_data(71)(29 downto 16)                <=  localWrData(29 downto 16);      -- Write Data

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;
