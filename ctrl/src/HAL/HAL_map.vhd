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


  signal reg_data :  slv32_array_t(integer range 0 to 135);
  constant Default_reg_data : slv32_array_t(integer range 0 to 135) := (others => x"00000000");
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
      case to_integer(unsigned(localAddress(7 downto 0))) is

        when 2 => --0x2
          localRdData( 7 downto  0)  <=  reg_data( 2)( 7 downto  0);        --
          localRdData( 8)            <=  reg_data( 2)( 8);                  --
          localRdData( 9)            <=  reg_data( 2)( 9);                  --
          localRdData(10)            <=  reg_data( 2)(10);                  --
          localRdData(11)            <=  reg_data( 2)(11);                  --
        when 3 => --0x3
          localRdData( 2)            <=  reg_data( 3)( 2);                  --
          localRdData( 3)            <=  reg_data( 3)( 3);                  --
        when 9 => --0x9
          localRdData( 0)            <=  Mon.GBT.SC.TX_READY;               --
          localRdData( 1)            <=  Mon.GBT.SC.RX_EMPTY;               --
        when 131 => --0x83
          localRdData( 2 downto  0)  <=  reg_data(131)( 2 downto  0);       --
        when 6 => --0x6
          localRdData( 7 downto  0)  <=  reg_data( 6)( 7 downto  0);        --
          localRdData(15 downto  8)  <=  Mon.GBT.SC.RX_DATA_FROM_GBTX;      --
        when 10 => --0xa
          localRdData( 7 downto  0)  <=  reg_data(10)( 7 downto  0);        --
          localRdData(15 downto  8)  <=  reg_data(10)(15 downto  8);        --
          localRdData(23 downto 16)  <=  reg_data(10)(23 downto 16);        --
          localRdData(31 downto 24)  <=  reg_data(10)(31 downto 24);        --
        when 12 => --0xc
          localRdData( 7 downto  0)  <=  Mon.GBT.SC.RX_LEN_0;               --
          localRdData(15 downto  8)  <=  Mon.GBT.SC.RX_ADDRESS_0;           --
          localRdData(23 downto 16)  <=  Mon.GBT.SC.RX_CONTROL_0;           --
          localRdData(31 downto 24)  <=  Mon.GBT.SC.RX_TRANSID_0;           --
        when 13 => --0xd
          localRdData( 7 downto  0)  <=  Mon.GBT.SC.RX_ERR_0;               --
          localRdData( 8)            <=  Mon.GBT.SC.RX_RECEIVED_0;          --
          localRdData(19 downto 12)  <=  Mon.GBT.SC.RX_CHANNEL_0;           --
        when 15 => --0xf
          localRdData( 7 downto  0)  <=  Mon.GBT.SC.RX_LEN_1;               --
          localRdData(15 downto  8)  <=  Mon.GBT.SC.RX_ADDRESS_1;           --
          localRdData(23 downto 16)  <=  Mon.GBT.SC.RX_CONTROL_1;           --
          localRdData(31 downto 24)  <=  Mon.GBT.SC.RX_TRANSID_1;           --
        when 16 => --0x10
          localRdData( 7 downto  0)  <=  Mon.GBT.SC.RX_ERR_1;               --
          localRdData( 8)            <=  Mon.GBT.SC.RX_RECEIVED_1;          --
          localRdData(19 downto 12)  <=  Mon.GBT.SC.RX_CHANNEL_1;           --
        when 18 => --0x12
          localRdData( 7 downto  0)  <=  Mon.GBT.SC.RX_LEN_2;               --
          localRdData(15 downto  8)  <=  Mon.GBT.SC.RX_ADDRESS_2;           --
          localRdData(23 downto 16)  <=  Mon.GBT.SC.RX_CONTROL_2;           --
          localRdData(31 downto 24)  <=  Mon.GBT.SC.RX_TRANSID_2;           --
        when 19 => --0x13
          localRdData( 7 downto  0)  <=  Mon.GBT.SC.RX_ERR_2;               --
          localRdData( 8)            <=  Mon.GBT.SC.RX_RECEIVED_2;          --
          localRdData(19 downto 12)  <=  Mon.GBT.SC.RX_CHANNEL_2;           --
        when 4 => --0x4
          localRdData(11 downto  4)  <=  reg_data( 4)(11 downto  4);        --
        when 5 => --0x5
          localRdData(15 downto  0)  <=  reg_data( 5)(15 downto  0);        --
          localRdData(31 downto 16)  <=  reg_data( 5)(31 downto 16);        --
        when 11 => --0xb
          localRdData(31 downto  0)  <=  reg_data(11)(31 downto  0);        --
        when 14 => --0xe
          localRdData(31 downto  0)  <=  Mon.GBT.SC.RX_DATA_0;              --
        when 17 => --0x11
          localRdData(31 downto  0)  <=  Mon.GBT.SC.RX_DATA_1;              --
        when 35 => --0x23
          localRdData(31 downto  0)  <=  Mon.GBT.SC.RX_DATA_2;              --


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.GBT.LINK_SEL                 <=  reg_data( 2)( 7 downto  0);      
  Ctrl.GBT.SEL_SLAVE                <=  reg_data( 2)( 8);                
  Ctrl.GBT.BROADCAST                <=  reg_data( 2)( 9);                
  Ctrl.GBT.SCA_SEL                  <=  reg_data( 2)(10);                
  Ctrl.GBT.SCA_BROADCAST            <=  reg_data( 2)(11);                
  Ctrl.GBT.SC.TX_START_WRITE        <=  reg_data( 3)( 2);                
  Ctrl.GBT.SC.TX_START_READ         <=  reg_data( 3)( 3);                
  Ctrl.GBT.SC.SCA_ENABLE            <=  reg_data(131)( 2 downto  0);     
  Ctrl.GBT.SC.TX_DATA_TO_GBTX       <=  reg_data( 6)( 7 downto  0);      
  Ctrl.GBT.SC.TX_CMD                <=  reg_data(10)( 7 downto  0);      
  Ctrl.GBT.SC.TX_GBTX_ADDR          <=  reg_data( 4)(11 downto  4);      
  Ctrl.GBT.SC.TX_ADDRESS            <=  reg_data(10)(15 downto  8);      
  Ctrl.GBT.SC.TX_REGISTER_ADDR      <=  reg_data( 5)(15 downto  0);      
  Ctrl.GBT.SC.TX_TRANSID            <=  reg_data(10)(23 downto 16);      
  Ctrl.GBT.SC.TX_CHANNEL            <=  reg_data(10)(31 downto 24);      
  Ctrl.GBT.SC.TX_NUM_BYTES_TO_READ  <=  reg_data( 5)(31 downto 16);      
  Ctrl.GBT.SC.TX_DATA               <=  reg_data(11)(31 downto  0);      


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 2)( 7 downto  0)  <= DEFAULT_HAL_CTRL_t.GBT.LINK_SEL;
      reg_data( 2)( 8)  <= DEFAULT_HAL_CTRL_t.GBT.SEL_SLAVE;
      reg_data( 2)( 9)  <= DEFAULT_HAL_CTRL_t.GBT.BROADCAST;
      reg_data( 2)(10)  <= DEFAULT_HAL_CTRL_t.GBT.SCA_SEL;
      reg_data( 2)(11)  <= DEFAULT_HAL_CTRL_t.GBT.SCA_BROADCAST;
      reg_data( 3)( 2)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_START_WRITE;
      reg_data( 3)( 3)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_START_READ;
      reg_data(131)( 2 downto  0)  <= DEFAULT_HAL_CTRL_t.GBT.SC.SCA_ENABLE;
      reg_data( 6)( 7 downto  0)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_DATA_TO_GBTX;
      reg_data(10)( 7 downto  0)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_CMD;
      reg_data( 4)(11 downto  4)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_GBTX_ADDR;
      reg_data(10)(15 downto  8)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_ADDRESS;
      reg_data( 5)(15 downto  0)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_REGISTER_ADDR;
      reg_data(10)(23 downto 16)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_TRANSID;
      reg_data(10)(31 downto 24)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_CHANNEL;
      reg_data( 5)(31 downto 16)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_NUM_BYTES_TO_READ;
      reg_data(11)(31 downto  0)  <= DEFAULT_HAL_CTRL_t.GBT.SC.TX_DATA;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.GBT.RESET <= '0';
      Ctrl.GBT.SC.TX_RESET <= '0';
      Ctrl.GBT.SC.RX_RESET <= '0';
      Ctrl.GBT.SC.TX_WR <= '0';
      Ctrl.GBT.SC.RX_RD <= '0';
      Ctrl.GBT.SC.START_RESET <= '0';
      Ctrl.GBT.SC.START_CONNECT <= '0';
      Ctrl.GBT.SC.START_COMMAND <= '0';
      Ctrl.GBT.SC.INJ_CRC_ERR <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(7 downto 0))) is
        when 1 => --0x1
          Ctrl.GBT.RESET               <=  localWrData( 0);               
        when 2 => --0x2
          reg_data( 2)( 7 downto  0)   <=  localWrData( 7 downto  0);      --
          reg_data( 2)( 8)             <=  localWrData( 8);                --
          reg_data( 2)( 9)             <=  localWrData( 9);                --
          reg_data( 2)(10)             <=  localWrData(10);                --
          reg_data( 2)(11)             <=  localWrData(11);                --
        when 3 => --0x3
          Ctrl.GBT.SC.TX_RESET         <=  localWrData( 0);               
          Ctrl.GBT.SC.RX_RESET         <=  localWrData( 1);               
          reg_data( 3)( 2)             <=  localWrData( 2);                --
          reg_data( 3)( 3)             <=  localWrData( 3);                --
        when 7 => --0x7
          Ctrl.GBT.SC.TX_WR            <=  localWrData( 0);               
        when 8 => --0x8
          Ctrl.GBT.SC.RX_RD            <=  localWrData( 0);               
        when 132 => --0x84
          Ctrl.GBT.SC.START_RESET      <=  localWrData( 0);               
        when 133 => --0x85
          Ctrl.GBT.SC.START_CONNECT    <=  localWrData( 0);               
        when 134 => --0x86
          Ctrl.GBT.SC.START_COMMAND    <=  localWrData( 0);               
        when 135 => --0x87
          Ctrl.GBT.SC.INJ_CRC_ERR      <=  localWrData( 0);               
        when 131 => --0x83
          reg_data(131)( 2 downto  0)  <=  localWrData( 2 downto  0);      --
        when 6 => --0x6
          reg_data( 6)( 7 downto  0)   <=  localWrData( 7 downto  0);      --
        when 10 => --0xa
          reg_data(10)( 7 downto  0)   <=  localWrData( 7 downto  0);      --
          reg_data(10)(15 downto  8)   <=  localWrData(15 downto  8);      --
          reg_data(10)(23 downto 16)   <=  localWrData(23 downto 16);      --
          reg_data(10)(31 downto 24)   <=  localWrData(31 downto 24);      --
        when 4 => --0x4
          reg_data( 4)(11 downto  4)   <=  localWrData(11 downto  4);      --
        when 5 => --0x5
          reg_data( 5)(15 downto  0)   <=  localWrData(15 downto  0);      --
          reg_data( 5)(31 downto 16)   <=  localWrData(31 downto 16);      --
        when 11 => --0xb
          reg_data(11)(31 downto  0)   <=  localWrData(31 downto  0);      --

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;