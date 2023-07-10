--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;

use work.UCM_Ctrl.all;
use work.UCM_Ctrl_DEF.all;


entity UCM_map is
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
    
    Mon              : in  UCM_Mon_t;
    
    
    Ctrl             : out UCM_Ctrl_t
        
    );
end entity UCM_map;
architecture behavioral of UCM_map is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;

  
  
  signal reg_data :  slv32_array_t(integer range 0 to 4164);
  constant Default_reg_data : slv32_array_t(integer range 0 to 4164) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  assert ((4*4164) <= ALLOCATED_MEMORY_RANGE)
    report "UCM: Regmap addressing range " & integer'image(4*4164) & " is outside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
  severity ERROR;
  assert ((4*4164) > ALLOCATED_MEMORY_RANGE)
    report "UCM: Regmap addressing range " & integer'image(4*4164) & " is inside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
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
        case to_integer(unsigned(localAddress(12 downto 0))) is
          
        when 1 => --0x1
          localRdData( 3 downto  0)  <=  reg_data( 1)( 3 downto  0);                                     --
          localRdData( 4)            <=  reg_data( 1)( 4);                                               --
          localRdData( 5)            <=  reg_data( 1)( 5);                                               --
        when 2 => --0x2
          localRdData( 0)            <=  Mon.SUPER.STATUS.ENABLED;                                       --
          localRdData( 1)            <=  Mon.SUPER.STATUS.READY;                                         --
          localRdData(11 downto  4)  <=  Mon.SUPER.STATUS.ERROR;                                         --
        when 17 => --0x11
          localRdData( 9 downto  0)  <=  Mon.SUPER.SECTOR_PHI.rd_data;                                   --Read Data
          localRdData(25 downto 16)  <=  reg_data(17)(25 downto 16);                                     --Write Data
        when 32 => --0x20
          localRdData( 4)            <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(32)( 5);                                               --flush memory to Zync
          localRdData( 6)            <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(32)( 7);                                               --freeze memory
          localRdData(10 downto  8)  <=  reg_data(32)(10 downto  8);                                     --sel memory
        when 34 => --0x22
          localRdData( 7 downto  0)  <=  reg_data(34)( 7 downto  0);                                     --Write Address
          localRdData(23 downto 16)  <=  reg_data(34)(23 downto 16);                                     --Read Address
        when 35 => --0x23
          localRdData(15 downto  0)  <=  reg_data(35)(15 downto  0);                                     --Write Data 0
        when 36 => --0x24
          localRdData(15 downto  0)  <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_data.rd_data_0;       --Read Data 1
        when 48 => --0x30
          localRdData( 4)            <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(48)( 5);                                               --flush memory to Zync
          localRdData( 6)            <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(48)( 7);                                               --freeze memory
          localRdData(10 downto  8)  <=  reg_data(48)(10 downto  8);                                     --sel memory
        when 50 => --0x32
          localRdData( 7 downto  0)  <=  reg_data(50)( 7 downto  0);                                     --Write Address
          localRdData(23 downto 16)  <=  reg_data(50)(23 downto 16);                                     --Read Address
        when 51 => --0x33
          localRdData(15 downto  0)  <=  reg_data(51)(15 downto  0);                                     --Write Data 0
        when 52 => --0x34
          localRdData(15 downto  0)  <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_data.rd_data_0;       --Read Data 1
        when 288 => --0x120
          localRdData( 4)            <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(288)( 5);                                              --flush memory to Zync
          localRdData( 6)            <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(288)( 7);                                              --freeze memory
          localRdData(10 downto  8)  <=  reg_data(288)(10 downto  8);                                    --sel memory
        when 290 => --0x122
          localRdData( 7 downto  0)  <=  reg_data(290)( 7 downto  0);                                    --Write Address
          localRdData(23 downto 16)  <=  reg_data(290)(23 downto 16);                                    --Read Address
        when 291 => --0x123
          localRdData(15 downto  0)  <=  reg_data(291)(15 downto  0);                                    --Write Data 0
        when 292 => --0x124
          localRdData(15 downto  0)  <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_data.rd_data_0;       --Read Data 1
        when 4128 => --0x1020
          localRdData( 4)            <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(4128)( 5);                                             --flush memory to Zync
          localRdData( 6)            <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(4128)( 7);                                             --freeze memory
          localRdData(10 downto  8)  <=  reg_data(4128)(10 downto  8);                                   --sel memory
        when 4130 => --0x1022
          localRdData( 7 downto  0)  <=  reg_data(4130)( 7 downto  0);                                   --Write Address
          localRdData(23 downto 16)  <=  reg_data(4130)(23 downto 16);                                   --Read Address
        when 4131 => --0x1023
          localRdData(15 downto  0)  <=  reg_data(4131)(15 downto  0);                                   --Write Data 0
        when 4132 => --0x1024
          localRdData(15 downto  0)  <=  Mon.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_data.rd_data_0;       --Read Data 1
        when 64 => --0x40
          localRdData( 4)            <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(64)( 5);                                               --flush memory to Zync
          localRdData( 6)            <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(64)( 7);                                               --freeze memory
          localRdData(10 downto  8)  <=  reg_data(64)(10 downto  8);                                     --sel memory
        when 66 => --0x42
          localRdData( 7 downto  0)  <=  reg_data(66)( 7 downto  0);                                     --Write Address
          localRdData(23 downto 16)  <=  reg_data(66)(23 downto 16);                                     --Read Address
        when 67 => --0x43
          localRdData(15 downto  0)  <=  reg_data(67)(15 downto  0);                                     --Write Data 0
        when 68 => --0x44
          localRdData(15 downto  0)  <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_data.rd_data_0;       --Read Data 1
        when 80 => --0x50
          localRdData( 4)            <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(80)( 5);                                               --flush memory to Zync
          localRdData( 6)            <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(80)( 7);                                               --freeze memory
          localRdData(10 downto  8)  <=  reg_data(80)(10 downto  8);                                     --sel memory
        when 82 => --0x52
          localRdData( 7 downto  0)  <=  reg_data(82)( 7 downto  0);                                     --Write Address
          localRdData(23 downto 16)  <=  reg_data(82)(23 downto 16);                                     --Read Address
        when 83 => --0x53
          localRdData(15 downto  0)  <=  reg_data(83)(15 downto  0);                                     --Write Data 0
        when 84 => --0x54
          localRdData(15 downto  0)  <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_data.rd_data_0;       --Read Data 1
        when 320 => --0x140
          localRdData( 4)            <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(320)( 5);                                              --flush memory to Zync
          localRdData( 6)            <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(320)( 7);                                              --freeze memory
          localRdData(10 downto  8)  <=  reg_data(320)(10 downto  8);                                    --sel memory
        when 322 => --0x142
          localRdData( 7 downto  0)  <=  reg_data(322)( 7 downto  0);                                    --Write Address
          localRdData(23 downto 16)  <=  reg_data(322)(23 downto 16);                                    --Read Address
        when 323 => --0x143
          localRdData(15 downto  0)  <=  reg_data(323)(15 downto  0);                                    --Write Data 0
        when 324 => --0x144
          localRdData(15 downto  0)  <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_data.rd_data_0;       --Read Data 1
        when 4160 => --0x1040
          localRdData( 4)            <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(4160)( 5);                                             --flush memory to Zync
          localRdData( 6)            <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(4160)( 7);                                             --freeze memory
          localRdData(10 downto  8)  <=  reg_data(4160)(10 downto  8);                                   --sel memory
        when 4162 => --0x1042
          localRdData( 7 downto  0)  <=  reg_data(4162)( 7 downto  0);                                   --Write Address
          localRdData(23 downto 16)  <=  reg_data(4162)(23 downto 16);                                   --Read Address
        when 4163 => --0x1043
          localRdData(15 downto  0)  <=  reg_data(4163)(15 downto  0);                                   --Write Data 0
        when 4164 => --0x1044
          localRdData(15 downto  0)  <=  Mon.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_data.rd_data_0;       --Read Data 1
        when 128 => --0x80
          localRdData( 3 downto  0)  <=  reg_data(128)( 3 downto  0);                                    --selected thread
          localRdData( 7 downto  4)  <=  reg_data(128)( 7 downto  4);                                    --selected station
          localRdData(11 downto  8)  <=  reg_data(128)(11 downto  8);                                    --selected position 0x:rpc_layer 1x:center chamber
          localRdData(12)            <=  reg_data(128)(12);                                              --external access to mem
        when 130 => --0x82
          localRdData( 4 downto  0)  <=  reg_data(130)( 4 downto  0);                                    --Write Address
          localRdData(13)            <=  Mon.R_PHI_COMP.RPC.MEM_INTERFACE.rd_rdy;                        --Read ready
          localRdData(20 downto 16)  <=  reg_data(130)(20 downto 16);                                    --Read Address
        when 131 => --0x83
          localRdData(11 downto  0)  <=  Mon.R_PHI_COMP.RPC.MEM_INTERFACE.rd_data;                       --Read Data
          localRdData(27 downto 16)  <=  reg_data(131)(27 downto 16);                                    --Write Data
        when 132 => --0x84
          localRdData( 3 downto  0)  <=  reg_data(132)( 3 downto  0);                                    --selected thread
          localRdData( 7 downto  4)  <=  reg_data(132)( 7 downto  4);                                    --selected station
          localRdData(11 downto  8)  <=  reg_data(132)(11 downto  8);                                    --selected position 0x:rpc_layer 1x:center chamber
          localRdData(12)            <=  reg_data(132)(12);                                              --external access to mem
        when 134 => --0x86
          localRdData( 4 downto  0)  <=  reg_data(134)( 4 downto  0);                                    --Write Address
          localRdData(13)            <=  Mon.R_PHI_COMP.MDT.MEM_INTERFACE.rd_rdy;                        --Read ready
          localRdData(20 downto 16)  <=  reg_data(134)(20 downto 16);                                    --Read Address
        when 135 => --0x87
          localRdData(13 downto  0)  <=  Mon.R_PHI_COMP.MDT.MEM_INTERFACE.rd_data;                       --Read Data
          localRdData(29 downto 16)  <=  reg_data(135)(29 downto 16);                                    --Write Data


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
  Ctrl.SUPER.CONFIGS.THREADS                                  <=  reg_data( 1)( 3 downto  0);       
  Ctrl.SUPER.CONFIGS.INPUT_EN                                 <=  reg_data( 1)( 4);                 
  Ctrl.SUPER.CONFIGS.OUTPUT_EN                                <=  reg_data( 1)( 5);                 
  Ctrl.SUPER.SECTOR_PHI.wr_data                               <=  reg_data(17)(25 downto 16);       
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.flush_req   <=  reg_data(32)( 5);                 
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.freeze_req  <=  reg_data(32)( 7);                 
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.mem_sel     <=  reg_data(32)(10 downto  8);       
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_addr             <=  reg_data(34)( 7 downto  0);       
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_addr             <=  reg_data(34)(23 downto 16);       
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_data.wr_data_0   <=  reg_data(35)(15 downto  0);       
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.flush_req   <=  reg_data(48)( 5);                 
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.freeze_req  <=  reg_data(48)( 7);                 
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.mem_sel     <=  reg_data(48)(10 downto  8);       
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_addr             <=  reg_data(50)( 7 downto  0);       
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_addr             <=  reg_data(50)(23 downto 16);       
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_data.wr_data_0   <=  reg_data(51)(15 downto  0);       
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.flush_req   <=  reg_data(288)( 5);                
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.freeze_req  <=  reg_data(288)( 7);                
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.mem_sel     <=  reg_data(288)(10 downto  8);      
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_addr             <=  reg_data(290)( 7 downto  0);      
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_addr             <=  reg_data(290)(23 downto 16);      
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_data.wr_data_0   <=  reg_data(291)(15 downto  0);      
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.flush_req   <=  reg_data(4128)( 5);               
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.freeze_req  <=  reg_data(4128)( 7);               
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.mem_sel     <=  reg_data(4128)(10 downto  8);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_addr             <=  reg_data(4130)( 7 downto  0);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_addr             <=  reg_data(4130)(23 downto 16);     
  Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_data.wr_data_0   <=  reg_data(4131)(15 downto  0);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.flush_req   <=  reg_data(64)( 5);                 
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.freeze_req  <=  reg_data(64)( 7);                 
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.mem_sel     <=  reg_data(64)(10 downto  8);       
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_addr             <=  reg_data(66)( 7 downto  0);       
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_addr             <=  reg_data(66)(23 downto 16);       
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_data.wr_data_0   <=  reg_data(67)(15 downto  0);       
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.flush_req   <=  reg_data(80)( 5);                 
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.freeze_req  <=  reg_data(80)( 7);                 
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.mem_sel     <=  reg_data(80)(10 downto  8);       
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_addr             <=  reg_data(82)( 7 downto  0);       
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_addr             <=  reg_data(82)(23 downto 16);       
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_data.wr_data_0   <=  reg_data(83)(15 downto  0);       
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.flush_req   <=  reg_data(320)( 5);                
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.freeze_req  <=  reg_data(320)( 7);                
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.mem_sel     <=  reg_data(320)(10 downto  8);      
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_addr             <=  reg_data(322)( 7 downto  0);      
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_addr             <=  reg_data(322)(23 downto 16);      
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_data.wr_data_0   <=  reg_data(323)(15 downto  0);      
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.flush_req   <=  reg_data(4160)( 5);               
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.freeze_req  <=  reg_data(4160)( 7);               
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.mem_sel     <=  reg_data(4160)(10 downto  8);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_addr             <=  reg_data(4162)( 7 downto  0);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_addr             <=  reg_data(4162)(23 downto 16);     
  Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_data.wr_data_0   <=  reg_data(4163)(15 downto  0);     
  Ctrl.R_PHI_COMP.RPC.sel_thread                              <=  reg_data(128)( 3 downto  0);      
  Ctrl.R_PHI_COMP.RPC.sel_station                             <=  reg_data(128)( 7 downto  4);      
  Ctrl.R_PHI_COMP.RPC.sel_layer                               <=  reg_data(128)(11 downto  8);      
  Ctrl.R_PHI_COMP.RPC.ext_ctrl                                <=  reg_data(128)(12);                
  Ctrl.R_PHI_COMP.RPC.MEM_INTERFACE.wr_addr                   <=  reg_data(130)( 4 downto  0);      
  Ctrl.R_PHI_COMP.RPC.MEM_INTERFACE.rd_addr                   <=  reg_data(130)(20 downto 16);      
  Ctrl.R_PHI_COMP.RPC.MEM_INTERFACE.wr_data                   <=  reg_data(131)(27 downto 16);      
  Ctrl.R_PHI_COMP.MDT.sel_thread                              <=  reg_data(132)( 3 downto  0);      
  Ctrl.R_PHI_COMP.MDT.sel_station                             <=  reg_data(132)( 7 downto  4);      
  Ctrl.R_PHI_COMP.MDT.sel_layer                               <=  reg_data(132)(11 downto  8);      
  Ctrl.R_PHI_COMP.MDT.ext_ctrl                                <=  reg_data(132)(12);                
  Ctrl.R_PHI_COMP.MDT.MEM_INTERFACE.wr_addr                   <=  reg_data(134)( 4 downto  0);      
  Ctrl.R_PHI_COMP.MDT.MEM_INTERFACE.rd_addr                   <=  reg_data(134)(20 downto 16);      
  Ctrl.R_PHI_COMP.MDT.MEM_INTERFACE.wr_data                   <=  reg_data(135)(29 downto 16);      


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 0)( 0)  <= DEFAULT_UCM_CTRL_t.SUPER.ACTIONS.RESET;
      reg_data( 0)( 1)  <= DEFAULT_UCM_CTRL_t.SUPER.ACTIONS.ENABLE;
      reg_data( 0)( 2)  <= DEFAULT_UCM_CTRL_t.SUPER.ACTIONS.DISABLE;
      reg_data( 0)( 3)  <= DEFAULT_UCM_CTRL_t.SUPER.ACTIONS.FREEZE;
      reg_data( 1)( 3 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CONFIGS.THREADS;
      reg_data( 1)( 4)  <= DEFAULT_UCM_CTRL_t.SUPER.CONFIGS.INPUT_EN;
      reg_data( 1)( 5)  <= DEFAULT_UCM_CTRL_t.SUPER.CONFIGS.OUTPUT_EN;
      reg_data(16)( 0)  <= DEFAULT_UCM_CTRL_t.SUPER.SECTOR_PHI.wr_req;
      reg_data(16)( 1)  <= DEFAULT_UCM_CTRL_t.SUPER.SECTOR_PHI.rd_req;
      reg_data(17)(25 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.SECTOR_PHI.wr_data;
      reg_data(32)( 0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.wr_req;
      reg_data(32)( 1)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.wr_ack;
      reg_data(32)( 2)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.rd_req;
      reg_data(32)( 3)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.rd_ack;
      reg_data(32)( 5)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.flush_req;
      reg_data(32)( 7)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.freeze_req;
      reg_data(32)(10 downto  8)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.mem_sel;
      reg_data(34)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_addr;
      reg_data(34)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).rd_addr;
      reg_data(35)(15 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).wr_data.wr_data_0;
      reg_data(48)( 0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.wr_req;
      reg_data(48)( 1)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.wr_ack;
      reg_data(48)( 2)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.rd_req;
      reg_data(48)( 3)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.rd_ack;
      reg_data(48)( 5)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.flush_req;
      reg_data(48)( 7)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.freeze_req;
      reg_data(48)(10 downto  8)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.mem_sel;
      reg_data(50)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_addr;
      reg_data(50)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).rd_addr;
      reg_data(51)(15 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).wr_data.wr_data_0;
      reg_data(288)( 0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.wr_req;
      reg_data(288)( 1)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.wr_ack;
      reg_data(288)( 2)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.rd_req;
      reg_data(288)( 3)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.rd_ack;
      reg_data(288)( 5)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.flush_req;
      reg_data(288)( 7)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.freeze_req;
      reg_data(288)(10 downto  8)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.mem_sel;
      reg_data(290)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_addr;
      reg_data(290)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).rd_addr;
      reg_data(291)(15 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).wr_data.wr_data_0;
      reg_data(4128)( 0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.wr_req;
      reg_data(4128)( 1)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.wr_ack;
      reg_data(4128)( 2)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.rd_req;
      reg_data(4128)( 3)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.rd_ack;
      reg_data(4128)( 5)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.flush_req;
      reg_data(4128)( 7)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.freeze_req;
      reg_data(4128)(10 downto  8)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.mem_sel;
      reg_data(4130)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_addr;
      reg_data(4130)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).rd_addr;
      reg_data(4131)(15 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).wr_data.wr_data_0;
      reg_data(64)( 0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.wr_req;
      reg_data(64)( 1)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.wr_ack;
      reg_data(64)( 2)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.rd_req;
      reg_data(64)( 3)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.rd_ack;
      reg_data(64)( 5)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.flush_req;
      reg_data(64)( 7)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.freeze_req;
      reg_data(64)(10 downto  8)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.mem_sel;
      reg_data(66)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_addr;
      reg_data(66)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).rd_addr;
      reg_data(67)(15 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).wr_data.wr_data_0;
      reg_data(80)( 0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.wr_req;
      reg_data(80)( 1)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.wr_ack;
      reg_data(80)( 2)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.rd_req;
      reg_data(80)( 3)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.rd_ack;
      reg_data(80)( 5)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.flush_req;
      reg_data(80)( 7)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.freeze_req;
      reg_data(80)(10 downto  8)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.mem_sel;
      reg_data(82)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_addr;
      reg_data(82)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).rd_addr;
      reg_data(83)(15 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).wr_data.wr_data_0;
      reg_data(320)( 0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.wr_req;
      reg_data(320)( 1)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.wr_ack;
      reg_data(320)( 2)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.rd_req;
      reg_data(320)( 3)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.rd_ack;
      reg_data(320)( 5)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.flush_req;
      reg_data(320)( 7)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.freeze_req;
      reg_data(320)(10 downto  8)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.mem_sel;
      reg_data(322)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_addr;
      reg_data(322)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).rd_addr;
      reg_data(323)(15 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).wr_data.wr_data_0;
      reg_data(4160)( 0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.wr_req;
      reg_data(4160)( 1)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.wr_ack;
      reg_data(4160)( 2)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.rd_req;
      reg_data(4160)( 3)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.rd_ack;
      reg_data(4160)( 5)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.flush_req;
      reg_data(4160)( 7)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.freeze_req;
      reg_data(4160)(10 downto  8)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.mem_sel;
      reg_data(4162)( 7 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_addr;
      reg_data(4162)(23 downto 16)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).rd_addr;
      reg_data(4163)(15 downto  0)  <= DEFAULT_UCM_CTRL_t.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).wr_data.wr_data_0;
      reg_data(128)( 3 downto  0)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.sel_thread;
      reg_data(128)( 7 downto  4)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.sel_station;
      reg_data(128)(11 downto  8)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.sel_layer;
      reg_data(128)(12)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.ext_ctrl;
      reg_data(129)( 0)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.MEM_INTERFACE.wr_req;
      reg_data(129)( 1)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.MEM_INTERFACE.rd_req;
      reg_data(130)( 4 downto  0)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.MEM_INTERFACE.wr_addr;
      reg_data(130)(20 downto 16)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.MEM_INTERFACE.rd_addr;
      reg_data(131)(27 downto 16)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.RPC.MEM_INTERFACE.wr_data;
      reg_data(132)( 3 downto  0)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.sel_thread;
      reg_data(132)( 7 downto  4)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.sel_station;
      reg_data(132)(11 downto  8)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.sel_layer;
      reg_data(132)(12)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.ext_ctrl;
      reg_data(133)( 0)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.MEM_INTERFACE.wr_req;
      reg_data(133)( 1)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.MEM_INTERFACE.rd_req;
      reg_data(134)( 4 downto  0)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.MEM_INTERFACE.wr_addr;
      reg_data(134)(20 downto 16)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.MEM_INTERFACE.rd_addr;
      reg_data(135)(29 downto 16)  <= DEFAULT_UCM_CTRL_t.R_PHI_COMP.MDT.MEM_INTERFACE.wr_data;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.SUPER.ACTIONS.RESET <= '0';
      Ctrl.SUPER.ACTIONS.ENABLE <= '0';
      Ctrl.SUPER.ACTIONS.DISABLE <= '0';
      Ctrl.SUPER.ACTIONS.FREEZE <= '0';
      Ctrl.SUPER.SECTOR_PHI.wr_req <= '0';
      Ctrl.SUPER.SECTOR_PHI.rd_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.wr_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.wr_ack <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.rd_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.rd_ack <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.wr_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.wr_ack <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.rd_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.rd_ack <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.wr_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.wr_ack <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.rd_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.rd_ack <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.wr_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.wr_ack <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.rd_req <= '0';
      Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.rd_ack <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.wr_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.wr_ack <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.rd_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.rd_ack <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.wr_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.wr_ack <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.rd_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.rd_ack <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.wr_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.wr_ack <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.rd_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.rd_ack <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.wr_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.wr_ack <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.rd_req <= '0';
      Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.rd_ack <= '0';
      Ctrl.R_PHI_COMP.RPC.MEM_INTERFACE.wr_req <= '0';
      Ctrl.R_PHI_COMP.RPC.MEM_INTERFACE.rd_req <= '0';
      Ctrl.R_PHI_COMP.MDT.MEM_INTERFACE.wr_req <= '0';
      Ctrl.R_PHI_COMP.MDT.MEM_INTERFACE.rd_req <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(12 downto 0))) is
        when 0 => --0x0
          Ctrl.SUPER.ACTIONS.RESET                                <=  localWrData( 0);               
          Ctrl.SUPER.ACTIONS.ENABLE                               <=  localWrData( 1);               
          Ctrl.SUPER.ACTIONS.DISABLE                              <=  localWrData( 2);               
          Ctrl.SUPER.ACTIONS.FREEZE                               <=  localWrData( 3);               
        when 1 => --0x1
          reg_data( 1)( 3 downto  0)                              <=  localWrData( 3 downto  0);      --
          reg_data( 1)( 4)                                        <=  localWrData( 4);                --
          reg_data( 1)( 5)                                        <=  localWrData( 5);                --
        when 16 => --0x10
          Ctrl.SUPER.SECTOR_PHI.wr_req                            <=  localWrData( 0);               
          Ctrl.SUPER.SECTOR_PHI.rd_req                            <=  localWrData( 1);               
        when 17 => --0x11
          reg_data(17)(25 downto 16)                              <=  localWrData(25 downto 16);      --Write Data
        when 32 => --0x20
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(32)( 5)                                        <=  localWrData( 5);                --flush memory to Zync
          reg_data(32)( 7)                                        <=  localWrData( 7);                --freeze memory
          reg_data(32)(10 downto  8)                              <=  localWrData(10 downto  8);      --sel memory
        when 34 => --0x22
          reg_data(34)( 7 downto  0)                              <=  localWrData( 7 downto  0);      --Write Address
          reg_data(34)(23 downto 16)                              <=  localWrData(23 downto 16);      --Read Address
        when 35 => --0x23
          reg_data(35)(15 downto  0)                              <=  localWrData(15 downto  0);      --Write Data 0
        when 48 => --0x30
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(48)( 5)                                        <=  localWrData( 5);                --flush memory to Zync
          reg_data(48)( 7)                                        <=  localWrData( 7);                --freeze memory
          reg_data(48)(10 downto  8)                              <=  localWrData(10 downto  8);      --sel memory
        when 50 => --0x32
          reg_data(50)( 7 downto  0)                              <=  localWrData( 7 downto  0);      --Write Address
          reg_data(50)(23 downto 16)                              <=  localWrData(23 downto 16);      --Read Address
        when 51 => --0x33
          reg_data(51)(15 downto  0)                              <=  localWrData(15 downto  0);      --Write Data 0
        when 288 => --0x120
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(288)( 5)                                       <=  localWrData( 5);                --flush memory to Zync
          reg_data(288)( 7)                                       <=  localWrData( 7);                --freeze memory
          reg_data(288)(10 downto  8)                             <=  localWrData(10 downto  8);      --sel memory
        when 290 => --0x122
          reg_data(290)( 7 downto  0)                             <=  localWrData( 7 downto  0);      --Write Address
          reg_data(290)(23 downto 16)                             <=  localWrData(23 downto 16);      --Read Address
        when 291 => --0x123
          reg_data(291)(15 downto  0)                             <=  localWrData(15 downto  0);      --Write Data 0
        when 4128 => --0x1020
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.SUPER.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(4128)( 5)                                      <=  localWrData( 5);                --flush memory to Zync
          reg_data(4128)( 7)                                      <=  localWrData( 7);                --freeze memory
          reg_data(4128)(10 downto  8)                            <=  localWrData(10 downto  8);      --sel memory
        when 4130 => --0x1022
          reg_data(4130)( 7 downto  0)                            <=  localWrData( 7 downto  0);      --Write Address
          reg_data(4130)(23 downto 16)                            <=  localWrData(23 downto 16);      --Read Address
        when 4131 => --0x1023
          reg_data(4131)(15 downto  0)                            <=  localWrData(15 downto  0);      --Write Data 0
        when 64 => --0x40
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(64)( 5)                                        <=  localWrData( 5);                --flush memory to Zync
          reg_data(64)( 7)                                        <=  localWrData( 7);                --freeze memory
          reg_data(64)(10 downto  8)                              <=  localWrData(10 downto  8);      --sel memory
        when 66 => --0x42
          reg_data(66)( 7 downto  0)                              <=  localWrData( 7 downto  0);      --Write Address
          reg_data(66)(23 downto 16)                              <=  localWrData(23 downto 16);      --Read Address
        when 67 => --0x43
          reg_data(67)(15 downto  0)                              <=  localWrData(15 downto  0);      --Write Data 0
        when 80 => --0x50
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(80)( 5)                                        <=  localWrData( 5);                --flush memory to Zync
          reg_data(80)( 7)                                        <=  localWrData( 7);                --freeze memory
          reg_data(80)(10 downto  8)                              <=  localWrData(10 downto  8);      --sel memory
        when 82 => --0x52
          reg_data(82)( 7 downto  0)                              <=  localWrData( 7 downto  0);      --Write Address
          reg_data(82)(23 downto 16)                              <=  localWrData(23 downto 16);      --Read Address
        when 83 => --0x53
          reg_data(83)(15 downto  0)                              <=  localWrData(15 downto  0);      --Write Data 0
        when 320 => --0x140
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(320)( 5)                                       <=  localWrData( 5);                --flush memory to Zync
          reg_data(320)( 7)                                       <=  localWrData( 7);                --freeze memory
          reg_data(320)(10 downto  8)                             <=  localWrData(10 downto  8);      --sel memory
        when 322 => --0x142
          reg_data(322)( 7 downto  0)                             <=  localWrData( 7 downto  0);      --Write Address
          reg_data(322)(23 downto 16)                             <=  localWrData(23 downto 16);      --Read Address
        when 323 => --0x143
          reg_data(323)(15 downto  0)                             <=  localWrData(15 downto  0);      --Write Data 0
        when 4160 => --0x1040
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.SUPER.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(4160)( 5)                                      <=  localWrData( 5);                --flush memory to Zync
          reg_data(4160)( 7)                                      <=  localWrData( 7);                --freeze memory
          reg_data(4160)(10 downto  8)                            <=  localWrData(10 downto  8);      --sel memory
        when 4162 => --0x1042
          reg_data(4162)( 7 downto  0)                            <=  localWrData( 7 downto  0);      --Write Address
          reg_data(4162)(23 downto 16)                            <=  localWrData(23 downto 16);      --Read Address
        when 4163 => --0x1043
          reg_data(4163)(15 downto  0)                            <=  localWrData(15 downto  0);      --Write Data 0
        when 128 => --0x80
          reg_data(128)( 3 downto  0)                             <=  localWrData( 3 downto  0);      --selected thread
          reg_data(128)( 7 downto  4)                             <=  localWrData( 7 downto  4);      --selected station
          reg_data(128)(11 downto  8)                             <=  localWrData(11 downto  8);      --selected position 0x:rpc_layer 1x:center chamber
          reg_data(128)(12)                                       <=  localWrData(12);                --external access to mem
        when 129 => --0x81
          Ctrl.R_PHI_COMP.RPC.MEM_INTERFACE.wr_req                <=  localWrData( 0);               
          Ctrl.R_PHI_COMP.RPC.MEM_INTERFACE.rd_req                <=  localWrData( 1);               
        when 130 => --0x82
          reg_data(130)( 4 downto  0)                             <=  localWrData( 4 downto  0);      --Write Address
          reg_data(130)(20 downto 16)                             <=  localWrData(20 downto 16);      --Read Address
        when 131 => --0x83
          reg_data(131)(27 downto 16)                             <=  localWrData(27 downto 16);      --Write Data
        when 132 => --0x84
          reg_data(132)( 3 downto  0)                             <=  localWrData( 3 downto  0);      --selected thread
          reg_data(132)( 7 downto  4)                             <=  localWrData( 7 downto  4);      --selected station
          reg_data(132)(11 downto  8)                             <=  localWrData(11 downto  8);      --selected position 0x:rpc_layer 1x:center chamber
          reg_data(132)(12)                                       <=  localWrData(12);                --external access to mem
        when 133 => --0x85
          Ctrl.R_PHI_COMP.MDT.MEM_INTERFACE.wr_req                <=  localWrData( 0);               
          Ctrl.R_PHI_COMP.MDT.MEM_INTERFACE.rd_req                <=  localWrData( 1);               
        when 134 => --0x86
          reg_data(134)( 4 downto  0)                             <=  localWrData( 4 downto  0);      --Write Address
          reg_data(134)(20 downto 16)                             <=  localWrData(20 downto 16);      --Read Address
        when 135 => --0x87
          reg_data(135)(29 downto 16)                             <=  localWrData(29 downto 16);      --Write Data

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;







  
end architecture behavioral;