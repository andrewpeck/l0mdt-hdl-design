library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library ctrl_lib;
use ctrl_lib.hal_ctrl.all;
use ctrl_lib.axiRegPkg.all;

library shared_lib;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_types_pkg.all;

library hal;
use hal.all;
use hal.system_types_pkg.all;
use hal.lpgbt_pkg.all;
use hal.constants_pkg.all;
use hal.board_pkg.all;
use hal.link_map.all;

library tdc;
use tdc.csm_pkg.all;

entity csm is
  generic (
    g_NUM_DOWNLINKS : integer := 1;
    g_NUM_UPLINKS   : integer := 2;
    g_CSM_ID        : integer := 0;
    g_TDC_CNT       : integer := 18;
    g_ENABLE_MASK   : std_logic_vector;
    g_LEGACY_FLAG   : std_logic_vector
    );
  port(

    reset_i    : in std_logic;
    strobe_320 : in std_logic;
    clk40      : in std_logic;

    -- TTC
    trg_i : in std_logic;
    bcr_i : in std_logic;
    ecr_i : in std_logic;
    gsr_i : in std_logic;

    --------------------------------------------------------------------------------
    -- Downlink
    --------------------------------------------------------------------------------

    -- 320 Mhz Downlink Fabric Clock
    downlink_clk : in std_logic;

    -- 32 bits / bx to mgt
    downlink_mgt_word_array_o : out std32_array_t (g_NUM_DOWNLINKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- Uplink
    --------------------------------------------------------------------------------

    -- 320 MHz Uplink Fabric Clock
    uplink_clk : in std_logic;          -- 320 MHz

    -- 256 bits / bx from mgt
    uplink_mgt_word_array_i : in std32_array_t (g_NUM_UPLINKS-1 downto 0);

    -- bitslip flag to connect to mgt rxslide for alignment
    uplink_bitslip_o : out std_logic_vector (g_NUM_UPLINKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- TDC Data
    --------------------------------------------------------------------------------

    tdc_hits_to_polmux_o    : out mdt_polmux_bus_avt (g_TDC_CNT-1 downto 0);
    read_done_from_polmux_i : in  std_logic_vector (g_TDC_CNT-1 downto 0);

    ctrl : in  HAL_CSM_CSM_CTRL_t;
    mon  : out HAL_CSM_CSM_MON_t
    );
end csm;

architecture behavioral of csm is

  constant enc_elink : integer := CSM_ENC_DOWNLINK;

  -- TODO: right now it is using aux channels for all e-links, but 2/3 SCAs have both primary and
  -- aux connected. Add some way to switch?
  constant up0 : integer := CSM_SCA0_UP_AUX;
  constant up1 : integer := CSM_SCA0_UP_AUX;
  constant up2 : integer := CSM_SCA0_UP_AUX;

  constant down0 : integer := CSM_SCA0_DOWN_AUX;
  constant down1 : integer := CSM_SCA1_DOWN_AUX;
  constant down2 : integer := CSM_SCA2_DOWN_AUX;

  signal tdc_reset : std_logic;

  signal uplink_data  : lpgbt_uplink_data_rt_array (g_NUM_UPLINKS-1 downto 0);
  signal uplink_reset : std_logic_vector (g_NUM_UPLINKS-1 downto 0);
  signal uplink_ready : std_logic_vector (g_NUM_UPLINKS-1 downto 0);

  signal downlink_data  : lpgbt_downlink_data_rt_array (g_NUM_DOWNLINKS-1 downto 0);
  signal downlink_reset : std_logic_vector (g_NUM_DOWNLINKS-1 downto 0);
  signal downlink_ready : std_logic_vector (g_NUM_DOWNLINKS-1 downto 0);

  signal enc_o : std_logic := '0';

  signal sca0_up_8bit, sca1_up_8bit, sca2_up_8bit : std_logic_vector (7 downto 0);
  signal sca0_up, sca1_up, sca2_up                : std_logic_vector (1 downto 0);
  signal sca0_down, sca1_down, sca2_down          : std_logic_vector (1 downto 0);

begin

  dl_valid : for I in 0 to g_NUM_DOWNLINKS-1 generate
    downlink_data(I).valid <= strobe_320;
  end generate;

  -- TODO: ic/ec/sca broadcasting:
  -- broadcast is needed for dumping bitstreams and other configurations...
  -- the HDLC data streams idle to 11111
  -- if we AND the individual ic/ec data with a broadcast IC/ec data then the output
  -- datastream will correctly mux between the local and broadcast datastreams

  -- uplinks are mixed with other links, run at 320 Mbps
  -- sca0_up_8bit <= uplink_data(0).data(8*(CSM_SCA0_UP+1)-1 downto 8*(CSM_SCA0_UP));
  -- sca1_up_8bit <= uplink_data(0).data(8*(CSM_SCA1_UP+1)-1 downto 8*(CSM_SCA1_UP));
  -- sca2_up_8bit <= uplink_data(0).data(8*(CSM_SCA2_UP+1)-1 downto 8*(CSM_SCA2_UP));
  sca0_up_8bit <= bitsel(uplink_data(0).data, 8, CSM_SCA0_UP);
  sca1_up_8bit <= bitsel(uplink_data(0).data, 8, CSM_SCA1_UP);
  sca2_up_8bit <= bitsel(uplink_data(0).data, 8, CSM_SCA2_UP);

  sca0_up <= sca0_up_8bit(6) & sca0_up_8bit(2);
  sca1_up <= sca1_up_8bit(6) & sca1_up_8bit(2);
  sca2_up <= sca2_up_8bit(6) & sca2_up_8bit(2);

  -- downlinks are configured for 80 Mbps
  downlink_data(0).data(2*(CSM_SCA0_DOWN+1)-1 downto 2*(CSM_SCA0_DOWN)) <= sca0_down;
  downlink_data(0).data(2*(CSM_SCA1_DOWN+1)-1 downto 2*(CSM_SCA1_DOWN)) <= sca1_down;
  downlink_data(0).data(2*(CSM_SCA2_DOWN+1)-1 downto 2*(CSM_SCA2_DOWN)) <= sca2_down;

  gbt_controller_wrapper_inst : entity work.gbt_controller_wrapper
    generic map (g_SCAS_PER_LPGBT => 3)
    port map (

      reset_i => reset_i,
      clk40   => clk40,
      clk320  => uplink_clk,
      ctrl    => ctrl.sc,
      mon     => mon.sc,

      -- to lpgbt uplink
      ic_data_i => uplink_data(0).ic,
      ec_data_i => uplink_data(0).ec,

      -- to lpgbt downlink
      ic_data_o => downlink_data(0).ic,
      ec_data_o => downlink_data(0).ec,

      -- SCA Links
      sca0_data_i => sca0_up,
      sca1_data_i => sca1_up,
      sca2_data_i => sca2_up,

      sca0_data_o => sca0_down,
      sca1_data_o => sca1_down,
      sca2_data_o => sca2_down
      );

  --------------------------------------------------------------------------------
  -- ENC
  --------------------------------------------------------------------------------

  encoded_control_inst : entity tdc.encoded_control
    port map (
      clk_i => clk40,
      dav_i => '1',
      trg_i => trg_i,
      bcr_i => bcr_i,
      ecr_i => ecr_i,
      gsr_i => gsr_i,
      enc_o => enc_o                    -- puts out 1 bit every 25ns, needs 3 bx for a command
      );

  downlink_data(0).data((enc_elink+1)*2-1 downto 2*enc_elink) <= enc_o & enc_o;  -- 40 mb to 80 mb replication

  lpgbt_links_inst : entity work.lpgbt_link_wrapper
    generic map (
      g_DOWNLINK_WORD_WIDTH               => c_DOWNLINK_WORD_WIDTH,
      g_DOWNLINK_MULTICYCLE_DELAY         => c_DOWNLINK_MULTICYCLE_DELAY,
      g_DOWNLINK_CLOCK_RATIO              => c_DOWNLINK_CLOCK_RATIO,
      g_UPLINK_DATARATE                   => c_UPLINK_DATARATE,
      g_UPLINK_FEC                        => c_UPLINK_FEC,
      g_UPLINK_MULTICYCLE_DELAY           => c_UPLINK_MULTICYCLE_DELAY,
      g_UPLINK_CLOCK_RATIO                => c_UPLINK_CLOCK_RATIO,
      g_UPLINK_WORD_WIDTH                 => c_UPLINK_WORD_WIDTH,
      g_UPLINK_ALLOWED_FALSE_HEADER       => c_UPLINK_ALLOWED_FALSE_HEADER,
      g_UPLINK_ALLOWED_FALSE_HEADER_OVERN => c_UPLINK_ALLOWED_FALSE_HEADER_OVERN,
      g_UPLINK_REQUIRED_TRUE_HEADER       => c_UPLINK_REQUIRED_TRUE_HEADER,
      g_UPLINK_BITSLIP_MINDLY             => c_UPLINK_BITSLIP_MINDLY,
      g_UPLINK_BITSLIP_WAITDLY            => c_UPLINK_BITSLIP_WAITDLY,
      g_NUM_DOWNLINKS                     => g_NUM_DOWNLINKS,
      g_NUM_UPLINKS                       => g_NUM_UPLINKS,
      g_PIPELINE_BITSLIP                  => true,
      g_PIPELINE_LPGBT                    => true,
      g_PIPELINE_MGT                      => true)
    port map (
      reset => reset_i,                 -- TODO: axi OR

      uplink_mgt_word_array_i   => uplink_mgt_word_array_i,
      downlink_mgt_word_array_o => downlink_mgt_word_array_o,

      downlink_clk     => downlink_clk,
      downlink_reset_i => downlink_reset,

      downlink_data_i  => downlink_data,
      downlink_ready_o => downlink_ready,

      uplink_clk       => uplink_clk,
      uplink_reset_i   => uplink_reset,
      uplink_data_o    => uplink_data,
      uplink_ready_o   => uplink_ready,
      uplink_bitslip_o => uplink_bitslip_o,
      uplink_fec_err_o => open          -- TODO: connect to axi
      );

  --cnt_fecerr : entity work.counter
  --  generic map (width => COUNTER_WIDTH)
  --  port map (
  --    clk    => uplink_clk,
  --    reset  => '0',
  --    enable => '1',
  --    event  => ufec_err,
  --    count  => fec_err_cnt(I),
  --    at_max => open
  --    );


  ----------------------------------------------------------------------------------
  ---- AXI Control and Monitoring
  ----------------------------------------------------------------------------------

  --uplink_reset(I)                  <= ctrl.reset_uplinks or ctrl.uplink.uplink(I).reset;
  --mon.uplink.uplink(I).ready       <= uplink_ready(I);
  --mon.uplink.uplink(I).fec_err_cnt <= fec_err_cnt(I);
  tdc_decoder_wrapper_inst : entity work.tdc_decoder_wrapper
    generic map (
      -- FIXME: some way of overriding enable at the sub-csm level?
      g_ENABLE_MASK => g_ENABLE_MASK,
      g_LEGACY_FLAG => g_LEGACY_FLAG,
      g_CSM         => g_CSM_ID,
      g_NUM_TDCS    => g_TDC_CNT
      )
    port map (
      clock               => uplink_clk,
      reset               => tdc_reset,
      lpgbt_uplink_data_i => uplink_data,
      err_cnt_o           => open,
      tdc_hits_o          => tdc_hits_to_polmux_o,
      read_done_i         => read_done_from_polmux_i
      );

end behavioral;
