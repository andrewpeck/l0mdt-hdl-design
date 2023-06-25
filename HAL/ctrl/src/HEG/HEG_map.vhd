--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;

use work.HEG_Ctrl.all;
use work.HEG_Ctrl_DEF.all;


entity HEG_map is
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
    
    Mon              : in  HEG_Mon_t;
    
    
    Ctrl             : out HEG_Ctrl_t
        
    );
end entity HEG_map;
architecture behavioral of HEG_map is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;

  
  
  signal reg_data :  slv32_array_t(integer range 0 to 152);
  constant Default_reg_data : slv32_array_t(integer range 0 to 152) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  assert ((4*152) <= ALLOCATED_MEMORY_RANGE)
    report "HEG: Regmap addressing range " & integer'image(4*152) & " is outside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
  severity ERROR;
  assert ((4*152) > ALLOCATED_MEMORY_RANGE)
    report "HEG: Regmap addressing range " & integer'image(4*152) & " is inside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
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
        case to_integer(unsigned(localAddress(7 downto 0))) is
          
        when 1 => --0x1
          localRdData( 0)            <=  reg_data( 1)( 0);                              --
          localRdData( 1)            <=  reg_data( 1)( 1);                              --
          localRdData( 2)            <=  reg_data( 1)( 2);                              --
        when 16 => --0x10
          localRdData( 0)            <=  Mon.SUPER.STATUS.ENABLED;                      --
          localRdData( 1)            <=  Mon.SUPER.STATUS.READY;                        --
          localRdData( 2)            <=  Mon.SUPER.STATUS.ERROR;                        --
        when 33 => --0x21
          localRdData(31 downto  0)  <=  Mon.SUPER.COUNTERS.SLC_PROC;                   --
        when 34 => --0x22
          localRdData(31 downto  0)  <=  Mon.SUPER.COUNTERS.HIT_PROC;                   --
        when 36 => --0x24
          localRdData(31 downto  0)  <=  Mon.SUPER.COUNTERS.HIT_OK;                     --
        when 40 => --0x28
          localRdData(31 downto  0)  <=  Mon.SUPER.COUNTERS.ERROR;                      --
        when 48 => --0x30
          localRdData( 4)            <=  Mon.CTRL.ROI_TC.SIGNALS.rd_rdy;                --Read ready
          localRdData( 5)            <=  reg_data(48)( 5);                              --flush memory to Zync
          localRdData( 6)            <=  Mon.CTRL.ROI_TC.SIGNALS.freeze_ena;            --freeze memory
          localRdData( 7)            <=  reg_data(48)( 7);                              --freeze memory
          localRdData(10 downto  8)  <=  reg_data(48)(10 downto  8);                    --sel memory
        when 50 => --0x32
          localRdData( 9 downto  0)  <=  reg_data(50)( 9 downto  0);                    --wr_Address
          localRdData(25 downto 16)  <=  reg_data(50)(25 downto 16);                    --rd_Address
        when 51 => --0x33
          localRdData(31 downto  0)  <=  reg_data(51)(31 downto  0);                    --Write Data 0
        when 52 => --0x34
          localRdData( 5 downto  0)  <=  reg_data(52)( 5 downto  0);                    --Write Data 1
        when 53 => --0x35
          localRdData( 5 downto  0)  <=  Mon.CTRL.ROI_TC.rd_data.rd_data_1;             --Read Data 1
        when 54 => --0x36
          localRdData(31 downto  0)  <=  Mon.CTRL.ROI_TC.rd_data.rd_data_0;             --Read Data 0
        when 65 => --0x41
          localRdData( 0)            <=  reg_data(65)( 0);                              --
          localRdData( 1)            <=  reg_data(65)( 1);                              --
          localRdData( 2)            <=  reg_data(65)( 2);                              --
        when 67 => --0x43
          localRdData( 4)            <=  Mon.HP.HP(0).MDT_DT2R.SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(67)( 5);                              --flush memory to Zync
          localRdData( 6)            <=  Mon.HP.HP(0).MDT_DT2R.SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(67)( 7);                              --freeze memory
          localRdData(10 downto  8)  <=  reg_data(67)(10 downto  8);                    --sel memory
        when 69 => --0x45
          localRdData( 9 downto  0)  <=  reg_data(69)( 9 downto  0);                    --wr_Address
          localRdData(25 downto 16)  <=  reg_data(69)(25 downto 16);                    --rd_Address
        when 70 => --0x46
          localRdData( 8 downto  0)  <=  reg_data(70)( 8 downto  0);                    --Write Data 0
        when 72 => --0x48
          localRdData( 8 downto  0)  <=  Mon.HP.HP(0).MDT_DT2R.rd_data.rd_data_0;       --Read Data 0
        when 81 => --0x51
          localRdData( 0)            <=  reg_data(81)( 0);                              --
          localRdData( 1)            <=  reg_data(81)( 1);                              --
          localRdData( 2)            <=  reg_data(81)( 2);                              --
        when 83 => --0x53
          localRdData( 4)            <=  Mon.HP.HP(1).MDT_DT2R.SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(83)( 5);                              --flush memory to Zync
          localRdData( 6)            <=  Mon.HP.HP(1).MDT_DT2R.SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(83)( 7);                              --freeze memory
          localRdData(10 downto  8)  <=  reg_data(83)(10 downto  8);                    --sel memory
        when 85 => --0x55
          localRdData( 9 downto  0)  <=  reg_data(85)( 9 downto  0);                    --wr_Address
          localRdData(25 downto 16)  <=  reg_data(85)(25 downto 16);                    --rd_Address
        when 86 => --0x56
          localRdData( 8 downto  0)  <=  reg_data(86)( 8 downto  0);                    --Write Data 0
        when 88 => --0x58
          localRdData( 8 downto  0)  <=  Mon.HP.HP(1).MDT_DT2R.rd_data.rd_data_0;       --Read Data 0
        when 97 => --0x61
          localRdData( 0)            <=  reg_data(97)( 0);                              --
          localRdData( 1)            <=  reg_data(97)( 1);                              --
          localRdData( 2)            <=  reg_data(97)( 2);                              --
        when 99 => --0x63
          localRdData( 4)            <=  Mon.HP.HP(2).MDT_DT2R.SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(99)( 5);                              --flush memory to Zync
          localRdData( 6)            <=  Mon.HP.HP(2).MDT_DT2R.SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(99)( 7);                              --freeze memory
          localRdData(10 downto  8)  <=  reg_data(99)(10 downto  8);                    --sel memory
        when 101 => --0x65
          localRdData( 9 downto  0)  <=  reg_data(101)( 9 downto  0);                   --wr_Address
          localRdData(25 downto 16)  <=  reg_data(101)(25 downto 16);                   --rd_Address
        when 102 => --0x66
          localRdData( 8 downto  0)  <=  reg_data(102)( 8 downto  0);                   --Write Data 0
        when 104 => --0x68
          localRdData( 8 downto  0)  <=  Mon.HP.HP(2).MDT_DT2R.rd_data.rd_data_0;       --Read Data 0
        when 113 => --0x71
          localRdData( 0)            <=  reg_data(113)( 0);                             --
          localRdData( 1)            <=  reg_data(113)( 1);                             --
          localRdData( 2)            <=  reg_data(113)( 2);                             --
        when 115 => --0x73
          localRdData( 4)            <=  Mon.HP.HP(3).MDT_DT2R.SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(115)( 5);                             --flush memory to Zync
          localRdData( 6)            <=  Mon.HP.HP(3).MDT_DT2R.SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(115)( 7);                             --freeze memory
          localRdData(10 downto  8)  <=  reg_data(115)(10 downto  8);                   --sel memory
        when 117 => --0x75
          localRdData( 9 downto  0)  <=  reg_data(117)( 9 downto  0);                   --wr_Address
          localRdData(25 downto 16)  <=  reg_data(117)(25 downto 16);                   --rd_Address
        when 118 => --0x76
          localRdData( 8 downto  0)  <=  reg_data(118)( 8 downto  0);                   --Write Data 0
        when 120 => --0x78
          localRdData( 8 downto  0)  <=  Mon.HP.HP(3).MDT_DT2R.rd_data.rd_data_0;       --Read Data 0
        when 129 => --0x81
          localRdData( 0)            <=  reg_data(129)( 0);                             --
          localRdData( 1)            <=  reg_data(129)( 1);                             --
          localRdData( 2)            <=  reg_data(129)( 2);                             --
        when 131 => --0x83
          localRdData( 4)            <=  Mon.HP.HP(4).MDT_DT2R.SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(131)( 5);                             --flush memory to Zync
          localRdData( 6)            <=  Mon.HP.HP(4).MDT_DT2R.SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(131)( 7);                             --freeze memory
          localRdData(10 downto  8)  <=  reg_data(131)(10 downto  8);                   --sel memory
        when 133 => --0x85
          localRdData( 9 downto  0)  <=  reg_data(133)( 9 downto  0);                   --wr_Address
          localRdData(25 downto 16)  <=  reg_data(133)(25 downto 16);                   --rd_Address
        when 134 => --0x86
          localRdData( 8 downto  0)  <=  reg_data(134)( 8 downto  0);                   --Write Data 0
        when 136 => --0x88
          localRdData( 8 downto  0)  <=  Mon.HP.HP(4).MDT_DT2R.rd_data.rd_data_0;       --Read Data 0
        when 145 => --0x91
          localRdData( 0)            <=  reg_data(145)( 0);                             --
          localRdData( 1)            <=  reg_data(145)( 1);                             --
          localRdData( 2)            <=  reg_data(145)( 2);                             --
        when 147 => --0x93
          localRdData( 4)            <=  Mon.HP.HP(5).MDT_DT2R.SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(147)( 5);                             --flush memory to Zync
          localRdData( 6)            <=  Mon.HP.HP(5).MDT_DT2R.SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(147)( 7);                             --freeze memory
          localRdData(10 downto  8)  <=  reg_data(147)(10 downto  8);                   --sel memory
        when 149 => --0x95
          localRdData( 9 downto  0)  <=  reg_data(149)( 9 downto  0);                   --wr_Address
          localRdData(25 downto 16)  <=  reg_data(149)(25 downto 16);                   --rd_Address
        when 150 => --0x96
          localRdData( 8 downto  0)  <=  reg_data(150)( 8 downto  0);                   --Write Data 0
        when 152 => --0x98
          localRdData( 8 downto  0)  <=  Mon.HP.HP(5).MDT_DT2R.rd_data.rd_data_0;       --Read Data 0


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
  Ctrl.SUPER.CONFIGS.INPUT_EN                <=  reg_data( 1)( 0);                
  Ctrl.SUPER.CONFIGS.OUTPUT_EN               <=  reg_data( 1)( 1);                
  Ctrl.SUPER.CONFIGS.FLUSH_MEM_RESET         <=  reg_data( 1)( 2);                
  Ctrl.CTRL.ROI_TC.SIGNALS.flush_req         <=  reg_data(48)( 5);                
  Ctrl.CTRL.ROI_TC.SIGNALS.freeze_req        <=  reg_data(48)( 7);                
  Ctrl.CTRL.ROI_TC.SIGNALS.mem_sel           <=  reg_data(48)(10 downto  8);      
  Ctrl.CTRL.ROI_TC.wr_addr                   <=  reg_data(50)( 9 downto  0);      
  Ctrl.CTRL.ROI_TC.rd_addr                   <=  reg_data(50)(25 downto 16);      
  Ctrl.CTRL.ROI_TC.wr_data.wr_data_0         <=  reg_data(51)(31 downto  0);      
  Ctrl.CTRL.ROI_TC.wr_data.wr_data_1         <=  reg_data(52)( 5 downto  0);      
  Ctrl.HP.HP(0).CONFIGS.INPUT_EN             <=  reg_data(65)( 0);                
  Ctrl.HP.HP(0).CONFIGS.OUTPUT_EN            <=  reg_data(65)( 1);                
  Ctrl.HP.HP(0).CONFIGS.FLUSH_MEM_RESET      <=  reg_data(65)( 2);                
  Ctrl.HP.HP(0).MDT_DT2R.SIGNALS.flush_req   <=  reg_data(67)( 5);                
  Ctrl.HP.HP(0).MDT_DT2R.SIGNALS.freeze_req  <=  reg_data(67)( 7);                
  Ctrl.HP.HP(0).MDT_DT2R.SIGNALS.mem_sel     <=  reg_data(67)(10 downto  8);      
  Ctrl.HP.HP(0).MDT_DT2R.wr_addr             <=  reg_data(69)( 9 downto  0);      
  Ctrl.HP.HP(0).MDT_DT2R.rd_addr             <=  reg_data(69)(25 downto 16);      
  Ctrl.HP.HP(0).MDT_DT2R.wr_data.wr_data_0   <=  reg_data(70)( 8 downto  0);      
  Ctrl.HP.HP(1).CONFIGS.INPUT_EN             <=  reg_data(81)( 0);                
  Ctrl.HP.HP(1).CONFIGS.OUTPUT_EN            <=  reg_data(81)( 1);                
  Ctrl.HP.HP(1).CONFIGS.FLUSH_MEM_RESET      <=  reg_data(81)( 2);                
  Ctrl.HP.HP(1).MDT_DT2R.SIGNALS.flush_req   <=  reg_data(83)( 5);                
  Ctrl.HP.HP(1).MDT_DT2R.SIGNALS.freeze_req  <=  reg_data(83)( 7);                
  Ctrl.HP.HP(1).MDT_DT2R.SIGNALS.mem_sel     <=  reg_data(83)(10 downto  8);      
  Ctrl.HP.HP(1).MDT_DT2R.wr_addr             <=  reg_data(85)( 9 downto  0);      
  Ctrl.HP.HP(1).MDT_DT2R.rd_addr             <=  reg_data(85)(25 downto 16);      
  Ctrl.HP.HP(1).MDT_DT2R.wr_data.wr_data_0   <=  reg_data(86)( 8 downto  0);      
  Ctrl.HP.HP(2).CONFIGS.INPUT_EN             <=  reg_data(97)( 0);                
  Ctrl.HP.HP(2).CONFIGS.OUTPUT_EN            <=  reg_data(97)( 1);                
  Ctrl.HP.HP(2).CONFIGS.FLUSH_MEM_RESET      <=  reg_data(97)( 2);                
  Ctrl.HP.HP(2).MDT_DT2R.SIGNALS.flush_req   <=  reg_data(99)( 5);                
  Ctrl.HP.HP(2).MDT_DT2R.SIGNALS.freeze_req  <=  reg_data(99)( 7);                
  Ctrl.HP.HP(2).MDT_DT2R.SIGNALS.mem_sel     <=  reg_data(99)(10 downto  8);      
  Ctrl.HP.HP(2).MDT_DT2R.wr_addr             <=  reg_data(101)( 9 downto  0);     
  Ctrl.HP.HP(2).MDT_DT2R.rd_addr             <=  reg_data(101)(25 downto 16);     
  Ctrl.HP.HP(2).MDT_DT2R.wr_data.wr_data_0   <=  reg_data(102)( 8 downto  0);     
  Ctrl.HP.HP(3).CONFIGS.INPUT_EN             <=  reg_data(113)( 0);               
  Ctrl.HP.HP(3).CONFIGS.OUTPUT_EN            <=  reg_data(113)( 1);               
  Ctrl.HP.HP(3).CONFIGS.FLUSH_MEM_RESET      <=  reg_data(113)( 2);               
  Ctrl.HP.HP(3).MDT_DT2R.SIGNALS.flush_req   <=  reg_data(115)( 5);               
  Ctrl.HP.HP(3).MDT_DT2R.SIGNALS.freeze_req  <=  reg_data(115)( 7);               
  Ctrl.HP.HP(3).MDT_DT2R.SIGNALS.mem_sel     <=  reg_data(115)(10 downto  8);     
  Ctrl.HP.HP(3).MDT_DT2R.wr_addr             <=  reg_data(117)( 9 downto  0);     
  Ctrl.HP.HP(3).MDT_DT2R.rd_addr             <=  reg_data(117)(25 downto 16);     
  Ctrl.HP.HP(3).MDT_DT2R.wr_data.wr_data_0   <=  reg_data(118)( 8 downto  0);     
  Ctrl.HP.HP(4).CONFIGS.INPUT_EN             <=  reg_data(129)( 0);               
  Ctrl.HP.HP(4).CONFIGS.OUTPUT_EN            <=  reg_data(129)( 1);               
  Ctrl.HP.HP(4).CONFIGS.FLUSH_MEM_RESET      <=  reg_data(129)( 2);               
  Ctrl.HP.HP(4).MDT_DT2R.SIGNALS.flush_req   <=  reg_data(131)( 5);               
  Ctrl.HP.HP(4).MDT_DT2R.SIGNALS.freeze_req  <=  reg_data(131)( 7);               
  Ctrl.HP.HP(4).MDT_DT2R.SIGNALS.mem_sel     <=  reg_data(131)(10 downto  8);     
  Ctrl.HP.HP(4).MDT_DT2R.wr_addr             <=  reg_data(133)( 9 downto  0);     
  Ctrl.HP.HP(4).MDT_DT2R.rd_addr             <=  reg_data(133)(25 downto 16);     
  Ctrl.HP.HP(4).MDT_DT2R.wr_data.wr_data_0   <=  reg_data(134)( 8 downto  0);     
  Ctrl.HP.HP(5).CONFIGS.INPUT_EN             <=  reg_data(145)( 0);               
  Ctrl.HP.HP(5).CONFIGS.OUTPUT_EN            <=  reg_data(145)( 1);               
  Ctrl.HP.HP(5).CONFIGS.FLUSH_MEM_RESET      <=  reg_data(145)( 2);               
  Ctrl.HP.HP(5).MDT_DT2R.SIGNALS.flush_req   <=  reg_data(147)( 5);               
  Ctrl.HP.HP(5).MDT_DT2R.SIGNALS.freeze_req  <=  reg_data(147)( 7);               
  Ctrl.HP.HP(5).MDT_DT2R.SIGNALS.mem_sel     <=  reg_data(147)(10 downto  8);     
  Ctrl.HP.HP(5).MDT_DT2R.wr_addr             <=  reg_data(149)( 9 downto  0);     
  Ctrl.HP.HP(5).MDT_DT2R.rd_addr             <=  reg_data(149)(25 downto 16);     
  Ctrl.HP.HP(5).MDT_DT2R.wr_data.wr_data_0   <=  reg_data(150)( 8 downto  0);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 0)( 0)  <= DEFAULT_HEG_CTRL_t.SUPER.ACTIONS.RESET;
      reg_data( 0)( 1)  <= DEFAULT_HEG_CTRL_t.SUPER.ACTIONS.ENABLE;
      reg_data( 0)( 2)  <= DEFAULT_HEG_CTRL_t.SUPER.ACTIONS.DISABLE;
      reg_data( 0)( 3)  <= DEFAULT_HEG_CTRL_t.SUPER.ACTIONS.FREEZE;
      reg_data( 1)( 0)  <= DEFAULT_HEG_CTRL_t.SUPER.CONFIGS.INPUT_EN;
      reg_data( 1)( 1)  <= DEFAULT_HEG_CTRL_t.SUPER.CONFIGS.OUTPUT_EN;
      reg_data( 1)( 2)  <= DEFAULT_HEG_CTRL_t.SUPER.CONFIGS.FLUSH_MEM_RESET;
      reg_data(48)( 0)  <= DEFAULT_HEG_CTRL_t.CTRL.ROI_TC.SIGNALS.wr_req;
      reg_data(48)( 1)  <= DEFAULT_HEG_CTRL_t.CTRL.ROI_TC.SIGNALS.wr_ack;
      reg_data(48)( 2)  <= DEFAULT_HEG_CTRL_t.CTRL.ROI_TC.SIGNALS.rd_req;
      reg_data(48)( 3)  <= DEFAULT_HEG_CTRL_t.CTRL.ROI_TC.SIGNALS.rd_ack;
      reg_data(48)( 5)  <= DEFAULT_HEG_CTRL_t.CTRL.ROI_TC.SIGNALS.flush_req;
      reg_data(48)( 7)  <= DEFAULT_HEG_CTRL_t.CTRL.ROI_TC.SIGNALS.freeze_req;
      reg_data(48)(10 downto  8)  <= DEFAULT_HEG_CTRL_t.CTRL.ROI_TC.SIGNALS.mem_sel;
      reg_data(50)( 9 downto  0)  <= DEFAULT_HEG_CTRL_t.CTRL.ROI_TC.wr_addr;
      reg_data(50)(25 downto 16)  <= DEFAULT_HEG_CTRL_t.CTRL.ROI_TC.rd_addr;
      reg_data(51)(31 downto  0)  <= DEFAULT_HEG_CTRL_t.CTRL.ROI_TC.wr_data.wr_data_0;
      reg_data(52)( 5 downto  0)  <= DEFAULT_HEG_CTRL_t.CTRL.ROI_TC.wr_data.wr_data_1;
      reg_data(64)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).ACTIONS.RESET;
      reg_data(64)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).ACTIONS.ENABLE;
      reg_data(64)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).ACTIONS.DISABLE;
      reg_data(64)( 3)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).ACTIONS.FREEZE;
      reg_data(65)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).CONFIGS.INPUT_EN;
      reg_data(65)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).CONFIGS.OUTPUT_EN;
      reg_data(65)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).CONFIGS.FLUSH_MEM_RESET;
      reg_data(67)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).MDT_DT2R.SIGNALS.wr_req;
      reg_data(67)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).MDT_DT2R.SIGNALS.wr_ack;
      reg_data(67)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).MDT_DT2R.SIGNALS.rd_req;
      reg_data(67)( 3)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).MDT_DT2R.SIGNALS.rd_ack;
      reg_data(67)( 5)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).MDT_DT2R.SIGNALS.flush_req;
      reg_data(67)( 7)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).MDT_DT2R.SIGNALS.freeze_req;
      reg_data(67)(10 downto  8)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).MDT_DT2R.SIGNALS.mem_sel;
      reg_data(69)( 9 downto  0)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).MDT_DT2R.wr_addr;
      reg_data(69)(25 downto 16)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).MDT_DT2R.rd_addr;
      reg_data(70)( 8 downto  0)  <= DEFAULT_HEG_CTRL_t.HP.HP(0).MDT_DT2R.wr_data.wr_data_0;
      reg_data(80)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).ACTIONS.RESET;
      reg_data(80)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).ACTIONS.ENABLE;
      reg_data(80)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).ACTIONS.DISABLE;
      reg_data(80)( 3)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).ACTIONS.FREEZE;
      reg_data(81)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).CONFIGS.INPUT_EN;
      reg_data(81)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).CONFIGS.OUTPUT_EN;
      reg_data(81)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).CONFIGS.FLUSH_MEM_RESET;
      reg_data(83)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).MDT_DT2R.SIGNALS.wr_req;
      reg_data(83)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).MDT_DT2R.SIGNALS.wr_ack;
      reg_data(83)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).MDT_DT2R.SIGNALS.rd_req;
      reg_data(83)( 3)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).MDT_DT2R.SIGNALS.rd_ack;
      reg_data(83)( 5)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).MDT_DT2R.SIGNALS.flush_req;
      reg_data(83)( 7)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).MDT_DT2R.SIGNALS.freeze_req;
      reg_data(83)(10 downto  8)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).MDT_DT2R.SIGNALS.mem_sel;
      reg_data(85)( 9 downto  0)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).MDT_DT2R.wr_addr;
      reg_data(85)(25 downto 16)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).MDT_DT2R.rd_addr;
      reg_data(86)( 8 downto  0)  <= DEFAULT_HEG_CTRL_t.HP.HP(1).MDT_DT2R.wr_data.wr_data_0;
      reg_data(96)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).ACTIONS.RESET;
      reg_data(96)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).ACTIONS.ENABLE;
      reg_data(96)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).ACTIONS.DISABLE;
      reg_data(96)( 3)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).ACTIONS.FREEZE;
      reg_data(97)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).CONFIGS.INPUT_EN;
      reg_data(97)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).CONFIGS.OUTPUT_EN;
      reg_data(97)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).CONFIGS.FLUSH_MEM_RESET;
      reg_data(99)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).MDT_DT2R.SIGNALS.wr_req;
      reg_data(99)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).MDT_DT2R.SIGNALS.wr_ack;
      reg_data(99)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).MDT_DT2R.SIGNALS.rd_req;
      reg_data(99)( 3)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).MDT_DT2R.SIGNALS.rd_ack;
      reg_data(99)( 5)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).MDT_DT2R.SIGNALS.flush_req;
      reg_data(99)( 7)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).MDT_DT2R.SIGNALS.freeze_req;
      reg_data(99)(10 downto  8)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).MDT_DT2R.SIGNALS.mem_sel;
      reg_data(101)( 9 downto  0)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).MDT_DT2R.wr_addr;
      reg_data(101)(25 downto 16)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).MDT_DT2R.rd_addr;
      reg_data(102)( 8 downto  0)  <= DEFAULT_HEG_CTRL_t.HP.HP(2).MDT_DT2R.wr_data.wr_data_0;
      reg_data(112)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).ACTIONS.RESET;
      reg_data(112)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).ACTIONS.ENABLE;
      reg_data(112)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).ACTIONS.DISABLE;
      reg_data(112)( 3)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).ACTIONS.FREEZE;
      reg_data(113)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).CONFIGS.INPUT_EN;
      reg_data(113)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).CONFIGS.OUTPUT_EN;
      reg_data(113)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).CONFIGS.FLUSH_MEM_RESET;
      reg_data(115)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).MDT_DT2R.SIGNALS.wr_req;
      reg_data(115)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).MDT_DT2R.SIGNALS.wr_ack;
      reg_data(115)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).MDT_DT2R.SIGNALS.rd_req;
      reg_data(115)( 3)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).MDT_DT2R.SIGNALS.rd_ack;
      reg_data(115)( 5)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).MDT_DT2R.SIGNALS.flush_req;
      reg_data(115)( 7)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).MDT_DT2R.SIGNALS.freeze_req;
      reg_data(115)(10 downto  8)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).MDT_DT2R.SIGNALS.mem_sel;
      reg_data(117)( 9 downto  0)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).MDT_DT2R.wr_addr;
      reg_data(117)(25 downto 16)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).MDT_DT2R.rd_addr;
      reg_data(118)( 8 downto  0)  <= DEFAULT_HEG_CTRL_t.HP.HP(3).MDT_DT2R.wr_data.wr_data_0;
      reg_data(128)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).ACTIONS.RESET;
      reg_data(128)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).ACTIONS.ENABLE;
      reg_data(128)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).ACTIONS.DISABLE;
      reg_data(128)( 3)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).ACTIONS.FREEZE;
      reg_data(129)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).CONFIGS.INPUT_EN;
      reg_data(129)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).CONFIGS.OUTPUT_EN;
      reg_data(129)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).CONFIGS.FLUSH_MEM_RESET;
      reg_data(131)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).MDT_DT2R.SIGNALS.wr_req;
      reg_data(131)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).MDT_DT2R.SIGNALS.wr_ack;
      reg_data(131)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).MDT_DT2R.SIGNALS.rd_req;
      reg_data(131)( 3)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).MDT_DT2R.SIGNALS.rd_ack;
      reg_data(131)( 5)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).MDT_DT2R.SIGNALS.flush_req;
      reg_data(131)( 7)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).MDT_DT2R.SIGNALS.freeze_req;
      reg_data(131)(10 downto  8)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).MDT_DT2R.SIGNALS.mem_sel;
      reg_data(133)( 9 downto  0)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).MDT_DT2R.wr_addr;
      reg_data(133)(25 downto 16)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).MDT_DT2R.rd_addr;
      reg_data(134)( 8 downto  0)  <= DEFAULT_HEG_CTRL_t.HP.HP(4).MDT_DT2R.wr_data.wr_data_0;
      reg_data(144)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).ACTIONS.RESET;
      reg_data(144)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).ACTIONS.ENABLE;
      reg_data(144)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).ACTIONS.DISABLE;
      reg_data(144)( 3)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).ACTIONS.FREEZE;
      reg_data(145)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).CONFIGS.INPUT_EN;
      reg_data(145)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).CONFIGS.OUTPUT_EN;
      reg_data(145)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).CONFIGS.FLUSH_MEM_RESET;
      reg_data(147)( 0)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).MDT_DT2R.SIGNALS.wr_req;
      reg_data(147)( 1)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).MDT_DT2R.SIGNALS.wr_ack;
      reg_data(147)( 2)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).MDT_DT2R.SIGNALS.rd_req;
      reg_data(147)( 3)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).MDT_DT2R.SIGNALS.rd_ack;
      reg_data(147)( 5)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).MDT_DT2R.SIGNALS.flush_req;
      reg_data(147)( 7)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).MDT_DT2R.SIGNALS.freeze_req;
      reg_data(147)(10 downto  8)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).MDT_DT2R.SIGNALS.mem_sel;
      reg_data(149)( 9 downto  0)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).MDT_DT2R.wr_addr;
      reg_data(149)(25 downto 16)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).MDT_DT2R.rd_addr;
      reg_data(150)( 8 downto  0)  <= DEFAULT_HEG_CTRL_t.HP.HP(5).MDT_DT2R.wr_data.wr_data_0;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.SUPER.ACTIONS.RESET <= '0';
      Ctrl.SUPER.ACTIONS.ENABLE <= '0';
      Ctrl.SUPER.ACTIONS.DISABLE <= '0';
      Ctrl.SUPER.ACTIONS.FREEZE <= '0';
      Ctrl.CTRL.ROI_TC.SIGNALS.wr_req <= '0';
      Ctrl.CTRL.ROI_TC.SIGNALS.wr_ack <= '0';
      Ctrl.CTRL.ROI_TC.SIGNALS.rd_req <= '0';
      Ctrl.CTRL.ROI_TC.SIGNALS.rd_ack <= '0';
      Ctrl.HP.HP(0).ACTIONS.RESET <= '0';
      Ctrl.HP.HP(0).ACTIONS.ENABLE <= '0';
      Ctrl.HP.HP(0).ACTIONS.DISABLE <= '0';
      Ctrl.HP.HP(0).ACTIONS.FREEZE <= '0';
      Ctrl.HP.HP(0).MDT_DT2R.SIGNALS.wr_req <= '0';
      Ctrl.HP.HP(0).MDT_DT2R.SIGNALS.wr_ack <= '0';
      Ctrl.HP.HP(0).MDT_DT2R.SIGNALS.rd_req <= '0';
      Ctrl.HP.HP(0).MDT_DT2R.SIGNALS.rd_ack <= '0';
      Ctrl.HP.HP(1).ACTIONS.RESET <= '0';
      Ctrl.HP.HP(1).ACTIONS.ENABLE <= '0';
      Ctrl.HP.HP(1).ACTIONS.DISABLE <= '0';
      Ctrl.HP.HP(1).ACTIONS.FREEZE <= '0';
      Ctrl.HP.HP(1).MDT_DT2R.SIGNALS.wr_req <= '0';
      Ctrl.HP.HP(1).MDT_DT2R.SIGNALS.wr_ack <= '0';
      Ctrl.HP.HP(1).MDT_DT2R.SIGNALS.rd_req <= '0';
      Ctrl.HP.HP(1).MDT_DT2R.SIGNALS.rd_ack <= '0';
      Ctrl.HP.HP(2).ACTIONS.RESET <= '0';
      Ctrl.HP.HP(2).ACTIONS.ENABLE <= '0';
      Ctrl.HP.HP(2).ACTIONS.DISABLE <= '0';
      Ctrl.HP.HP(2).ACTIONS.FREEZE <= '0';
      Ctrl.HP.HP(2).MDT_DT2R.SIGNALS.wr_req <= '0';
      Ctrl.HP.HP(2).MDT_DT2R.SIGNALS.wr_ack <= '0';
      Ctrl.HP.HP(2).MDT_DT2R.SIGNALS.rd_req <= '0';
      Ctrl.HP.HP(2).MDT_DT2R.SIGNALS.rd_ack <= '0';
      Ctrl.HP.HP(3).ACTIONS.RESET <= '0';
      Ctrl.HP.HP(3).ACTIONS.ENABLE <= '0';
      Ctrl.HP.HP(3).ACTIONS.DISABLE <= '0';
      Ctrl.HP.HP(3).ACTIONS.FREEZE <= '0';
      Ctrl.HP.HP(3).MDT_DT2R.SIGNALS.wr_req <= '0';
      Ctrl.HP.HP(3).MDT_DT2R.SIGNALS.wr_ack <= '0';
      Ctrl.HP.HP(3).MDT_DT2R.SIGNALS.rd_req <= '0';
      Ctrl.HP.HP(3).MDT_DT2R.SIGNALS.rd_ack <= '0';
      Ctrl.HP.HP(4).ACTIONS.RESET <= '0';
      Ctrl.HP.HP(4).ACTIONS.ENABLE <= '0';
      Ctrl.HP.HP(4).ACTIONS.DISABLE <= '0';
      Ctrl.HP.HP(4).ACTIONS.FREEZE <= '0';
      Ctrl.HP.HP(4).MDT_DT2R.SIGNALS.wr_req <= '0';
      Ctrl.HP.HP(4).MDT_DT2R.SIGNALS.wr_ack <= '0';
      Ctrl.HP.HP(4).MDT_DT2R.SIGNALS.rd_req <= '0';
      Ctrl.HP.HP(4).MDT_DT2R.SIGNALS.rd_ack <= '0';
      Ctrl.HP.HP(5).ACTIONS.RESET <= '0';
      Ctrl.HP.HP(5).ACTIONS.ENABLE <= '0';
      Ctrl.HP.HP(5).ACTIONS.DISABLE <= '0';
      Ctrl.HP.HP(5).ACTIONS.FREEZE <= '0';
      Ctrl.HP.HP(5).MDT_DT2R.SIGNALS.wr_req <= '0';
      Ctrl.HP.HP(5).MDT_DT2R.SIGNALS.wr_ack <= '0';
      Ctrl.HP.HP(5).MDT_DT2R.SIGNALS.rd_req <= '0';
      Ctrl.HP.HP(5).MDT_DT2R.SIGNALS.rd_ack <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(7 downto 0))) is
        when 0 => --0x0
          Ctrl.SUPER.ACTIONS.RESET               <=  localWrData( 0);               
          Ctrl.SUPER.ACTIONS.ENABLE              <=  localWrData( 1);               
          Ctrl.SUPER.ACTIONS.DISABLE             <=  localWrData( 2);               
          Ctrl.SUPER.ACTIONS.FREEZE              <=  localWrData( 3);               
        when 1 => --0x1
          reg_data( 1)( 0)                       <=  localWrData( 0);                --
          reg_data( 1)( 1)                       <=  localWrData( 1);                --
          reg_data( 1)( 2)                       <=  localWrData( 2);                --
        when 48 => --0x30
          Ctrl.CTRL.ROI_TC.SIGNALS.wr_req        <=  localWrData( 0);               
          Ctrl.CTRL.ROI_TC.SIGNALS.wr_ack        <=  localWrData( 1);               
          Ctrl.CTRL.ROI_TC.SIGNALS.rd_req        <=  localWrData( 2);               
          Ctrl.CTRL.ROI_TC.SIGNALS.rd_ack        <=  localWrData( 3);               
          reg_data(48)( 5)                       <=  localWrData( 5);                --flush memory to Zync
          reg_data(48)( 7)                       <=  localWrData( 7);                --freeze memory
          reg_data(48)(10 downto  8)             <=  localWrData(10 downto  8);      --sel memory
        when 50 => --0x32
          reg_data(50)( 9 downto  0)             <=  localWrData( 9 downto  0);      --wr_Address
          reg_data(50)(25 downto 16)             <=  localWrData(25 downto 16);      --rd_Address
        when 51 => --0x33
          reg_data(51)(31 downto  0)             <=  localWrData(31 downto  0);      --Write Data 0
        when 52 => --0x34
          reg_data(52)( 5 downto  0)             <=  localWrData( 5 downto  0);      --Write Data 1
        when 64 => --0x40
          Ctrl.HP.HP(0).ACTIONS.RESET            <=  localWrData( 0);               
          Ctrl.HP.HP(0).ACTIONS.ENABLE           <=  localWrData( 1);               
          Ctrl.HP.HP(0).ACTIONS.DISABLE          <=  localWrData( 2);               
          Ctrl.HP.HP(0).ACTIONS.FREEZE           <=  localWrData( 3);               
        when 65 => --0x41
          reg_data(65)( 0)                       <=  localWrData( 0);                --
          reg_data(65)( 1)                       <=  localWrData( 1);                --
          reg_data(65)( 2)                       <=  localWrData( 2);                --
        when 67 => --0x43
          Ctrl.HP.HP(0).MDT_DT2R.SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.HP.HP(0).MDT_DT2R.SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.HP.HP(0).MDT_DT2R.SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.HP.HP(0).MDT_DT2R.SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(67)( 5)                       <=  localWrData( 5);                --flush memory to Zync
          reg_data(67)( 7)                       <=  localWrData( 7);                --freeze memory
          reg_data(67)(10 downto  8)             <=  localWrData(10 downto  8);      --sel memory
        when 69 => --0x45
          reg_data(69)( 9 downto  0)             <=  localWrData( 9 downto  0);      --wr_Address
          reg_data(69)(25 downto 16)             <=  localWrData(25 downto 16);      --rd_Address
        when 70 => --0x46
          reg_data(70)( 8 downto  0)             <=  localWrData( 8 downto  0);      --Write Data 0
        when 80 => --0x50
          Ctrl.HP.HP(1).ACTIONS.RESET            <=  localWrData( 0);               
          Ctrl.HP.HP(1).ACTIONS.ENABLE           <=  localWrData( 1);               
          Ctrl.HP.HP(1).ACTIONS.DISABLE          <=  localWrData( 2);               
          Ctrl.HP.HP(1).ACTIONS.FREEZE           <=  localWrData( 3);               
        when 81 => --0x51
          reg_data(81)( 0)                       <=  localWrData( 0);                --
          reg_data(81)( 1)                       <=  localWrData( 1);                --
          reg_data(81)( 2)                       <=  localWrData( 2);                --
        when 83 => --0x53
          Ctrl.HP.HP(1).MDT_DT2R.SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.HP.HP(1).MDT_DT2R.SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.HP.HP(1).MDT_DT2R.SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.HP.HP(1).MDT_DT2R.SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(83)( 5)                       <=  localWrData( 5);                --flush memory to Zync
          reg_data(83)( 7)                       <=  localWrData( 7);                --freeze memory
          reg_data(83)(10 downto  8)             <=  localWrData(10 downto  8);      --sel memory
        when 85 => --0x55
          reg_data(85)( 9 downto  0)             <=  localWrData( 9 downto  0);      --wr_Address
          reg_data(85)(25 downto 16)             <=  localWrData(25 downto 16);      --rd_Address
        when 86 => --0x56
          reg_data(86)( 8 downto  0)             <=  localWrData( 8 downto  0);      --Write Data 0
        when 96 => --0x60
          Ctrl.HP.HP(2).ACTIONS.RESET            <=  localWrData( 0);               
          Ctrl.HP.HP(2).ACTIONS.ENABLE           <=  localWrData( 1);               
          Ctrl.HP.HP(2).ACTIONS.DISABLE          <=  localWrData( 2);               
          Ctrl.HP.HP(2).ACTIONS.FREEZE           <=  localWrData( 3);               
        when 97 => --0x61
          reg_data(97)( 0)                       <=  localWrData( 0);                --
          reg_data(97)( 1)                       <=  localWrData( 1);                --
          reg_data(97)( 2)                       <=  localWrData( 2);                --
        when 99 => --0x63
          Ctrl.HP.HP(2).MDT_DT2R.SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.HP.HP(2).MDT_DT2R.SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.HP.HP(2).MDT_DT2R.SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.HP.HP(2).MDT_DT2R.SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(99)( 5)                       <=  localWrData( 5);                --flush memory to Zync
          reg_data(99)( 7)                       <=  localWrData( 7);                --freeze memory
          reg_data(99)(10 downto  8)             <=  localWrData(10 downto  8);      --sel memory
        when 101 => --0x65
          reg_data(101)( 9 downto  0)            <=  localWrData( 9 downto  0);      --wr_Address
          reg_data(101)(25 downto 16)            <=  localWrData(25 downto 16);      --rd_Address
        when 102 => --0x66
          reg_data(102)( 8 downto  0)            <=  localWrData( 8 downto  0);      --Write Data 0
        when 112 => --0x70
          Ctrl.HP.HP(3).ACTIONS.RESET            <=  localWrData( 0);               
          Ctrl.HP.HP(3).ACTIONS.ENABLE           <=  localWrData( 1);               
          Ctrl.HP.HP(3).ACTIONS.DISABLE          <=  localWrData( 2);               
          Ctrl.HP.HP(3).ACTIONS.FREEZE           <=  localWrData( 3);               
        when 113 => --0x71
          reg_data(113)( 0)                      <=  localWrData( 0);                --
          reg_data(113)( 1)                      <=  localWrData( 1);                --
          reg_data(113)( 2)                      <=  localWrData( 2);                --
        when 115 => --0x73
          Ctrl.HP.HP(3).MDT_DT2R.SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.HP.HP(3).MDT_DT2R.SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.HP.HP(3).MDT_DT2R.SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.HP.HP(3).MDT_DT2R.SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(115)( 5)                      <=  localWrData( 5);                --flush memory to Zync
          reg_data(115)( 7)                      <=  localWrData( 7);                --freeze memory
          reg_data(115)(10 downto  8)            <=  localWrData(10 downto  8);      --sel memory
        when 117 => --0x75
          reg_data(117)( 9 downto  0)            <=  localWrData( 9 downto  0);      --wr_Address
          reg_data(117)(25 downto 16)            <=  localWrData(25 downto 16);      --rd_Address
        when 118 => --0x76
          reg_data(118)( 8 downto  0)            <=  localWrData( 8 downto  0);      --Write Data 0
        when 128 => --0x80
          Ctrl.HP.HP(4).ACTIONS.RESET            <=  localWrData( 0);               
          Ctrl.HP.HP(4).ACTIONS.ENABLE           <=  localWrData( 1);               
          Ctrl.HP.HP(4).ACTIONS.DISABLE          <=  localWrData( 2);               
          Ctrl.HP.HP(4).ACTIONS.FREEZE           <=  localWrData( 3);               
        when 129 => --0x81
          reg_data(129)( 0)                      <=  localWrData( 0);                --
          reg_data(129)( 1)                      <=  localWrData( 1);                --
          reg_data(129)( 2)                      <=  localWrData( 2);                --
        when 131 => --0x83
          Ctrl.HP.HP(4).MDT_DT2R.SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.HP.HP(4).MDT_DT2R.SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.HP.HP(4).MDT_DT2R.SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.HP.HP(4).MDT_DT2R.SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(131)( 5)                      <=  localWrData( 5);                --flush memory to Zync
          reg_data(131)( 7)                      <=  localWrData( 7);                --freeze memory
          reg_data(131)(10 downto  8)            <=  localWrData(10 downto  8);      --sel memory
        when 133 => --0x85
          reg_data(133)( 9 downto  0)            <=  localWrData( 9 downto  0);      --wr_Address
          reg_data(133)(25 downto 16)            <=  localWrData(25 downto 16);      --rd_Address
        when 134 => --0x86
          reg_data(134)( 8 downto  0)            <=  localWrData( 8 downto  0);      --Write Data 0
        when 144 => --0x90
          Ctrl.HP.HP(5).ACTIONS.RESET            <=  localWrData( 0);               
          Ctrl.HP.HP(5).ACTIONS.ENABLE           <=  localWrData( 1);               
          Ctrl.HP.HP(5).ACTIONS.DISABLE          <=  localWrData( 2);               
          Ctrl.HP.HP(5).ACTIONS.FREEZE           <=  localWrData( 3);               
        when 145 => --0x91
          reg_data(145)( 0)                      <=  localWrData( 0);                --
          reg_data(145)( 1)                      <=  localWrData( 1);                --
          reg_data(145)( 2)                      <=  localWrData( 2);                --
        when 147 => --0x93
          Ctrl.HP.HP(5).MDT_DT2R.SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.HP.HP(5).MDT_DT2R.SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.HP.HP(5).MDT_DT2R.SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.HP.HP(5).MDT_DT2R.SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(147)( 5)                      <=  localWrData( 5);                --flush memory to Zync
          reg_data(147)( 7)                      <=  localWrData( 7);                --freeze memory
          reg_data(147)(10 downto  8)            <=  localWrData(10 downto  8);      --sel memory
        when 149 => --0x95
          reg_data(149)( 9 downto  0)            <=  localWrData( 9 downto  0);      --wr_Address
          reg_data(149)(25 downto 16)            <=  localWrData(25 downto 16);      --rd_Address
        when 150 => --0x96
          reg_data(150)( 8 downto  0)            <=  localWrData( 8 downto  0);      --Write Data 0

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;







  
end architecture behavioral;