--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package HAL_CTRL is
  type HAL_GBT_SC_RX_RX0_MON_t is record
    RX_LEN                     :std_logic_vector( 7 downto 0);  -- Reply: The length qualifier field specifies the number of bytes contained in the DATA field.
    RX_ADDRESS                 :std_logic_vector( 7 downto 0);  -- Reply: It represents the packet destination address. The address is one-bytelong. By default, the GBT-SCA use address 0x00.
    RX_CONTROL                 :std_logic_vector( 7 downto 0);  -- Reply: The control field is 1 byte in length and contains frame sequence numbers of the currently transmitted frame and the last correctly received frame. The control field is also used to convey three supervisory level commands: Connect, Reset, and Test.
    RX_TRANSID                 :std_logic_vector( 7 downto 0);  -- Reply: transaction ID field (According to the SCA manual)
    RX_ERR                     :std_logic_vector( 7 downto 0);  -- Reply: The Error Flag field is present in the channel reply frames to indicate error conditions encountered in the execution of a command. If no errors are found, its value is 0x00.
    RX_RECEIVED                :std_logic;                      -- Reply received flag (pulse)
    RX_CHANNEL                 :std_logic_vector( 7 downto 0);  -- Reply: The channel field specifies the destination interface of the request message (ctrl/spi/gpio/i2c/jtag/adc/dac).
    RX_DATA                    :std_logic_vector(31 downto 0);  -- Reply: The Data field is command dependent field whose length is defined by the length qualifier field. For example, in the case of a read/write operation on a GBT-SCA internal register, it contains the value written/read from the register.
  end record HAL_GBT_SC_RX_RX0_MON_t;


  type HAL_GBT_SC_RX_RX1_MON_t is record
    RX_LEN                     :std_logic_vector( 7 downto 0);  -- Reply: The length qualifier field specifies the number of bytes contained in the DATA field.
    RX_ADDRESS                 :std_logic_vector( 7 downto 0);  -- Reply: It represents the packet destination address. The address is one-bytelong. By default, the GBT-SCA use address 0x00.
    RX_CONTROL                 :std_logic_vector( 7 downto 0);  -- Reply: The control field is 1 byte in length and contains frame sequence numbers of the currently transmitted frame and the last correctly received frame. The control field is also used to convey three supervisory level commands: Connect, Reset, and Test.
    RX_TRANSID                 :std_logic_vector( 7 downto 0);  -- Reply: transaction ID field (According to the SCA manual)
    RX_ERR                     :std_logic_vector( 7 downto 0);  -- Reply: The Error Flag field is present in the channel reply frames to indicate error conditions encountered in the execution of a command. If no errors are found, its value is 0x00.
    RX_RECEIVED                :std_logic;                      -- Reply received flag (pulse)
    RX_CHANNEL                 :std_logic_vector( 7 downto 0);  -- Reply: The channel field specifies the destination interface of the request message (ctrl/spi/gpio/i2c/jtag/adc/dac).
    RX_DATA                    :std_logic_vector(31 downto 0);  -- Reply: The Data field is command dependent field whose length is defined by the length qualifier field. For example, in the case of a read/write operation on a GBT-SCA internal register, it contains the value written/read from the register.
  end record HAL_GBT_SC_RX_RX1_MON_t;


  type HAL_GBT_SC_RX_RX2_MON_t is record
    RX_LEN                     :std_logic_vector( 7 downto 0);  -- Reply: The length qualifier field specifies the number of bytes contained in the DATA field.
    RX_ADDRESS                 :std_logic_vector( 7 downto 0);  -- Reply: It represents the packet destination address. The address is one-bytelong. By default, the GBT-SCA use address 0x00.
    RX_CONTROL                 :std_logic_vector( 7 downto 0);  -- Reply: The control field is 1 byte in length and contains frame sequence numbers of the currently transmitted frame and the last correctly received frame. The control field is also used to convey three supervisory level commands: Connect, Reset, and Test.
    RX_TRANSID                 :std_logic_vector( 7 downto 0);  -- Reply: transaction ID field (According to the SCA manual)
    RX_ERR                     :std_logic_vector( 7 downto 0);  -- Reply: The Error Flag field is present in the channel reply frames to indicate error conditions encountered in the execution of a command. If no errors are found, its value is 0x00.
    RX_RECEIVED                :std_logic;                      -- Reply received flag (pulse)
    RX_CHANNEL                 :std_logic_vector( 7 downto 0);  -- Reply: The channel field specifies the destination interface of the request message (ctrl/spi/gpio/i2c/jtag/adc/dac).
    RX_DATA                    :std_logic_vector(31 downto 0);  -- Reply: The Data field is command dependent field whose length is defined by the length qualifier field. For example, in the case of a read/write operation on a GBT-SCA internal register, it contains the value written/read from the register.
  end record HAL_GBT_SC_RX_RX2_MON_t;


  type HAL_GBT_SC_RX_MON_t is record
    RX0                        :HAL_GBT_SC_RX_RX0_MON_t;
    RX1                        :HAL_GBT_SC_RX_RX1_MON_t;
    RX2                        :HAL_GBT_SC_RX_RX2_MON_t;
  end record HAL_GBT_SC_RX_MON_t;


  type HAL_GBT_SC_MON_t is record
    RX_DATA_FROM_GBTX          :std_logic_vector( 7 downto 0);
    TX_READY                   :std_logic;                    
    RX_EMPTY                   :std_logic;                    
    RX                         :HAL_GBT_SC_RX_MON_t;          
  end record HAL_GBT_SC_MON_t;


  type HAL_GBT_SC_CTRL_t is record
    TX_RESET                   :std_logic;   
    RX_RESET                   :std_logic;   
    TX_START_WRITE             :std_logic;   
    TX_START_READ              :std_logic;   
    TX_GBTX_ADDR               :std_logic_vector( 7 downto 0);
    TX_REGISTER_ADDR           :std_logic_vector(15 downto 0);
    TX_NUM_BYTES_TO_READ       :std_logic_vector(15 downto 0);
    TX_DATA_TO_GBTX            :std_logic_vector( 7 downto 0);
    TX_WR                      :std_logic;                    
    RX_RD                      :std_logic;                    
    TX_CMD                     :std_logic_vector( 7 downto 0);  -- Command: The Command field is present in the frames received by the SCA and indicates the operation to be performed. Meaning is specific to the channel.
    TX_ADDRESS                 :std_logic_vector( 7 downto 0);  -- Command: It represents the packet destination address. The address is one-bytelong. By default, the GBT-SCA use address 0x00.
    TX_TRANSID                 :std_logic_vector( 7 downto 0);  -- Command: Specifies the message identification number. The reply messages generated by the SCA have the same transaction identifier of the request message allowing to associate the transmitted commands with the corresponding replies, permitting the concurrent use of all the SCA channels.  It is not required that ID values are ordered. ID values 0x00 and 0xff are reserved for interrupt packets generated spontaneously by the SCA and should not be used in requests.
    TX_CHANNEL                 :std_logic_vector( 7 downto 0);  -- Command: The channel field specifies the destination interface of the request message (ctrl/spi/gpio/i2c/jtag/adc/dac).
    TX_DATA                    :std_logic_vector(31 downto 0);  -- Command: data field (According to the SCA manual)
    SCA_ENABLE                 :std_logic_vector( 2 downto 0);
    START_RESET                :std_logic;                    
    START_CONNECT              :std_logic;                    
    START_COMMAND              :std_logic;                    
    INJ_CRC_ERR                :std_logic;                    
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
                                                             SCA_ENABLE => "000",
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
    RESET                      :std_logic;   
    LINK_SEL                   :std_logic_vector( 7 downto 0);
    SEL_SLAVE                  :std_logic;                    
    BROADCAST                  :std_logic;                    
    SCA_SEL                    :std_logic;                    
    SCA_BROADCAST              :std_logic;                    
    SC                         :HAL_GBT_SC_CTRL_t;            
  end record HAL_GBT_CTRL_t;


  constant DEFAULT_HAL_GBT_CTRL_t : HAL_GBT_CTRL_t := (
                                                       RESET => '0',
                                                       LINK_SEL => (others => '0'),
                                                       SEL_SLAVE => '0',
                                                       BROADCAST => '0',
                                                       SCA_SEL => '0',
                                                       SCA_BROADCAST => '0',
                                                       SC => DEFAULT_HAL_GBT_SC_CTRL_t
                                                      );
  type HAL_MON_t is record
    GBT                        :HAL_GBT_MON_t;
  end record HAL_MON_t;


  type HAL_CTRL_t is record
    GBT                        :HAL_GBT_CTRL_t;
  end record HAL_CTRL_t;


  constant DEFAULT_HAL_CTRL_t : HAL_CTRL_t := (
                                               GBT => DEFAULT_HAL_GBT_CTRL_t
                                              );


end package HAL_CTRL;