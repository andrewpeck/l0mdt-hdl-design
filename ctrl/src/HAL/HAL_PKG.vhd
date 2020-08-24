--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package HAL_CTRL is
  type HAL_LPGBT_FPGA_UPLINK_UPLINK_MON_t is record
    READY                      :std_logic;     -- LPGBT Uplink Ready
    FEC_ERR_CNT                :std_logic_vector(15 downto 0);  -- Data Corrected Count
  end record HAL_LPGBT_FPGA_UPLINK_UPLINK_MON_t;
  type HAL_LPGBT_FPGA_UPLINK_UPLINK_MON_t_ARRAY is array(0 to 36) of HAL_LPGBT_FPGA_UPLINK_UPLINK_MON_t;

  type HAL_LPGBT_FPGA_UPLINK_UPLINK_CTRL_t is record
    RESET                      :std_logic;     -- Reset this Uplink
  end record HAL_LPGBT_FPGA_UPLINK_UPLINK_CTRL_t;
  type HAL_LPGBT_FPGA_UPLINK_UPLINK_CTRL_t_ARRAY is array(0 to 36) of HAL_LPGBT_FPGA_UPLINK_UPLINK_CTRL_t;

  constant DEFAULT_HAL_LPGBT_FPGA_UPLINK_UPLINK_CTRL_t : HAL_LPGBT_FPGA_UPLINK_UPLINK_CTRL_t := (
                                                                                                 RESET => '0'
                                                                                                );
  type HAL_LPGBT_FPGA_UPLINK_MON_t is record
    UPLINK                     :HAL_LPGBT_FPGA_UPLINK_UPLINK_MON_t_ARRAY;
  end record HAL_LPGBT_FPGA_UPLINK_MON_t;


  type HAL_LPGBT_FPGA_UPLINK_CTRL_t is record
    UPLINK                     :HAL_LPGBT_FPGA_UPLINK_UPLINK_CTRL_t_ARRAY;
  end record HAL_LPGBT_FPGA_UPLINK_CTRL_t;


  constant DEFAULT_HAL_LPGBT_FPGA_UPLINK_CTRL_t : HAL_LPGBT_FPGA_UPLINK_CTRL_t := (
                                                                                   UPLINK => (others => DEFAULT_HAL_LPGBT_FPGA_UPLINK_UPLINK_CTRL_t )
                                                                                  );
  type HAL_LPGBT_FPGA_DOWNLINK_DOWNLINK_MON_t is record
    READY                      :std_logic;     -- LPGBT Downlink Ready
  end record HAL_LPGBT_FPGA_DOWNLINK_DOWNLINK_MON_t;
  type HAL_LPGBT_FPGA_DOWNLINK_DOWNLINK_MON_t_ARRAY is array(0 to 17) of HAL_LPGBT_FPGA_DOWNLINK_DOWNLINK_MON_t;

  type HAL_LPGBT_FPGA_DOWNLINK_DOWNLINK_CTRL_t is record
    RESET                      :std_logic;     -- Reset this Downlink
  end record HAL_LPGBT_FPGA_DOWNLINK_DOWNLINK_CTRL_t;
  type HAL_LPGBT_FPGA_DOWNLINK_DOWNLINK_CTRL_t_ARRAY is array(0 to 17) of HAL_LPGBT_FPGA_DOWNLINK_DOWNLINK_CTRL_t;

  constant DEFAULT_HAL_LPGBT_FPGA_DOWNLINK_DOWNLINK_CTRL_t : HAL_LPGBT_FPGA_DOWNLINK_DOWNLINK_CTRL_t := (
                                                                                                         RESET => '0'
                                                                                                        );
  type HAL_LPGBT_FPGA_DOWNLINK_MON_t is record
    DOWNLINK                   :HAL_LPGBT_FPGA_DOWNLINK_DOWNLINK_MON_t_ARRAY;
  end record HAL_LPGBT_FPGA_DOWNLINK_MON_t;


  type HAL_LPGBT_FPGA_DOWNLINK_CTRL_t is record
    DOWNLINK                   :HAL_LPGBT_FPGA_DOWNLINK_DOWNLINK_CTRL_t_ARRAY;
  end record HAL_LPGBT_FPGA_DOWNLINK_CTRL_t;


  constant DEFAULT_HAL_LPGBT_FPGA_DOWNLINK_CTRL_t : HAL_LPGBT_FPGA_DOWNLINK_CTRL_t := (
                                                                                       DOWNLINK => (others => DEFAULT_HAL_LPGBT_FPGA_DOWNLINK_DOWNLINK_CTRL_t )
                                                                                      );
  type HAL_LPGBT_FPGA_MON_t is record
    UPLINK                     :HAL_LPGBT_FPGA_UPLINK_MON_t;
    DOWNLINK                   :HAL_LPGBT_FPGA_DOWNLINK_MON_t;
  end record HAL_LPGBT_FPGA_MON_t;


  type HAL_LPGBT_FPGA_CTRL_t is record
    RESET_DOWNLINKS            :std_logic;     -- Resets all LPGBT Downlinks
    RESET_UPLINKS              :std_logic;     -- Resets all LPGBT Uplinks
    RESET_COUNTERS             :std_logic;     -- Resets counters
    UPLINK                     :HAL_LPGBT_FPGA_UPLINK_CTRL_t;
    DOWNLINK                   :HAL_LPGBT_FPGA_DOWNLINK_CTRL_t;
  end record HAL_LPGBT_FPGA_CTRL_t;


  constant DEFAULT_HAL_LPGBT_FPGA_CTRL_t : HAL_LPGBT_FPGA_CTRL_t := (
                                                                     RESET_DOWNLINKS => '0',
                                                                     RESET_UPLINKS => '0',
                                                                     RESET_COUNTERS => '0',
                                                                     UPLINK => DEFAULT_HAL_LPGBT_FPGA_UPLINK_CTRL_t,
                                                                     DOWNLINK => DEFAULT_HAL_LPGBT_FPGA_DOWNLINK_CTRL_t
                                                                    );
  type HAL_GBT_SC_RX_RX_MON_t is record
    RX_LEN                     :std_logic_vector( 7 downto 0);  -- Reply: The length qualifier field specifies the number of bytes contained in the DATA field.
    RX_ADDRESS                 :std_logic_vector( 7 downto 0);  -- Reply: It represents the packet destination address. The address is one-bytelong. By default, the GBT-SCA use address 0x00.
    RX_CONTROL                 :std_logic_vector( 7 downto 0);  -- Reply: The control field is 1 byte in length and contains frame sequence numbers of the currently transmitted frame and the last correctly received frame. The control field is also used to convey three supervisory level commands: Connect, Reset, and Test.
    RX_TRANSID                 :std_logic_vector( 7 downto 0);  -- Reply: transaction ID field (According to the SCA manual)
    RX_ERR                     :std_logic_vector( 7 downto 0);  -- Reply: The Error Flag field is present in the channel reply frames to indicate error conditions encountered in the execution of a command. If no errors are found, its value is 0x00.
    RX_RECEIVED                :std_logic;                      -- Reply received flag (pulse)
    RX_CHANNEL                 :std_logic_vector( 7 downto 0);  -- Reply: The channel field specifies the destination interface of the request message (ctrl/spi/gpio/i2c/jtag/adc/dac).
    RX_DATA                    :std_logic_vector(31 downto 0);  -- Reply: The Data field is command dependent field whose length is defined by the length qualifier field. For example, in the case of a read/write operation on a GBT-SCA internal register, it contains the value written/read from the register.
  end record HAL_GBT_SC_RX_RX_MON_t;
  type HAL_GBT_SC_RX_RX_MON_t_ARRAY is array(0 to 2) of HAL_GBT_SC_RX_RX_MON_t;

  type HAL_GBT_SC_RX_MON_t is record
    RX                         :HAL_GBT_SC_RX_RX_MON_t_ARRAY;
  end record HAL_GBT_SC_RX_MON_t;


  type HAL_GBT_SC_MON_t is record
    RX_DATA_FROM_GBTX          :std_logic_vector( 7 downto 0);  -- Data from the FIFO
    TX_READY                   :std_logic;                      -- IC core ready for a transaction
    RX_EMPTY                   :std_logic;                      -- Rx FIFO is empty (no reply from GBTx)
    RX                         :HAL_GBT_SC_RX_MON_t;          
  end record HAL_GBT_SC_MON_t;


  type HAL_GBT_SC_CTRL_t is record
    TX_RESET                   :std_logic;     -- Reset TX datapath
    RX_RESET                   :std_logic;     -- Reset RX datapath
    TX_START_WRITE             :std_logic;     -- Request a write config to the GBTx (IC)
    TX_START_READ              :std_logic;     -- Request a read config to the GBTx (IC)
    TX_GBTX_ADDR               :std_logic_vector( 7 downto 0);  -- I2C address of the GBTx
    TX_REGISTER_ADDR           :std_logic_vector(15 downto 0);  -- Address of the first register to be accessed
    TX_NUM_BYTES_TO_READ       :std_logic_vector(15 downto 0);  -- Number of words/bytes to be read (only for read transactions)
    TX_DATA_TO_GBTX            :std_logic_vector( 7 downto 0);  -- Data to be written into the internal FIFO
    TX_WR                      :std_logic;                      -- Request a write operation into the internal FIFO (Data to GBTx)
    RX_RD                      :std_logic;                      -- Request a read operation of the internal FIFO (GBTx reply)
    TX_CMD                     :std_logic_vector( 7 downto 0);  -- Command: The Command field is present in the frames received by the SCA and indicates the operation to be performed. Meaning is specific to the channel.
    TX_ADDRESS                 :std_logic_vector( 7 downto 0);  -- Command: It represents the packet destination address. The address is one-byte long. By default, the GBT-SCA use address 0x00.
    TX_TRANSID                 :std_logic_vector( 7 downto 0);  -- Command: Specifies the message identification number. The reply messages generated by the SCA have the same transaction identifier of the request message allowing to associate the transmitted commands with the corresponding replies, permitting the concurrent use of all the SCA channels.  It is not required that ID values are ordered. ID values 0x00 and 0xff are reserved for interrupt packets generated spontaneously by the SCA and should not be used in requests.
    TX_CHANNEL                 :std_logic_vector( 7 downto 0);  -- Command: The channel field specifies the destination interface of the request message (ctrl/spi/gpio/i2c/jtag/adc/dac).
    TX_DATA                    :std_logic_vector(31 downto 0);  -- Command: data field (According to the SCA manual)
    SCA_ENABLE                 :std_logic_vector( 2 downto 0);  -- Enable flag to select SCAs
    START_RESET                :std_logic;                      -- Send a reset command to the enabled SCAs
    START_CONNECT              :std_logic;                      -- Send a connect command to the enabled SCAs
    START_COMMAND              :std_logic;                      -- Send the command set in input to the enabled SCAs
    INJ_CRC_ERR                :std_logic;                      -- Emulate a CRC error
  end record HAL_GBT_SC_CTRL_t;


  constant DEFAULT_HAL_GBT_SC_CTRL_t : HAL_GBT_SC_CTRL_t := (
                                                             TX_START_WRITE => '0',
                                                             TX_START_READ => '0',
                                                             TX_RESET => '0',
                                                             RX_RESET => '0',
                                                             TX_WR => '0',
                                                             RX_RD => '0',
                                                             START_RESET => '0',
                                                             START_CONNECT => '0',
                                                             START_COMMAND => '0',
                                                             INJ_CRC_ERR => '0',
                                                             SCA_ENABLE => "111",
                                                             TX_DATA_TO_GBTX => (others => '0'),
                                                             TX_CMD => (others => '0'),
                                                             TX_GBTX_ADDR => (others => '0'),
                                                             TX_ADDRESS => (others => '0'),
                                                             TX_REGISTER_ADDR => (others => '0'),
                                                             TX_TRANSID => (others => '0'),
                                                             TX_CHANNEL => (others => '0'),
                                                             TX_NUM_BYTES_TO_READ => (others => '0'),
                                                             TX_DATA => (others => '0')
                                                            );
  type HAL_GBT_MON_t is record
    SC                         :HAL_GBT_SC_MON_t;
  end record HAL_GBT_MON_t;


  type HAL_GBT_CTRL_t is record
    LINK_SEL                   :std_logic_vector( 7 downto 0);  -- Selects an LPGBT link to write to
    SEL_SLAVE                  :std_logic;                      -- Set to 1 to select the slave link (EC)
    BROADCAST                  :std_logic;                      -- Sends data to all LPGBTs (Master + Slave)
    SC                         :HAL_GBT_SC_CTRL_t;            
  end record HAL_GBT_CTRL_t;


  constant DEFAULT_HAL_GBT_CTRL_t : HAL_GBT_CTRL_t := (
                                                       LINK_SEL => (others => '0'),
                                                       SEL_SLAVE => '0',
                                                       BROADCAST => '0',
                                                       SC => DEFAULT_HAL_GBT_SC_CTRL_t
                                                      );
  type HAL_MON_t is record
    LPGBT_FPGA                 :HAL_LPGBT_FPGA_MON_t;
    GBT                        :HAL_GBT_MON_t;       
  end record HAL_MON_t;


  type HAL_CTRL_t is record
    LPGBT_FPGA                 :HAL_LPGBT_FPGA_CTRL_t;
    GBT                        :HAL_GBT_CTRL_t;       
  end record HAL_CTRL_t;


  constant DEFAULT_HAL_CTRL_t : HAL_CTRL_t := (
                                               LPGBT_FPGA => DEFAULT_HAL_LPGBT_FPGA_CTRL_t,
                                               GBT => DEFAULT_HAL_GBT_CTRL_t
                                              );


end package HAL_CTRL;