--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package FW_INFO_CTRL is
  type FW_INFO_CONFIG_MON_t is record
    MAIN_CFG_COMPILE_HW        :std_logic;   
    MAIN_CFG_COMPILE_UL        :std_logic;   
    ST_nBARREL_ENDCAP          :std_logic;   
    ENDCAP_nSMALL_LARGE        :std_logic;   
    ENABLE_NEIGHBORS           :std_logic;   
    SECTOR_ID                  :std_logic_vector(31 downto 0);
    PHY_BARREL_R0              :std_logic_vector(31 downto 0);
    PHY_BARREL_R1              :std_logic_vector(31 downto 0);
    PHY_BARREL_R2              :std_logic_vector(31 downto 0);
    PHY_BARREL_R3              :std_logic_vector(31 downto 0);
    HPS_ENABLE_ST_INN          :std_logic;                    
    HPS_ENABLE_ST_EXT          :std_logic;                    
    HPS_ENABLE_ST_MID          :std_logic;                    
    HPS_ENABLE_ST_OUT          :std_logic;                    
    HPS_NUM_MDT_CH_INN         :std_logic_vector( 7 downto 0);
    HPS_NUM_MDT_CH_EXT         :std_logic_vector( 7 downto 0);
    HPS_NUM_MDT_CH_MID         :std_logic_vector( 7 downto 0);
    HPS_NUM_MDT_CH_OUT         :std_logic_vector( 7 downto 0);
    NUM_MTC                    :std_logic_vector( 7 downto 0);
    NUM_NSP                    :std_logic_vector( 7 downto 0);
    UCM_ENABLED                :std_logic;                    
    MPL_ENABLED                :std_logic;                    
    SF_ENABLED                 :std_logic;                    
    SF_TYPE                    :std_logic;                    
    NUM_DAQ_STREAMS            :std_logic_vector( 7 downto 0);
    NUM_SF_INPUTS              :std_logic_vector( 7 downto 0);
    NUM_SF_OUTPUTS             :std_logic_vector( 7 downto 0);
    MAX_NUM_SL                 :std_logic_vector( 7 downto 0);
    NUM_THREADS                :std_logic_vector( 7 downto 0);
  end record FW_INFO_CONFIG_MON_t;


  type FW_INFO_MON_t is record
    CONFIG                     :FW_INFO_CONFIG_MON_t;
  end record FW_INFO_MON_t;




end package FW_INFO_CTRL;