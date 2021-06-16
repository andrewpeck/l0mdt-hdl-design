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


  signal reg_data :  slv32_array_t(integer range 0 to 87);
  constant Default_reg_data : slv32_array_t(integer range 0 to 87) := (others => x"00000000");
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

        when 17 => --0x11
          localRdData( 3 downto  0)  <=  reg_data(17)( 3 downto  0);                          -- 
          localRdData( 4)            <=  reg_data(17)( 4);                                    -- 
          localRdData( 5)            <=  reg_data(17)( 5);                                    -- 
        when 18 => --0x12
          localRdData( 7 downto  0)  <=  Mon.SUPER.STATUS.ENABLED;                            -- 
          localRdData(15 downto  8)  <=  Mon.SUPER.STATUS.READY;                              -- 
          localRdData(23 downto 16)  <=  Mon.SUPER.STATUS.ERROR;                              -- 
        when 33 => --0x21
          localRdData( 9 downto  0)  <=  Mon.SUPER.SECTOR_PHI.rd_data;                        -- Read Data
          localRdData(25 downto 16)  <=  reg_data(33)(25 downto 16);                          -- Write Data
        when 49 => --0x31
          localRdData( 7 downto  0)  <=  reg_data(49)( 7 downto  0);                          -- Write Address
          localRdData(13)            <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(49)(23 downto 16);                          -- Read Address
        when 50 => --0x32
          localRdData(15 downto  0)  <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(50)(31 downto 16);                          -- Write Data
        when 52 => --0x34
          localRdData( 7 downto  0)  <=  reg_data(52)( 7 downto  0);                          -- Write Address
          localRdData(13)            <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(52)(23 downto 16);                          -- Read Address
        when 53 => --0x35
          localRdData(15 downto  0)  <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(53)(31 downto 16);                          -- Write Data
        when 55 => --0x37
          localRdData( 7 downto  0)  <=  reg_data(55)( 7 downto  0);                          -- Write Address
          localRdData(13)            <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(55)(23 downto 16);                          -- Read Address
        when 56 => --0x38
          localRdData(15 downto  0)  <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(56)(31 downto 16);                          -- Write Data
        when 58 => --0x3a
          localRdData( 7 downto  0)  <=  reg_data(58)( 7 downto  0);                          -- Write Address
          localRdData(13)            <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(58)(23 downto 16);                          -- Read Address
        when 59 => --0x3b
          localRdData(15 downto  0)  <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(59)(31 downto 16);                          -- Write Data
        when 65 => --0x41
          localRdData( 7 downto  0)  <=  reg_data(65)( 7 downto  0);                          -- Write Address
          localRdData(13)            <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(65)(23 downto 16);                          -- Read Address
        when 66 => --0x42
          localRdData(15 downto  0)  <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(66)(31 downto 16);                          -- Write Data
        when 68 => --0x44
          localRdData( 7 downto  0)  <=  reg_data(68)( 7 downto  0);                          -- Write Address
          localRdData(13)            <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(68)(23 downto 16);                          -- Read Address
        when 69 => --0x45
          localRdData(15 downto  0)  <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(69)(31 downto 16);                          -- Write Data
        when 71 => --0x47
          localRdData( 7 downto  0)  <=  reg_data(71)( 7 downto  0);                          -- Write Address
          localRdData(13)            <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(71)(23 downto 16);                          -- Read Address
        when 72 => --0x48
          localRdData(15 downto  0)  <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(72)(31 downto 16);                          -- Write Data
        when 74 => --0x4a
          localRdData( 7 downto  0)  <=  reg_data(74)( 7 downto  0);                          -- Write Address
          localRdData(13)            <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_rdy;       -- Read ready
          localRdData(23 downto 16)  <=  reg_data(74)(23 downto 16);                          -- Read Address
        when 75 => --0x4b
          localRdData(15 downto  0)  <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_data;      -- Read Data
          localRdData(31 downto 16)  <=  reg_data(75)(31 downto 16);                          -- Write Data
        when 80 => --0x50
          localRdData( 3 downto  0)  <=  reg_data(80)( 3 downto  0);                          -- selected thread
          localRdData( 7 downto  4)  <=  reg_data(80)( 7 downto  4);                          -- selected station
          localRdData(11 downto  8)  <=  reg_data(80)(11 downto  8);                          -- selected position 0x:rpc_layer 1x:center chamber
          localRdData(12)            <=  reg_data(80)(12);                                    -- external access to mem
        when 82 => --0x52
          localRdData( 4 downto  0)  <=  reg_data(82)( 4 downto  0);                          -- Write Address
          localRdData(13)            <=  Mon.R_PHI_COMP.RPC.MEM_INTERFACE.rd_rdy;             -- Read ready
          localRdData(20 downto 16)  <=  reg_data(82)(20 downto 16);                          -- Read Address
        when 83 => --0x53
          localRdData(11 downto  0)  <=  Mon.R_PHI_COMP.RPC.MEM_INTERFACE.rd_data;            -- Read Data
          localRdData(27 downto 16)  <=  reg_data(83)(27 downto 16);                          -- Write Data
        when 84 => --0x54
          localRdData( 3 downto  0)  <=  reg_data(84)( 3 downto  0);                          -- selected thread
          localRdData( 7 downto  4)  <=  reg_data(84)( 7 downto  4);                          -- selected station
          localRdData(11 downto  8)  <=  reg_data(84)(11 downto  8);                          -- selected position 0x:rpc_layer 1x:center chamber
          localRdData(12)            <=  reg_data(84)(12);                                    -- external access to mem
        when 86 => --0x56
          localRdData( 4 downto  0)  <=  reg_data(86)( 4 downto  0);                          -- Write Address
          localRdData(13)            <=  Mon.R_PHI_COMP.MDT.MEM_INTERFACE.rd_rdy;             -- Read ready
          localRdData(20 downto 16)  <=  reg_data(86)(20 downto 16);                          -- Read Address
        when 87 => --0x57
          localRdData(13 downto  0)  <=  Mon.R_PHI_COMP.MDT.MEM_INTERFACE.rd_data;            -- Read Data
          localRdData(29 downto 16)  <=  reg_data(87)(29 downto 16);                          -- Write Data


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.SUPER.CONFIGS.THREADS                       <=  reg_data(17)( 3 downto  0);     
  Ctrl.SUPER.CONFIGS.INPUT_EN                      <=  reg_data(17)( 4);               
  Ctrl.SUPER.CONFIGS.OUTPUT_EN                     <=  reg_data(17)( 5);               
  Ctrl.SUPER.SECTOR_PHI.wr_data                    <=  reg_data(33)(25 downto 16);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_addr  <=  reg_data(49)( 7 downto  0);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_addr  <=  reg_data(49)(23 downto 16);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_data  <=  reg_data(50)(31 downto 16);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_addr  <=  reg_data(52)( 7 downto  0);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_addr  <=  reg_data(52)(23 downto 16);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_data  <=  reg_data(53)(31 downto 16);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_addr  <=  reg_data(55)( 7 downto  0);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_addr  <=  reg_data(55)(23 downto 16);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_data  <=  reg_data(56)(31 downto 16);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_addr  <=  reg_data(58)( 7 downto  0);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_addr  <=  reg_data(58)(23 downto 16);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_data  <=  reg_data(59)(31 downto 16);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_addr  <=  reg_data(65)( 7 downto  0);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_addr  <=  reg_data(65)(23 downto 16);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_data  <=  reg_data(66)(31 downto 16);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_addr  <=  reg_data(68)( 7 downto  0);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_addr  <=  reg_data(68)(23 downto 16);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_data  <=  reg_data(69)(31 downto 16);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_addr  <=  reg_data(71)( 7 downto  0);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_addr  <=  reg_data(71)(23 downto 16);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_data  <=  reg_data(72)(31 downto 16);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_addr  <=  reg_data(74)( 7 downto  0);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_addr  <=  reg_data(74)(23 downto 16);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_data  <=  reg_data(75)(31 downto 16);     
  Ctrl.R_PHI_COMP.RPC.ext_ctrl                     <=  reg_data(80)(12);               
  Ctrl.R_PHI_COMP.RPC.sel_thread                   <=  reg_data(80)( 3 downto  0);     
  Ctrl.R_PHI_COMP.RPC.sel_station                  <=  reg_data(80)( 7 downto  4);     
  Ctrl.R_PHI_COMP.RPC.sel_layer                    <=  reg_data(80)(11 downto  8);     
  Ctrl.R_PHI_COMP.RPC.MEM_INTERFACE.wr_addr        <=  reg_data(82)( 4 downto  0);     
  Ctrl.R_PHI_COMP.RPC.MEM_INTERFACE.rd_addr        <=  reg_data(82)(20 downto 16);     
  Ctrl.R_PHI_COMP.RPC.MEM_INTERFACE.wr_data        <=  reg_data(83)(27 downto 16);     
  Ctrl.R_PHI_COMP.MDT.ext_ctrl                     <=  reg_data(84)(12);               
  Ctrl.R_PHI_COMP.MDT.sel_thread                   <=  reg_data(84)( 3 downto  0);     
  Ctrl.R_PHI_COMP.MDT.sel_station                  <=  reg_data(84)( 7 downto  4);     
  Ctrl.R_PHI_COMP.MDT.sel_layer                    <=  reg_data(84)(11 downto  8);     
  Ctrl.R_PHI_COMP.MDT.MEM_INTERFACE.wr_addr        <=  reg_data(86)( 4 downto  0);     
  Ctrl.R_PHI_COMP.MDT.MEM_INTERFACE.rd_addr        <=  reg_data(86)(20 downto 16);     
  Ctrl.R_PHI_COMP.MDT.MEM_INTERFACE.wr_data        <=  reg_data(87)(29 downto 16);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data(17)( 3 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CONFIGS.THREADS;
      reg_data(17)( 4)  <= DEFAULT_UCM_CTRL_t.SUPER.CONFIGS.INPUT_EN;
      reg_data(17)( 5)  <= DEFAULT_UCM_CTRL_t.SUPER.CONFIGS.OUTPUT_EN;
      reg_data(33)(25 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.SECTOR_PHI.wr_data;
      reg_data(49)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_addr;
      reg_data(49)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_addr;
      reg_data(50)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_data;
      reg_data(52)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_addr;
      reg_data(52)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_addr;
      reg_data(53)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_data;
      reg_data(55)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_addr;
      reg_data(55)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_addr;
      reg_data(56)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_data;
      reg_data(58)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_addr;
      reg_data(58)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_addr;
      reg_data(59)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_data;
      reg_data(65)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_addr;
      reg_data(65)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_addr;
      reg_data(66)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_data;
      reg_data(68)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_addr;
      reg_data(68)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_addr;
      reg_data(69)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_data;
      reg_data(71)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_addr;
      reg_data(71)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_addr;
      reg_data(72)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_data;
      reg_data(74)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_addr;
      reg_data(74)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_addr;
      reg_data(75)(31 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_data;
      reg_data(80)(12)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.ext_ctrl;
      reg_data(80)( 3 downto  0)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.sel_thread;
      reg_data(80)( 7 downto  4)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.sel_station;
      reg_data(80)(11 downto  8)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.sel_layer;
      reg_data(82)( 4 downto  0)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.MEM_INTERFACE.wr_addr;
      reg_data(82)(20 downto 16)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.MEM_INTERFACE.rd_addr;
      reg_data(83)(27 downto 16)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.MEM_INTERFACE.wr_data;
      reg_data(84)(12)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.ext_ctrl;
      reg_data(84)( 3 downto  0)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.sel_thread;
      reg_data(84)( 7 downto  4)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.sel_station;
      reg_data(84)(11 downto  8)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.sel_layer;
      reg_data(86)( 4 downto  0)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.MEM_INTERFACE.wr_addr;
      reg_data(86)(20 downto 16)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.MEM_INTERFACE.rd_addr;
      reg_data(87)(29 downto 16)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.MEM_INTERFACE.wr_data;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.SUPER.ACTIONS.RESET <= '0';
      Ctrl.SUPER.ACTIONS.ENABLE <= '0';
      Ctrl.SUPER.ACTIONS.DISABLE <= '0';
      Ctrl.SUPER.ACTIONS.FREEZE <= '0';
      Ctrl.SUPER.SECTOR_PHI.wr_req <= '0';
      Ctrl.SUPER.SECTOR_PHI.rd_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_req <= '0';
      Ctrl.R_PHI_COMP.RPC.MEM_INTERFACE.wr_req <= '0';
      Ctrl.R_PHI_COMP.RPC.MEM_INTERFACE.rd_req <= '0';
      Ctrl.R_PHI_COMP.MDT.MEM_INTERFACE.wr_req <= '0';
      Ctrl.R_PHI_COMP.MDT.MEM_INTERFACE.rd_req <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(6 downto 0))) is
        when 16 => --0x10
          Ctrl.SUPER.ACTIONS.RESET                        <=  localWrData( 0);               
          Ctrl.SUPER.ACTIONS.ENABLE                       <=  localWrData( 1);               
          Ctrl.SUPER.ACTIONS.DISABLE                      <=  localWrData( 2);               
          Ctrl.SUPER.ACTIONS.FREEZE                       <=  localWrData( 3);               
        when 17 => --0x11
          reg_data(17)( 3 downto  0)                      <=  localWrData( 3 downto  0);      -- 
          reg_data(17)( 4)                                <=  localWrData( 4);                -- 
          reg_data(17)( 5)                                <=  localWrData( 5);                -- 
        when 32 => --0x20
          Ctrl.SUPER.SECTOR_PHI.wr_req                    <=  localWrData( 0);               
          Ctrl.SUPER.SECTOR_PHI.rd_req                    <=  localWrData( 1);               
        when 33 => --0x21
          reg_data(33)(25 downto 16)                      <=  localWrData(25 downto 16);      -- Write Data
        when 48 => --0x30
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_req  <=  localWrData( 1);               
        when 49 => --0x31
          reg_data(49)( 7 downto  0)                      <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(49)(23 downto 16)                      <=  localWrData(23 downto 16);      -- Read Address
        when 50 => --0x32
          reg_data(50)(31 downto 16)                      <=  localWrData(31 downto 16);      -- Write Data
        when 51 => --0x33
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_req  <=  localWrData( 1);               
        when 52 => --0x34
          reg_data(52)( 7 downto  0)                      <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(52)(23 downto 16)                      <=  localWrData(23 downto 16);      -- Read Address
        when 53 => --0x35
          reg_data(53)(31 downto 16)                      <=  localWrData(31 downto 16);      -- Write Data
        when 54 => --0x36
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_req  <=  localWrData( 1);               
        when 55 => --0x37
          reg_data(55)( 7 downto  0)                      <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(55)(23 downto 16)                      <=  localWrData(23 downto 16);      -- Read Address
        when 56 => --0x38
          reg_data(56)(31 downto 16)                      <=  localWrData(31 downto 16);      -- Write Data
        when 57 => --0x39
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_req  <=  localWrData( 1);               
        when 58 => --0x3a
          reg_data(58)( 7 downto  0)                      <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(58)(23 downto 16)                      <=  localWrData(23 downto 16);      -- Read Address
        when 59 => --0x3b
          reg_data(59)(31 downto 16)                      <=  localWrData(31 downto 16);      -- Write Data
        when 64 => --0x40
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_req  <=  localWrData( 1);               
        when 65 => --0x41
          reg_data(65)( 7 downto  0)                      <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(65)(23 downto 16)                      <=  localWrData(23 downto 16);      -- Read Address
        when 66 => --0x42
          reg_data(66)(31 downto 16)                      <=  localWrData(31 downto 16);      -- Write Data
        when 67 => --0x43
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_req  <=  localWrData( 1);               
        when 68 => --0x44
          reg_data(68)( 7 downto  0)                      <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(68)(23 downto 16)                      <=  localWrData(23 downto 16);      -- Read Address
        when 69 => --0x45
          reg_data(69)(31 downto 16)                      <=  localWrData(31 downto 16);      -- Write Data
        when 70 => --0x46
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_req  <=  localWrData( 1);               
        when 71 => --0x47
          reg_data(71)( 7 downto  0)                      <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(71)(23 downto 16)                      <=  localWrData(23 downto 16);      -- Read Address
        when 72 => --0x48
          reg_data(72)(31 downto 16)                      <=  localWrData(31 downto 16);      -- Write Data
        when 73 => --0x49
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_req  <=  localWrData( 1);               
        when 74 => --0x4a
          reg_data(74)( 7 downto  0)                      <=  localWrData( 7 downto  0);      -- Write Address
          reg_data(74)(23 downto 16)                      <=  localWrData(23 downto 16);      -- Read Address
        when 75 => --0x4b
          reg_data(75)(31 downto 16)                      <=  localWrData(31 downto 16);      -- Write Data
        when 80 => --0x50
          reg_data(80)( 3 downto  0)                      <=  localWrData( 3 downto  0);      -- selected thread
          reg_data(80)( 7 downto  4)                      <=  localWrData( 7 downto  4);      -- selected station
          reg_data(80)(11 downto  8)                      <=  localWrData(11 downto  8);      -- selected position 0x:rpc_layer 1x:center chamber
          reg_data(80)(12)                                <=  localWrData(12);                -- external access to mem
        when 81 => --0x51
          Ctrl.R_PHI_COMP.RPC.MEM_INTERFACE.wr_req        <=  localWrData( 0);               
          Ctrl.R_PHI_COMP.RPC.MEM_INTERFACE.rd_req        <=  localWrData( 1);               
        when 82 => --0x52
          reg_data(82)( 4 downto  0)                      <=  localWrData( 4 downto  0);      -- Write Address
          reg_data(82)(20 downto 16)                      <=  localWrData(20 downto 16);      -- Read Address
        when 83 => --0x53
          reg_data(83)(27 downto 16)                      <=  localWrData(27 downto 16);      -- Write Data
        when 84 => --0x54
          reg_data(84)( 3 downto  0)                      <=  localWrData( 3 downto  0);      -- selected thread
          reg_data(84)( 7 downto  4)                      <=  localWrData( 7 downto  4);      -- selected station
          reg_data(84)(11 downto  8)                      <=  localWrData(11 downto  8);      -- selected position 0x:rpc_layer 1x:center chamber
          reg_data(84)(12)                                <=  localWrData(12);                -- external access to mem
        when 85 => --0x55
          Ctrl.R_PHI_COMP.MDT.MEM_INTERFACE.wr_req        <=  localWrData( 0);               
          Ctrl.R_PHI_COMP.MDT.MEM_INTERFACE.rd_req        <=  localWrData( 1);               
        when 86 => --0x56
          reg_data(86)( 4 downto  0)                      <=  localWrData( 4 downto  0);      -- Write Address
          reg_data(86)(20 downto 16)                      <=  localWrData(20 downto 16);      -- Read Address
        when 87 => --0x57
          reg_data(87)(29 downto 16)                      <=  localWrData(29 downto 16);      -- Write Data

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;
