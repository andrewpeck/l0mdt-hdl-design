--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package HAL_CTRL is
  type HAL_GBT_SC_MON_t is record
    RX_DATA_FROM_GBTX          :std_logic_vector( 7 downto 0);
    TX_READY                   :std_logic;                    
    RX_EMPTY                   :std_logic;                    
    RX_LEN_0                   :std_logic_vector( 7 downto 0);
    RX_ADDRESS_0               :std_logic_vector( 7 downto 0);
    RX_CONTROL_0               :std_logic_vector( 7 downto 0);
    RX_TRANSID_0               :std_logic_vector( 7 downto 0);
    RX_ERR_0                   :std_logic_vector( 7 downto 0);
    RX_RECEIVED_0              :std_logic;                    
    RX_CHANNEL_0               :std_logic_vector( 7 downto 0);
    RX_DATA_0                  :std_logic_vector(31 downto 0);
    RX_LEN_1                   :std_logic_vector( 7 downto 0);
    RX_ADDRESS_1               :std_logic_vector( 7 downto 0);
    RX_CONTROL_1               :std_logic_vector( 7 downto 0);
    RX_TRANSID_1               :std_logic_vector( 7 downto 0);
    RX_ERR_1                   :std_logic_vector( 7 downto 0);
    RX_RECEIVED_1              :std_logic;                    
    RX_CHANNEL_1               :std_logic_vector( 7 downto 0);
    RX_DATA_1                  :std_logic_vector(31 downto 0);
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
    TX_CMD                     :std_logic_vector( 7 downto 0);
    TX_ADDRESS                 :std_logic_vector( 7 downto 0);
    TX_TRANSID                 :std_logic_vector( 7 downto 0);
    TX_CHANNEL                 :std_logic_vector( 7 downto 0);
    TX_DATA                    :std_logic_vector(31 downto 0);
    SCA_ENABLE                 :std_logic_vector( 1 downto 0);
    START_RESET                :std_logic;                    
    START_CONNECT              :std_logic;                    
    START_COMMAND              :std_logic;                    
    INJ_CRC_ERR                :std_logic;                    
  end record HAL_GBT_SC_CTRL_t;


  constant DEFAULT_HAL_GBT_SC_CTRL_t : HAL_GBT_SC_CTRL_t := (
                                                             TX_RESET => '0',
                                                             RX_RESET => '0',
                                                             TX_START_WRITE => '0',
                                                             TX_START_READ => '0',
                                                             TX_WR => '0',
                                                             RX_RD => '0',
                                                             START_RESET => '0',
                                                             START_CONNECT => '0',
                                                             START_COMMAND => '0',
                                                             INJ_CRC_ERR => '0',
                                                             SCA_ENABLE => "01",
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