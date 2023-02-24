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
use work.C2C_INTF_Ctrl.all;
use work.C2C_INTF_Ctrl_DEF.all;
entity C2C_INTF_map is
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
    
    Mon              : in  C2C_INTF_Mon_t;
    
    
    Ctrl             : out C2C_INTF_Ctrl_t
        
    );
end entity C2C_INTF_map;
architecture behavioral of C2C_INTF_map is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;

  
  constant BRAM_COUNT       : integer := 1;
--  signal latchBRAM          : std_logic_vector(BRAM_COUNT-1 downto 0);
--  signal delayLatchBRAM          : std_logic_vector(BRAM_COUNT-1 downto 0);
  constant BRAM_range       : int_array_t(0 to BRAM_COUNT-1) := (0 => 10);
  constant BRAM_addr        : slv32_array_t(0 to BRAM_COUNT-1) := (0 => x"00000000");
  signal BRAM_MOSI          : BRAMPortMOSI_array_t(0 to BRAM_COUNT-1);
  signal BRAM_MISO          : BRAMPortMISO_array_t(0 to BRAM_COUNT-1);
  
  
  signal reg_data :  slv32_array_t(integer range 0 to 1061);
  constant Default_reg_data : slv32_array_t(integer range 0 to 1061) := (others => x"00000000");
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
        case to_integer(unsigned(localAddress(10 downto 0))) is
          
        when 1024 => --0x400
          localRdData( 0)            <=  Mon.STATUS.CONFIG_ERROR;                    --C2C config error
          localRdData( 1)            <=  Mon.STATUS.LINK_ERROR;                      --C2C link error
          localRdData( 2)            <=  Mon.STATUS.LINK_GOOD;                       --C2C link FSM in SYNC
          localRdData( 3)            <=  Mon.STATUS.MB_ERROR;                        --C2C multi-bit error
          localRdData( 4)            <=  Mon.STATUS.DO_CC;                           --Aurora do CC
          localRdData( 5)            <=  reg_data(1024)( 5);                         --C2C initialize
          localRdData( 8)            <=  Mon.STATUS.PHY_RESET;                       --Aurora phy in reset
          localRdData( 9)            <=  Mon.STATUS.PHY_GT_PLL_LOCK;                 --Aurora phy GT PLL locked
          localRdData(10)            <=  Mon.STATUS.PHY_MMCM_LOL;                    --Aurora phy mmcm LOL
          localRdData(12)            <=  Mon.STATUS.PHY_LANE_UP;                     --Aurora phy lanes up
          localRdData(16)            <=  Mon.STATUS.PHY_HARD_ERR;                    --Aurora phy hard error
          localRdData(17)            <=  Mon.STATUS.PHY_SOFT_ERR;                    --Aurora phy soft error
          localRdData(18)            <=  Mon.STATUS.CHANNEL_UP;                      --Channel up
          localRdData(31)            <=  Mon.STATUS.LINK_IN_FW;                      --FW includes this link
        when 1028 => --0x404
          localRdData(15 downto  0)  <=  Mon.DEBUG.DMONITOR;                         --DEBUG d monitor
          localRdData(16)            <=  Mon.DEBUG.QPLL_LOCK;                        --DEBUG cplllock
          localRdData(20)            <=  Mon.DEBUG.CPLL_LOCK;                        --DEBUG cplllock
          localRdData(21)            <=  Mon.DEBUG.EYESCAN_DATA_ERROR;               --DEBUG eyescan data error
          localRdData(23)            <=  reg_data(1028)(23);                         --DEBUG eyescan trigger
        when 1029 => --0x405
          localRdData(15 downto  0)  <=  reg_data(1029)(15 downto  0);               --bit 2 is DRP uber reset
        when 1030 => --0x406
          localRdData( 2 downto  0)  <=  Mon.DEBUG.RX.BUF_STATUS;                    --DEBUG rx buf status
          localRdData( 5)            <=  Mon.DEBUG.RX.PMA_RESET_DONE;                --DEBUG rx reset done
          localRdData(10)            <=  Mon.DEBUG.RX.PRBS_ERR;                      --DEBUG rx PRBS error
          localRdData(11)            <=  Mon.DEBUG.RX.RESET_DONE;                    --DEBUG rx reset done
          localRdData(13)            <=  reg_data(1030)(13);                         --DEBUG rx CDR hold
          localRdData(18)            <=  reg_data(1030)(18);                         --DEBUG rx LPM ENABLE
          localRdData(25)            <=  reg_data(1030)(25);                         --DEBUG rx PRBS counter reset
          localRdData(29 downto 26)  <=  reg_data(1030)(29 downto 26);               --DEBUG rx PRBS select
        when 1031 => --0x407
          localRdData( 2 downto  0)  <=  reg_data(1031)( 2 downto  0);               --DEBUG rx rate
        when 1032 => --0x408
          localRdData( 1 downto  0)  <=  Mon.DEBUG.TX.BUF_STATUS;                    --DEBUG tx buf status
          localRdData( 2)            <=  Mon.DEBUG.TX.RESET_DONE;                    --DEBUG tx reset done
          localRdData( 7)            <=  reg_data(1032)( 7);                         --DEBUG tx inhibit
          localRdData(17)            <=  reg_data(1032)(17);                         --DEBUG tx polarity
          localRdData(22 downto 18)  <=  reg_data(1032)(22 downto 18);               --DEBUG post cursor
          localRdData(23)            <=  reg_data(1032)(23);                         --DEBUG force PRBS error
          localRdData(31 downto 27)  <=  reg_data(1032)(31 downto 27);               --DEBUG pre cursor
        when 1033 => --0x409
          localRdData( 3 downto  0)  <=  reg_data(1033)( 3 downto  0);               --DEBUG PRBS select
          localRdData( 8 downto  4)  <=  reg_data(1033)( 8 downto  4);               --DEBUG tx diff control
        when 1040 => --0x410
          localRdData(31 downto  0)  <=  Mon.COUNTERS.ERRORS_ALL_TIME;               --Counter for all errors while locked
        when 1041 => --0x411
          localRdData(31 downto  0)  <=  Mon.COUNTERS.ERRORS_SINCE_LOCKED;           --Counter for errors since locked
        when 1042 => --0x412
          localRdData(31 downto  0)  <=  Mon.COUNTERS.CONFIG_ERROR_COUNT;            --Counter for CONFIG_ERROR
        when 1043 => --0x413
          localRdData(31 downto  0)  <=  Mon.COUNTERS.LINK_ERROR_COUNT;              --Counter for LINK_ERROR
        when 1044 => --0x414
          localRdData(31 downto  0)  <=  Mon.COUNTERS.MB_ERROR_COUNT;                --Counter for MB_ERROR
        when 1045 => --0x415
          localRdData(31 downto  0)  <=  Mon.COUNTERS.PHY_HARD_ERROR_COUNT;          --Counter for PHY_HARD_ERROR
        when 1046 => --0x416
          localRdData(31 downto  0)  <=  Mon.COUNTERS.PHY_SOFT_ERROR_COUNT;          --Counter for PHY_SOFT_ERROR
        when 1047 => --0x417
          localRdData( 2 downto  0)  <=  Mon.COUNTERS.PHYLANE_STATE;                 --Current state of phy_lane_control module
        when 1049 => --0x419
          localRdData(31 downto  0)  <=  Mon.COUNTERS.ERROR_WAITS_SINCE_LOCKED;      --Count for phylane in error state
        when 1050 => --0x41a
          localRdData(31 downto  0)  <=  Mon.COUNTERS.USER_CLK_FREQ;                 --Frequency of the user C2C clk
        when 1051 => --0x41b
          localRdData(31 downto  0)  <=  Mon.COUNTERS.XCVR_RESETS;                   --Count for phylane in error state
        when 1052 => --0x41c
          localRdData(31 downto  0)  <=  Mon.COUNTERS.WAITING_TIMEOUTS;              --Count of initialize cycles
        when 1053 => --0x41d
          localRdData(31 downto  0)  <=  Mon.COUNTERS.SB_ERROR_RATE;                 --single bit error rate
        when 1054 => --0x41e
          localRdData(31 downto  0)  <=  Mon.COUNTERS.MB_ERROR_RATE;                 --multi bit error rate
        when 1056 => --0x420
          localRdData(31 downto  0)  <=  Mon.USER_FREQ;                              --Measured Freq of clock
        when 1057 => --0x421
          localRdData(23 downto  0)  <=  reg_data(1057)(23 downto  0);               --Time spent waiting for phylane to stabilize
          localRdData(24)            <=  reg_data(1057)(24);                         --phy_lane_control is enabled
        when 1058 => --0x422
          localRdData(19 downto  0)  <=  reg_data(1058)(19 downto  0);               --Contious phy_lane_up signals required to lock phylane control
        when 1059 => --0x423
          localRdData( 7 downto  0)  <=  reg_data(1059)( 7 downto  0);               --Number of failures before we reset the pma
        when 1060 => --0x424
          localRdData(31 downto  0)  <=  reg_data(1060)(31 downto  0);               --Max single bit error rate
        when 1061 => --0x425
          localRdData(31 downto  0)  <=  reg_data(1061)(31 downto  0);               --Max multi bit error rate


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
  Ctrl.STATUS.INITIALIZE              <=  reg_data(1024)( 5);               
  Ctrl.DEBUG.EYESCAN_TRIGGER          <=  reg_data(1028)(23);               
  Ctrl.DEBUG.PCS_RSV_DIN              <=  reg_data(1029)(15 downto  0);     
  Ctrl.DEBUG.RX.CDR_HOLD              <=  reg_data(1030)(13);               
  Ctrl.DEBUG.RX.LPM_EN                <=  reg_data(1030)(18);               
  Ctrl.DEBUG.RX.PRBS_CNT_RST          <=  reg_data(1030)(25);               
  Ctrl.DEBUG.RX.PRBS_SEL              <=  reg_data(1030)(29 downto 26);     
  Ctrl.DEBUG.RX.RATE                  <=  reg_data(1031)( 2 downto  0);     
  Ctrl.DEBUG.TX.INHIBIT               <=  reg_data(1032)( 7);               
  Ctrl.DEBUG.TX.POLARITY              <=  reg_data(1032)(17);               
  Ctrl.DEBUG.TX.POST_CURSOR           <=  reg_data(1032)(22 downto 18);     
  Ctrl.DEBUG.TX.PRBS_FORCE_ERR        <=  reg_data(1032)(23);               
  Ctrl.DEBUG.TX.PRE_CURSOR            <=  reg_data(1032)(31 downto 27);     
  Ctrl.DEBUG.TX.PRBS_SEL              <=  reg_data(1033)( 3 downto  0);     
  Ctrl.DEBUG.TX.DIFF_CTRL             <=  reg_data(1033)( 8 downto  4);     
  Ctrl.PHY_READ_TIME                  <=  reg_data(1057)(23 downto  0);     
  Ctrl.ENABLE_PHY_CTRL                <=  reg_data(1057)(24);               
  Ctrl.PHY_LANE_STABLE                <=  reg_data(1058)(19 downto  0);     
  Ctrl.PHY_LANE_ERRORS_TO_RESET       <=  reg_data(1059)( 7 downto  0);     
  Ctrl.PHY_MAX_SINGLE_BIT_ERROR_RATE  <=  reg_data(1060)(31 downto  0);     
  Ctrl.PHY_MAX_MULTI_BIT_ERROR_RATE   <=  reg_data(1061)(31 downto  0);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data(1024)( 5)  <= DEFAULT_C2C_INTF_CTRL_t.STATUS.INITIALIZE;
      reg_data(1028)(23)  <= DEFAULT_C2C_INTF_CTRL_t.DEBUG.EYESCAN_TRIGGER;
      reg_data(1029)(15 downto  0)  <= DEFAULT_C2C_INTF_CTRL_t.DEBUG.PCS_RSV_DIN;
      reg_data(1030)(13)  <= DEFAULT_C2C_INTF_CTRL_t.DEBUG.RX.CDR_HOLD;
      reg_data(1030)(18)  <= DEFAULT_C2C_INTF_CTRL_t.DEBUG.RX.LPM_EN;
      reg_data(1030)(25)  <= DEFAULT_C2C_INTF_CTRL_t.DEBUG.RX.PRBS_CNT_RST;
      reg_data(1030)(29 downto 26)  <= DEFAULT_C2C_INTF_CTRL_t.DEBUG.RX.PRBS_SEL;
      reg_data(1031)( 2 downto  0)  <= DEFAULT_C2C_INTF_CTRL_t.DEBUG.RX.RATE;
      reg_data(1032)( 7)  <= DEFAULT_C2C_INTF_CTRL_t.DEBUG.TX.INHIBIT;
      reg_data(1032)(17)  <= DEFAULT_C2C_INTF_CTRL_t.DEBUG.TX.POLARITY;
      reg_data(1032)(22 downto 18)  <= DEFAULT_C2C_INTF_CTRL_t.DEBUG.TX.POST_CURSOR;
      reg_data(1032)(23)  <= DEFAULT_C2C_INTF_CTRL_t.DEBUG.TX.PRBS_FORCE_ERR;
      reg_data(1032)(31 downto 27)  <= DEFAULT_C2C_INTF_CTRL_t.DEBUG.TX.PRE_CURSOR;
      reg_data(1033)( 3 downto  0)  <= DEFAULT_C2C_INTF_CTRL_t.DEBUG.TX.PRBS_SEL;
      reg_data(1033)( 8 downto  4)  <= DEFAULT_C2C_INTF_CTRL_t.DEBUG.TX.DIFF_CTRL;
      reg_data(1057)(23 downto  0)  <= DEFAULT_C2C_INTF_CTRL_t.PHY_READ_TIME;
      reg_data(1057)(24)  <= DEFAULT_C2C_INTF_CTRL_t.ENABLE_PHY_CTRL;
      reg_data(1058)(19 downto  0)  <= DEFAULT_C2C_INTF_CTRL_t.PHY_LANE_STABLE;
      reg_data(1059)( 7 downto  0)  <= DEFAULT_C2C_INTF_CTRL_t.PHY_LANE_ERRORS_TO_RESET;
      reg_data(1060)(31 downto  0)  <= DEFAULT_C2C_INTF_CTRL_t.PHY_MAX_SINGLE_BIT_ERROR_RATE;
      reg_data(1061)(31 downto  0)  <= DEFAULT_C2C_INTF_CTRL_t.PHY_MAX_MULTI_BIT_ERROR_RATE;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.DEBUG.EYESCAN_RESET <= '0';
      Ctrl.DEBUG.RX.BUF_RESET <= '0';
      Ctrl.DEBUG.RX.DFE_LPM_RESET <= '0';
      Ctrl.DEBUG.RX.PCS_RESET <= '0';
      Ctrl.DEBUG.RX.PMA_RESET <= '0';
      Ctrl.DEBUG.TX.PCS_RESET <= '0';
      Ctrl.DEBUG.TX.PMA_RESET <= '0';
      Ctrl.COUNTERS.RESET_COUNTERS <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(10 downto 0))) is
        when 1024 => --0x400
          reg_data(1024)( 5)            <=  localWrData( 5);                --C2C initialize
        when 1028 => --0x404
          Ctrl.DEBUG.EYESCAN_RESET      <=  localWrData(22);               
          reg_data(1028)(23)            <=  localWrData(23);                --DEBUG eyescan trigger
        when 1029 => --0x405
          reg_data(1029)(15 downto  0)  <=  localWrData(15 downto  0);      --bit 2 is DRP uber reset
        when 1030 => --0x406
          Ctrl.DEBUG.RX.BUF_RESET       <=  localWrData(12);               
          Ctrl.DEBUG.RX.DFE_LPM_RESET   <=  localWrData(17);               
          Ctrl.DEBUG.RX.PCS_RESET       <=  localWrData(23);               
          Ctrl.DEBUG.RX.PMA_RESET       <=  localWrData(24);               
          reg_data(1030)(13)            <=  localWrData(13);                --DEBUG rx CDR hold
          reg_data(1030)(18)            <=  localWrData(18);                --DEBUG rx LPM ENABLE
          reg_data(1030)(25)            <=  localWrData(25);                --DEBUG rx PRBS counter reset
          reg_data(1030)(29 downto 26)  <=  localWrData(29 downto 26);      --DEBUG rx PRBS select
        when 1031 => --0x407
          reg_data(1031)( 2 downto  0)  <=  localWrData( 2 downto  0);      --DEBUG rx rate
        when 1032 => --0x408
          Ctrl.DEBUG.TX.PCS_RESET       <=  localWrData(15);               
          Ctrl.DEBUG.TX.PMA_RESET       <=  localWrData(16);               
          reg_data(1032)( 7)            <=  localWrData( 7);                --DEBUG tx inhibit
          reg_data(1032)(17)            <=  localWrData(17);                --DEBUG tx polarity
          reg_data(1032)(22 downto 18)  <=  localWrData(22 downto 18);      --DEBUG post cursor
          reg_data(1032)(23)            <=  localWrData(23);                --DEBUG force PRBS error
          reg_data(1032)(31 downto 27)  <=  localWrData(31 downto 27);      --DEBUG pre cursor
        when 1033 => --0x409
          reg_data(1033)( 3 downto  0)  <=  localWrData( 3 downto  0);      --DEBUG PRBS select
          reg_data(1033)( 8 downto  4)  <=  localWrData( 8 downto  4);      --DEBUG tx diff control
        when 1048 => --0x418
          Ctrl.COUNTERS.RESET_COUNTERS  <=  localWrData( 0);               
        when 1057 => --0x421
          reg_data(1057)(23 downto  0)  <=  localWrData(23 downto  0);      --Time spent waiting for phylane to stabilize
          reg_data(1057)(24)            <=  localWrData(24);                --phy_lane_control is enabled
        when 1058 => --0x422
          reg_data(1058)(19 downto  0)  <=  localWrData(19 downto  0);      --Contious phy_lane_up signals required to lock phylane control
        when 1059 => --0x423
          reg_data(1059)( 7 downto  0)  <=  localWrData( 7 downto  0);      --Number of failures before we reset the pma
        when 1060 => --0x424
          reg_data(1060)(31 downto  0)  <=  localWrData(31 downto  0);      --Max single bit error rate
        when 1061 => --0x425
          reg_data(1061)(31 downto  0)  <=  localWrData(31 downto  0);      --Max multi bit error rate

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
        if localAddress(10 downto BRAM_range(iBRAM)) = BRAM_addr(iBRAM)(10 downto BRAM_range(iBRAM)) then
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
  
  Ctrl.DRP.clk       <=  BRAM_MOSI(0).clk;
  Ctrl.DRP.enable    <=  BRAM_MOSI(0).enable;
  Ctrl.DRP.wr_enable <=  BRAM_MOSI(0).wr_enable;
  Ctrl.DRP.address   <=  BRAM_MOSI(0).address(10-1 downto 0);
  Ctrl.DRP.wr_data   <=  BRAM_MOSI(0).wr_data(16-1 downto 0);


  BRAM_MISO(0).rd_data(16-1 downto 0) <= Mon.DRP.rd_data;
  BRAM_MISO(0).rd_data(31 downto 16) <= (others => '0');
  BRAM_MISO(0).rd_data_valid <= Mon.DRP.rd_data_valid;

    

  BRAM_writes: for iBRAM in 0 to BRAM_COUNT-1 generate
    BRAM_write: process (clk_axi,reset_axi_n) is    
    begin  -- process BRAM_reads
      if reset_axi_n = '0' then
        BRAM_MOSI(iBRAM).wr_enable   <= '0';
      elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
        BRAM_MOSI(iBRAM).wr_enable   <= '0';
        if localAddress(10 downto BRAM_range(iBRAM)) = BRAM_addr(iBRAM)(10 downto BRAM_range(iBRAM)) then
          BRAM_MOSI(iBRAM).wr_enable   <= localWrEn;
        end if;
      end if;
    end process BRAM_write;
  end generate BRAM_writes;


  
end architecture behavioral;