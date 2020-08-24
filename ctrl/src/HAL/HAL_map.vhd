--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.AXIRegPkg.all;
use work.types.all;
use work.HAL_Ctrl.all;
entity HAL_interface is
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    Mon              : in  HAL_Mon_t;
    Ctrl             : out HAL_Ctrl_t
    );
end entity HAL_interface;
architecture behavioral of HAL_interface is
  signal localAddress       : slv_32_t;
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;


  signal reg_data :  slv32_array_t(integer range 0 to 4230);
  constant Default_reg_data : slv32_array_t(integer range 0 to 4230) := (others => x"00000000");
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
      case to_integer(unsigned(localAddress(12 downto 0))) is

        when 4 => --0x4
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(0).READY;             --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(0).FEC_ERR_CNT;       --Data Corrected Count
        when 6 => --0x6
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(1).READY;             --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(1).FEC_ERR_CNT;       --Data Corrected Count
        when 8 => --0x8
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(2).READY;             --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(2).FEC_ERR_CNT;       --Data Corrected Count
        when 10 => --0xa
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(3).READY;             --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(3).FEC_ERR_CNT;       --Data Corrected Count
        when 12 => --0xc
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(4).READY;             --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(4).FEC_ERR_CNT;       --Data Corrected Count
        when 14 => --0xe
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(5).READY;             --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(5).FEC_ERR_CNT;       --Data Corrected Count
        when 16 => --0x10
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(6).READY;             --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(6).FEC_ERR_CNT;       --Data Corrected Count
        when 18 => --0x12
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(7).READY;             --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(7).FEC_ERR_CNT;       --Data Corrected Count
        when 20 => --0x14
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(8).READY;             --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(8).FEC_ERR_CNT;       --Data Corrected Count
        when 22 => --0x16
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(9).READY;             --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(9).FEC_ERR_CNT;       --Data Corrected Count
        when 24 => --0x18
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(10).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(10).FEC_ERR_CNT;      --Data Corrected Count
        when 26 => --0x1a
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(11).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(11).FEC_ERR_CNT;      --Data Corrected Count
        when 28 => --0x1c
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(12).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(12).FEC_ERR_CNT;      --Data Corrected Count
        when 30 => --0x1e
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(13).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(13).FEC_ERR_CNT;      --Data Corrected Count
        when 32 => --0x20
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(14).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(14).FEC_ERR_CNT;      --Data Corrected Count
        when 34 => --0x22
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(15).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(15).FEC_ERR_CNT;      --Data Corrected Count
        when 36 => --0x24
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(16).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(16).FEC_ERR_CNT;      --Data Corrected Count
        when 38 => --0x26
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(17).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(17).FEC_ERR_CNT;      --Data Corrected Count
        when 40 => --0x28
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(18).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(18).FEC_ERR_CNT;      --Data Corrected Count
        when 42 => --0x2a
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(19).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(19).FEC_ERR_CNT;      --Data Corrected Count
        when 44 => --0x2c
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(20).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(20).FEC_ERR_CNT;      --Data Corrected Count
        when 46 => --0x2e
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(21).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(21).FEC_ERR_CNT;      --Data Corrected Count
        when 48 => --0x30
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(22).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(22).FEC_ERR_CNT;      --Data Corrected Count
        when 50 => --0x32
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(23).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(23).FEC_ERR_CNT;      --Data Corrected Count
        when 52 => --0x34
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(24).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(24).FEC_ERR_CNT;      --Data Corrected Count
        when 54 => --0x36
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(25).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(25).FEC_ERR_CNT;      --Data Corrected Count
        when 56 => --0x38
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(26).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(26).FEC_ERR_CNT;      --Data Corrected Count
        when 58 => --0x3a
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(27).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(27).FEC_ERR_CNT;      --Data Corrected Count
        when 60 => --0x3c
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(28).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(28).FEC_ERR_CNT;      --Data Corrected Count
        when 62 => --0x3e
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(29).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(29).FEC_ERR_CNT;      --Data Corrected Count
        when 64 => --0x40
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(30).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(30).FEC_ERR_CNT;      --Data Corrected Count
        when 66 => --0x42
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(31).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(31).FEC_ERR_CNT;      --Data Corrected Count
        when 68 => --0x44
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(32).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(32).FEC_ERR_CNT;      --Data Corrected Count
        when 70 => --0x46
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(33).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(33).FEC_ERR_CNT;      --Data Corrected Count
        when 72 => --0x48
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(34).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(34).FEC_ERR_CNT;      --Data Corrected Count
        when 74 => --0x4a
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(35).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(35).FEC_ERR_CNT;      --Data Corrected Count
        when 76 => --0x4c
          localRdData( 0)            <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(36).READY;            --LPGBT Uplink Ready
          localRdData(31 downto 16)  <=  Mon.LPGBT_FPGA.UPLINK.UPLINK(36).FEC_ERR_CNT;      --Data Corrected Count
        when 497 => --0x1f1
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(0).READY;         --LPGBT Downlink Ready
        when 499 => --0x1f3
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(1).READY;         --LPGBT Downlink Ready
        when 501 => --0x1f5
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(2).READY;         --LPGBT Downlink Ready
        when 503 => --0x1f7
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(3).READY;         --LPGBT Downlink Ready
        when 505 => --0x1f9
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(4).READY;         --LPGBT Downlink Ready
        when 507 => --0x1fb
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(5).READY;         --LPGBT Downlink Ready
        when 509 => --0x1fd
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(6).READY;         --LPGBT Downlink Ready
        when 511 => --0x1ff
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(7).READY;         --LPGBT Downlink Ready
        when 513 => --0x201
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(8).READY;         --LPGBT Downlink Ready
        when 515 => --0x203
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(9).READY;         --LPGBT Downlink Ready
        when 517 => --0x205
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(10).READY;        --LPGBT Downlink Ready
        when 519 => --0x207
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(11).READY;        --LPGBT Downlink Ready
        when 521 => --0x209
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(12).READY;        --LPGBT Downlink Ready
        when 523 => --0x20b
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(13).READY;        --LPGBT Downlink Ready
        when 525 => --0x20d
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(14).READY;        --LPGBT Downlink Ready
        when 527 => --0x20f
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(15).READY;        --LPGBT Downlink Ready
        when 529 => --0x211
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(16).READY;        --LPGBT Downlink Ready
        when 531 => --0x213
          localRdData( 0)            <=  Mon.LPGBT_FPGA.DOWNLINK.DOWNLINK(17).READY;        --LPGBT Downlink Ready
        when 4097 => --0x1001
          localRdData( 7 downto  0)  <=  reg_data(4097)( 7 downto  0);                      --Selects an LPGBT link to write to
          localRdData( 8)            <=  reg_data(4097)( 8);                                --Set to 1 to select the slave link (EC)
          localRdData( 9)            <=  reg_data(4097)( 9);                                --Sends data to all LPGBTs (Master + Slave)
        when 4098 => --0x1002
          localRdData( 2)            <=  reg_data(4098)( 2);                                --Request a write config to the GBTx (IC)
          localRdData( 3)            <=  reg_data(4098)( 3);                                --Request a read config to the GBTx (IC)
        when 4104 => --0x1008
          localRdData( 0)            <=  Mon.GBT.SC.TX_READY;                               --IC core ready for a transaction
          localRdData( 1)            <=  Mon.GBT.SC.RX_EMPTY;                               --Rx FIFO is empty (no reply from GBTx)
        when 4226 => --0x1082
          localRdData( 2 downto  0)  <=  reg_data(4226)( 2 downto  0);                      --Enable flag to select SCAs
        when 4101 => --0x1005
          localRdData( 7 downto  0)  <=  reg_data(4101)( 7 downto  0);                      --Data to be written into the internal FIFO
          localRdData(15 downto  8)  <=  Mon.GBT.SC.RX_DATA_FROM_GBTX;                      --Data from the FIFO
        when 4105 => --0x1009
          localRdData( 7 downto  0)  <=  reg_data(4105)( 7 downto  0);                      --Command: The Command field is present in the frames received by the SCA and indicates the operation to be performed. Meaning is specific to the channel.
          localRdData(15 downto  8)  <=  reg_data(4105)(15 downto  8);                      --Command: It represents the packet destination address. The address is one-byte long. By default, the GBT-SCA use address 0x00.
          localRdData(23 downto 16)  <=  reg_data(4105)(23 downto 16);                      --Command: Specifies the message identification number. The reply messages generated by the SCA have the same transaction identifier of the request message allowing to associate the transmitted commands with the corresponding replies, permitting the concurrent use of all the SCA channels.  It is not required that ID values are ordered. ID values 0x00 and 0xff are reserved for interrupt packets generated spontaneously by the SCA and should not be used in requests.
          localRdData(31 downto 24)  <=  reg_data(4105)(31 downto 24);                      --Command: The channel field specifies the destination interface of the request message (ctrl/spi/gpio/i2c/jtag/adc/dac).
        when 4099 => --0x1003
          localRdData(11 downto  4)  <=  reg_data(4099)(11 downto  4);                      --I2C address of the GBTx
        when 4100 => --0x1004
          localRdData(15 downto  0)  <=  reg_data(4100)(15 downto  0);                      --Address of the first register to be accessed
          localRdData(31 downto 16)  <=  reg_data(4100)(31 downto 16);                      --Number of words/bytes to be read (only for read transactions)
        when 4106 => --0x100a
          localRdData(31 downto  0)  <=  reg_data(4106)(31 downto  0);                      --Command: data field (According to the SCA manual)
        when 4107 => --0x100b
          localRdData( 7 downto  0)  <=  Mon.GBT.SC.RX.RX(0).RX_LEN;                        --Reply: The length qualifier field specifies the number of bytes contained in the DATA field.
          localRdData(15 downto  8)  <=  Mon.GBT.SC.RX.RX(0).RX_ADDRESS;                    --Reply: It represents the packet destination address. The address is one-bytelong. By default, the GBT-SCA use address 0x00.
          localRdData(23 downto 16)  <=  Mon.GBT.SC.RX.RX(0).RX_CONTROL;                    --Reply: The control field is 1 byte in length and contains frame sequence numbers of the currently transmitted frame and the last correctly received frame. The control field is also used to convey three supervisory level commands: Connect, Reset, and Test.
          localRdData(31 downto 24)  <=  Mon.GBT.SC.RX.RX(0).RX_TRANSID;                    --Reply: transaction ID field (According to the SCA manual)
        when 4108 => --0x100c
          localRdData( 7 downto  0)  <=  Mon.GBT.SC.RX.RX(0).RX_ERR;                        --Reply: The Error Flag field is present in the channel reply frames to indicate error conditions encountered in the execution of a command. If no errors are found, its value is 0x00.
          localRdData( 8)            <=  Mon.GBT.SC.RX.RX(0).RX_RECEIVED;                   --Reply received flag (pulse)
          localRdData(19 downto 12)  <=  Mon.GBT.SC.RX.RX(0).RX_CHANNEL;                    --Reply: The channel field specifies the destination interface of the request message (ctrl/spi/gpio/i2c/jtag/adc/dac).
        when 4109 => --0x100d
          localRdData(31 downto  0)  <=  Mon.GBT.SC.RX.RX(0).RX_DATA;                       --Reply: The Data field is command dependent field whose length is defined by the length qualifier field. For example, in the case of a read/write operation on a GBT-SCA internal register, it contains the value written/read from the register.
        when 4110 => --0x100e
          localRdData( 7 downto  0)  <=  Mon.GBT.SC.RX.RX(1).RX_LEN;                        --Reply: The length qualifier field specifies the number of bytes contained in the DATA field.
          localRdData(15 downto  8)  <=  Mon.GBT.SC.RX.RX(1).RX_ADDRESS;                    --Reply: It represents the packet destination address. The address is one-bytelong. By default, the GBT-SCA use address 0x00.
          localRdData(23 downto 16)  <=  Mon.GBT.SC.RX.RX(1).RX_CONTROL;                    --Reply: The control field is 1 byte in length and contains frame sequence numbers of the currently transmitted frame and the last correctly received frame. The control field is also used to convey three supervisory level commands: Connect, Reset, and Test.
          localRdData(31 downto 24)  <=  Mon.GBT.SC.RX.RX(1).RX_TRANSID;                    --Reply: transaction ID field (According to the SCA manual)
        when 4111 => --0x100f
          localRdData( 7 downto  0)  <=  Mon.GBT.SC.RX.RX(1).RX_ERR;                        --Reply: The Error Flag field is present in the channel reply frames to indicate error conditions encountered in the execution of a command. If no errors are found, its value is 0x00.
          localRdData( 8)            <=  Mon.GBT.SC.RX.RX(1).RX_RECEIVED;                   --Reply received flag (pulse)
          localRdData(19 downto 12)  <=  Mon.GBT.SC.RX.RX(1).RX_CHANNEL;                    --Reply: The channel field specifies the destination interface of the request message (ctrl/spi/gpio/i2c/jtag/adc/dac).
        when 4112 => --0x1010
          localRdData(31 downto  0)  <=  Mon.GBT.SC.RX.RX(1).RX_DATA;                       --Reply: The Data field is command dependent field whose length is defined by the length qualifier field. For example, in the case of a read/write operation on a GBT-SCA internal register, it contains the value written/read from the register.
        when 4113 => --0x1011
          localRdData( 7 downto  0)  <=  Mon.GBT.SC.RX.RX(2).RX_LEN;                        --Reply: The length qualifier field specifies the number of bytes contained in the DATA field.
          localRdData(15 downto  8)  <=  Mon.GBT.SC.RX.RX(2).RX_ADDRESS;                    --Reply: It represents the packet destination address. The address is one-bytelong. By default, the GBT-SCA use address 0x00.
          localRdData(23 downto 16)  <=  Mon.GBT.SC.RX.RX(2).RX_CONTROL;                    --Reply: The control field is 1 byte in length and contains frame sequence numbers of the currently transmitted frame and the last correctly received frame. The control field is also used to convey three supervisory level commands: Connect, Reset, and Test.
          localRdData(31 downto 24)  <=  Mon.GBT.SC.RX.RX(2).RX_TRANSID;                    --Reply: transaction ID field (According to the SCA manual)
        when 4114 => --0x1012
          localRdData( 7 downto  0)  <=  Mon.GBT.SC.RX.RX(2).RX_ERR;                        --Reply: The Error Flag field is present in the channel reply frames to indicate error conditions encountered in the execution of a command. If no errors are found, its value is 0x00.
          localRdData( 8)            <=  Mon.GBT.SC.RX.RX(2).RX_RECEIVED;                   --Reply received flag (pulse)
          localRdData(19 downto 12)  <=  Mon.GBT.SC.RX.RX(2).RX_CHANNEL;                    --Reply: The channel field specifies the destination interface of the request message (ctrl/spi/gpio/i2c/jtag/adc/dac).
        when 4115 => --0x1013
          localRdData(31 downto  0)  <=  Mon.GBT.SC.RX.RX(2).RX_DATA;                       --Reply: The Data field is command dependent field whose length is defined by the length qualifier field. For example, in the case of a read/write operation on a GBT-SCA internal register, it contains the value written/read from the register.


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.GBT.LINK_SEL                 <=  reg_data(4097)( 7 downto  0);     
  Ctrl.GBT.SEL_SLAVE                <=  reg_data(4097)( 8);               
  Ctrl.GBT.BROADCAST                <=  reg_data(4097)( 9);               
  Ctrl.GBT.SC.TX_START_WRITE        <=  reg_data(4098)( 2);               
  Ctrl.GBT.SC.TX_START_READ         <=  reg_data(4098)( 3);               
  Ctrl.GBT.SC.SCA_ENABLE            <=  reg_data(4226)( 2 downto  0);     
  Ctrl.GBT.SC.TX_DATA_TO_GBTX       <=  reg_data(4101)( 7 downto  0);     
  Ctrl.GBT.SC.TX_CMD                <=  reg_data(4105)( 7 downto  0);     
  Ctrl.GBT.SC.TX_GBTX_ADDR          <=  reg_data(4099)(11 downto  4);     
  Ctrl.GBT.SC.TX_ADDRESS            <=  reg_data(4105)(15 downto  8);     
  Ctrl.GBT.SC.TX_REGISTER_ADDR      <=  reg_data(4100)(15 downto  0);     
  Ctrl.GBT.SC.TX_TRANSID            <=  reg_data(4105)(23 downto 16);     
  Ctrl.GBT.SC.TX_CHANNEL            <=  reg_data(4105)(31 downto 24);     
  Ctrl.GBT.SC.TX_NUM_BYTES_TO_READ  <=  reg_data(4100)(31 downto 16);     
  Ctrl.GBT.SC.TX_DATA               <=  reg_data(4106)(31 downto  0);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data(4097)( 7 downto  0)  <= DEFAULT_HAL_CTRL_t.GBT.LINK_SEL;
      reg_data(4097)( 8)  <= DEFAULT_HAL_CTRL_t.GBT.SEL_SLAVE;
      reg_data(4097)( 9)  <= DEFAULT_HAL_CTRL_t.GBT.BROADCAST;
      reg_data(4098)( 2)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_START_WRITE;
      reg_data(4098)( 3)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_START_READ;
      reg_data(4226)( 2 downto  0)  <= DEFAULT_HAL_CTRL_t.GBT.SC.SCA_ENABLE;
      reg_data(4101)( 7 downto  0)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_DATA_TO_GBTX;
      reg_data(4105)( 7 downto  0)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_CMD;
      reg_data(4099)(11 downto  4)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_GBTX_ADDR;
      reg_data(4105)(15 downto  8)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_ADDRESS;
      reg_data(4100)(15 downto  0)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_REGISTER_ADDR;
      reg_data(4105)(23 downto 16)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_TRANSID;
      reg_data(4105)(31 downto 24)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_CHANNEL;
      reg_data(4100)(31 downto 16)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_NUM_BYTES_TO_READ;
      reg_data(4106)(31 downto  0)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_DATA;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.LPGBT_FPGA.RESET_DOWNLINKS <= '0';
      Ctrl.LPGBT_FPGA.RESET_UPLINKS <= '0';
      Ctrl.LPGBT_FPGA.RESET_COUNTERS <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(0).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(1).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(2).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(3).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(4).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(5).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(6).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(7).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(8).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(9).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(10).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(11).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(12).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(13).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(14).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(15).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(16).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(17).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(18).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(19).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(20).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(21).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(22).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(23).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(24).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(25).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(26).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(27).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(28).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(29).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(30).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(31).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(32).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(33).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(34).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(35).RESET <= '0';
      Ctrl.LPGBT_FPGA.UPLINK.UPLINK(36).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(0).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(1).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(2).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(3).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(4).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(5).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(6).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(7).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(8).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(9).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(10).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(11).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(12).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(13).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(14).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(15).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(16).RESET <= '0';
      Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(17).RESET <= '0';
      Ctrl.GBT.SC.TX_RESET <= '0';
      Ctrl.GBT.SC.RX_RESET <= '0';
      Ctrl.GBT.SC.TX_WR <= '0';
      Ctrl.GBT.SC.RX_RD <= '0';
      Ctrl.GBT.SC.START_RESET <= '0';
      Ctrl.GBT.SC.START_CONNECT <= '0';
      Ctrl.GBT.SC.START_COMMAND <= '0';
      Ctrl.GBT.SC.INJ_CRC_ERR <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(12 downto 0))) is
        when 0 => --0x0
          Ctrl.LPGBT_FPGA.RESET_DOWNLINKS              <=  localWrData( 0);               
        when 1 => --0x1
          Ctrl.LPGBT_FPGA.RESET_UPLINKS                <=  localWrData( 0);               
        when 2 => --0x2
          Ctrl.LPGBT_FPGA.RESET_COUNTERS               <=  localWrData( 0);               
        when 3 => --0x3
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(0).RESET       <=  localWrData( 0);               
        when 5 => --0x5
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(1).RESET       <=  localWrData( 0);               
        when 7 => --0x7
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(2).RESET       <=  localWrData( 0);               
        when 9 => --0x9
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(3).RESET       <=  localWrData( 0);               
        when 11 => --0xb
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(4).RESET       <=  localWrData( 0);               
        when 13 => --0xd
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(5).RESET       <=  localWrData( 0);               
        when 15 => --0xf
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(6).RESET       <=  localWrData( 0);               
        when 17 => --0x11
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(7).RESET       <=  localWrData( 0);               
        when 19 => --0x13
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(8).RESET       <=  localWrData( 0);               
        when 21 => --0x15
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(9).RESET       <=  localWrData( 0);               
        when 23 => --0x17
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(10).RESET      <=  localWrData( 0);               
        when 25 => --0x19
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(11).RESET      <=  localWrData( 0);               
        when 27 => --0x1b
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(12).RESET      <=  localWrData( 0);               
        when 29 => --0x1d
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(13).RESET      <=  localWrData( 0);               
        when 31 => --0x1f
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(14).RESET      <=  localWrData( 0);               
        when 33 => --0x21
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(15).RESET      <=  localWrData( 0);               
        when 35 => --0x23
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(16).RESET      <=  localWrData( 0);               
        when 37 => --0x25
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(17).RESET      <=  localWrData( 0);               
        when 39 => --0x27
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(18).RESET      <=  localWrData( 0);               
        when 41 => --0x29
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(19).RESET      <=  localWrData( 0);               
        when 43 => --0x2b
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(20).RESET      <=  localWrData( 0);               
        when 45 => --0x2d
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(21).RESET      <=  localWrData( 0);               
        when 47 => --0x2f
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(22).RESET      <=  localWrData( 0);               
        when 49 => --0x31
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(23).RESET      <=  localWrData( 0);               
        when 51 => --0x33
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(24).RESET      <=  localWrData( 0);               
        when 53 => --0x35
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(25).RESET      <=  localWrData( 0);               
        when 55 => --0x37
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(26).RESET      <=  localWrData( 0);               
        when 57 => --0x39
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(27).RESET      <=  localWrData( 0);               
        when 59 => --0x3b
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(28).RESET      <=  localWrData( 0);               
        when 61 => --0x3d
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(29).RESET      <=  localWrData( 0);               
        when 63 => --0x3f
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(30).RESET      <=  localWrData( 0);               
        when 65 => --0x41
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(31).RESET      <=  localWrData( 0);               
        when 67 => --0x43
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(32).RESET      <=  localWrData( 0);               
        when 69 => --0x45
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(33).RESET      <=  localWrData( 0);               
        when 71 => --0x47
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(34).RESET      <=  localWrData( 0);               
        when 73 => --0x49
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(35).RESET      <=  localWrData( 0);               
        when 75 => --0x4b
          Ctrl.LPGBT_FPGA.UPLINK.UPLINK(36).RESET      <=  localWrData( 0);               
        when 496 => --0x1f0
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(0).RESET   <=  localWrData( 0);               
        when 498 => --0x1f2
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(1).RESET   <=  localWrData( 0);               
        when 500 => --0x1f4
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(2).RESET   <=  localWrData( 0);               
        when 502 => --0x1f6
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(3).RESET   <=  localWrData( 0);               
        when 504 => --0x1f8
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(4).RESET   <=  localWrData( 0);               
        when 506 => --0x1fa
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(5).RESET   <=  localWrData( 0);               
        when 508 => --0x1fc
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(6).RESET   <=  localWrData( 0);               
        when 510 => --0x1fe
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(7).RESET   <=  localWrData( 0);               
        when 512 => --0x200
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(8).RESET   <=  localWrData( 0);               
        when 514 => --0x202
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(9).RESET   <=  localWrData( 0);               
        when 516 => --0x204
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(10).RESET  <=  localWrData( 0);               
        when 518 => --0x206
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(11).RESET  <=  localWrData( 0);               
        when 520 => --0x208
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(12).RESET  <=  localWrData( 0);               
        when 522 => --0x20a
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(13).RESET  <=  localWrData( 0);               
        when 524 => --0x20c
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(14).RESET  <=  localWrData( 0);               
        when 526 => --0x20e
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(15).RESET  <=  localWrData( 0);               
        when 528 => --0x210
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(16).RESET  <=  localWrData( 0);               
        when 530 => --0x212
          Ctrl.LPGBT_FPGA.DOWNLINK.DOWNLINK(17).RESET  <=  localWrData( 0);               
        when 4097 => --0x1001
          reg_data(4097)( 7 downto  0)                 <=  localWrData( 7 downto  0);      --Selects an LPGBT link to write to
          reg_data(4097)( 8)                           <=  localWrData( 8);                --Set to 1 to select the slave link (EC)
          reg_data(4097)( 9)                           <=  localWrData( 9);                --Sends data to all LPGBTs (Master + Slave)
        when 4098 => --0x1002
          Ctrl.GBT.SC.TX_RESET                         <=  localWrData( 0);               
          Ctrl.GBT.SC.RX_RESET                         <=  localWrData( 1);               
          reg_data(4098)( 2)                           <=  localWrData( 2);                --Request a write config to the GBTx (IC)
          reg_data(4098)( 3)                           <=  localWrData( 3);                --Request a read config to the GBTx (IC)
        when 4102 => --0x1006
          Ctrl.GBT.SC.TX_WR                            <=  localWrData( 0);               
        when 4103 => --0x1007
          Ctrl.GBT.SC.RX_RD                            <=  localWrData( 0);               
        when 4227 => --0x1083
          Ctrl.GBT.SC.START_RESET                      <=  localWrData( 0);               
        when 4228 => --0x1084
          Ctrl.GBT.SC.START_CONNECT                    <=  localWrData( 0);               
        when 4229 => --0x1085
          Ctrl.GBT.SC.START_COMMAND                    <=  localWrData( 0);               
        when 4230 => --0x1086
          Ctrl.GBT.SC.INJ_CRC_ERR                      <=  localWrData( 0);               
        when 4226 => --0x1082
          reg_data(4226)( 2 downto  0)                 <=  localWrData( 2 downto  0);      --Enable flag to select SCAs
        when 4101 => --0x1005
          reg_data(4101)( 7 downto  0)                 <=  localWrData( 7 downto  0);      --Data to be written into the internal FIFO
        when 4105 => --0x1009
          reg_data(4105)( 7 downto  0)                 <=  localWrData( 7 downto  0);      --Command: The Command field is present in the frames received by the SCA and indicates the operation to be performed. Meaning is specific to the channel.
          reg_data(4105)(15 downto  8)                 <=  localWrData(15 downto  8);      --Command: It represents the packet destination address. The address is one-byte long. By default, the GBT-SCA use address 0x00.
          reg_data(4105)(23 downto 16)                 <=  localWrData(23 downto 16);      --Command: Specifies the message identification number. The reply messages generated by the SCA have the same transaction identifier of the request message allowing to associate the transmitted commands with the corresponding replies, permitting the concurrent use of all the SCA channels.  It is not required that ID values are ordered. ID values 0x00 and 0xff are reserved for interrupt packets generated spontaneously by the SCA and should not be used in requests.
          reg_data(4105)(31 downto 24)                 <=  localWrData(31 downto 24);      --Command: The channel field specifies the destination interface of the request message (ctrl/spi/gpio/i2c/jtag/adc/dac).
        when 4099 => --0x1003
          reg_data(4099)(11 downto  4)                 <=  localWrData(11 downto  4);      --I2C address of the GBTx
        when 4100 => --0x1004
          reg_data(4100)(15 downto  0)                 <=  localWrData(15 downto  0);      --Address of the first register to be accessed
          reg_data(4100)(31 downto 16)                 <=  localWrData(31 downto 16);      --Number of words/bytes to be read (only for read transactions)
        when 4106 => --0x100a
          reg_data(4106)(31 downto  0)                 <=  localWrData(31 downto  0);      --Command: data field (According to the SCA manual)

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;