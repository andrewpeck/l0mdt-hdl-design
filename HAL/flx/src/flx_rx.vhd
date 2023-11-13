library ieee;
use ieee.std_logic_1164.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.config_pkg.all;

library flx;
use flx.lti_types_package.all;

entity flx_rx is
  port (rst_i                   : in  std_logic --! Active high reset
        ; clk240_i              : in  std_logic --! Recovered 240.474MHz clock from transceiver
        ; rxdata_vi              : in  std_logic_vector_array(C_DAQ_LINKS-1 downto 0)(31 downto 0) --! 8b10b decoded data
        ; rxcisk_vi              : in  std_logic_vector_array(C_DAQ_LINKS-1 downto 0)( 7 downto 0)  --! 8b10b CharIsK indication
        --
        ; mt_vo                  : out std_logic_vector(c_DAQ_LINKS-1 downto 0)
        ; pt_vo                  : out std_logic_vector(c_DAQ_LINKS-1 downto 0)
        ; partition_vo           : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(1 downto 0)
        ; bcid_vo                : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(11 downto 0)
        ; sync_user_data_vo      : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(15 downto 0)
        ; sync_global_data_vo    : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(15 downto 0)
        ; ts_vo                  : out std_logic_vector(c_DAQ_LINKS-1 downto 0)
        ; error_flags_vo         : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(3 downto 0)
        -- TTC Message
        ; sl0id_vo               : out std_logic_vector(c_DAQ_LINKS-1 downto 0)
        ; sorb_vo                : out std_logic_vector(c_DAQ_LINKS-1 downto 0)
        ; sync_vo                : out std_logic_vector(c_DAQ_LINKS-1 downto 0)
        ; grst_vo                : out std_logic_vector(c_DAQ_LINKS-1 downto 0)
        ; l0a_vo                 : out std_logic_vector(c_DAQ_LINKS-1 downto 0)
        ; l0id_vo                : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(37 downto 0)
        ; orbid_vo               : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(31 downto 0)
        ; trigger_type_vo        : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(15 downto 0)
        ; lbid_vo                : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(15 downto 0)
        -- User message
        ; async_user_data_vo     : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(63 downto 0)
        --
        ; lti_dec_aligned_vo     : out std_logic_vector(c_DAQ_LINKS-1 downto 0)
        ; lti_crc_valid_vo       : out std_logic_vector(c_DAQ_LINKS-1 downto 0)
        --
        ; clk40_ttc_vo           : out std_logic_vector(c_DAQ_LINKS-1 downto 0) --! TTC 40 MHz clock from clk240_rx_ttc_in
        ; clk40_ttc_ready_vo     : out std_logic_vector(c_DAQ_LINKS-1 downto 0));  --! Indication that 40 MHz clock is valid.

end flx_rx;


architecture logic of flx_rx is

begin

  GEN_LTITTC_WRAPPER : for ii in 0 to c_DAQ_LINKS-1 generate
    signal ttc                 : TTC_data_type;                --! Decoded record containing all available TTC inform
  begin

    u_ltittc_wrapper : entity work.ltittc_wrapper
      port map (reset_in              => rst_i                     -- : in  std_logic
                , clk240_in           => clk240_i                  -- : in  std_logic
                , linkaligned_in      => '1'                       -- : in  std_logic
                , rxdata_in           => rxdata_vi(ii)             -- : in  std_logic_vector(31 downto 0)
                , rxcharisk_in        => rxcisk_vi(ii)(3 downto 0) -- : in  std_logic_vector(3 downto 0)
                , TTC_out             => ttc                       -- : out TTC_data_type
                , clk40_ttc_out       => clk40_ttc_vo(ii)          -- : out std_logic
                , clk40_ttc_ready_out => clk40_ttc_ready_vo(ii));  -- : out std_logic);

    mt_vo(ii)               <= ttc.MT;
    pt_vo(ii)               <= ttc.PT;
    partition_vo(ii)        <= ttc.Partition;
    bcid_vo(ii)             <= ttc.BCID;
    sync_user_data_vo(ii)   <= ttc.SyncUserData;
    sync_global_data_vo(ii) <= ttc.SyncGlobalData;
    ts_vo(ii)               <= ttc.TS;
    error_flags_vo(ii)      <= ttc.ErrorFlags;
    sl0id_vo(ii)            <= ttc.SL0ID;
    sorb_vo(ii)             <= ttc.SOrb;
    sync_vo(ii)             <= ttc.Sync;
    grst_vo(ii)             <= ttc.GRst;
    l0a_vo(ii)              <= ttc.L0A;
    l0id_vo(ii)             <= ttc.L0ID;
    orbid_vo(ii)            <= ttc.OrbitID;
    trigger_type_vo(ii)     <= ttc.TriggerType;
    lbid_vo(ii)             <= ttc.LBID;
    lti_crc_valid_vo(ii)    <= ttc.LTI_CRC_valid;
    lti_dec_aligned_vo(ii)  <= ttc.LTI_decoder_aligned;
    async_user_data_vo(ii)  <= ttc.AsyncUserData;

  end generate GEN_LTITTC_WRAPPER;

end logic;
