library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;


library hal;
use hal.constants_pkg.all;
use hal.board_pkg_common.all;
use hal.link_map.all;

library hal_polmux;

entity tb_polmux is
  port(
    clock : in std_logic;
    clock_pipeline : in std_logic;
    reset : in  std_logic;
    i_tdc_hits_to_polmux_avt : in tdcpolmux2tar_avt(360-1 downto 0);
    
    ---- TDC Hits to TAR
    o_inn_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_INN -1 downto 0);
    o_mid_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_MID -1 downto 0);
    o_out_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_OUT -1 downto 0);
    o_ext_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_EXT -1 downto 0)
    );
end entity tb_polmux;



architecture beh of tb_polmux is
   type v_tdc_hits_to_polmux is array(3 downto 0) of tdcpolmux2tar_avt(c_HPS_MAX_HP_INN -1 downto 0);

  signal read_done_from_polmux : std_logic_vector (c_NUM_TDC_INPUTS-1 downto 0);

  --signal o_inn_tdc_hits_av   : tdcpolmux2tar_avt(c_HPS_MAX_HP_INN -1 downto 0);
  --signal  o_mid_tdc_hits_av  : tdcpolmux2tar_avt(c_HPS_MAX_HP_MID -1 downto 0);
  --signal  o_out_tdc_hits_av  : tdcpolmux2tar_avt(c_HPS_MAX_HP_OUT -1 downto 0);
  --signal  o_ext_tdc_hits_av  : tdcpolmux2tar_avt(c_HPS_MAX_HP_EXT -1 downto 0);




begin

assert false report "Constants set"
  & " c_NUM_TDC_INPUTS=" & integer'image(c_NUM_TDC_INPUTS)
  & " c_NUM_CSMS_ACTIVE=" & integer'image(c_NUM_CSMS_ACTIVE)
  & " c_NUM_POLMUX=" & integer'image(c_NUM_POLMUX)
  & " c_NUM_POLMUX_INNER=" & integer'image(c_NUM_POLMUX_INNER)
  & " c_NUM_POLMUX_MIDDLE=" & integer'image(c_NUM_POLMUX_MIDDLE)
  & " c_NUM_POLMUX_OUTER=" & integer'image(c_NUM_POLMUX_OUTER)
  & " c_NUM_POLMUX_EXTRA=" & integer'image(c_NUM_POLMUX_EXTRA)
  severity note;

-- tdc_hits_to_polmux(0) <= i_inn_tdc_hits_av;
-- tdc_hits_to_polmux(1) <= i_mid_tdc_hits_av;
-- tdc_hits_to_polmux(2) <= i_out_tdc_hits_av;
-- tdc_hits_to_polmux(3) <= i_ext_tdc_hits_av;
  
  -- 0 to 3, inner middle outer (no extra?)




  station_gen : for STATION in 0 to 3 generate
    constant polmux_hi_lo : hi_lo_array_t (c_NUM_POLMUX-1 downto 0) := get_polmux_hi_lo(c_MDT_CONFIG);

    constant num_polmuxes : int_array_t (0 to 3) := (c_NUM_POLMUX_INNER, c_NUM_POLMUX_MIDDLE,
                               c_NUM_POLMUX_OUTER, c_NUM_POLMUX_EXTRA);

    
  begin

  
    polmux_gen : for POLMUX in 0 to num_polmuxes(STATION)-1 generate
      constant id       : integer := get_polmux_global_id (c_MDT_CONFIG, POLMUX, stations(STATION));
      constant hi       : integer := polmux_hi_lo (id).hi;
      constant lo       : integer := polmux_hi_lo (id).lo;
      constant width    : integer := hi-lo+1;
      signal tdc_hits_o : tdcpolmux2tar_vt;
    begin



      assert false report "Generating PolMux #" & integer'image(POLMUX) 
        & " of " & integer'image(num_polmuxes(STATION)-1)
        & " Station=" & integer'image(STATION)
        & " ID=" & integer'image(id)
        & " width=" & integer'image(width)
        & " bithi=" & integer'image(hi)
        & " bitlo=" & integer'image(lo)
        severity note;

      polmux_wrapper_inst : entity hal_polmux.polmux_wrapper
        generic map (
          g_WIDTH       => width,             -- number of tdcs
          g_ID          => id,
          g_STATION     => stations(STATION),
          g_STATION_STR => stations_str(STATION)
          )
        port map (
          clock          => clock,  -- ZDM?
          pipeline_clock => clock, --clock_pipeline,
          reset          => reset,
          tdc_hits_i     => i_tdc_hits_to_polmux_avt(hi downto lo),
          read_done_o    => read_done_from_polmux (hi downto lo),
          tdc_hits_o     => tdc_hits_o
          );

      inner : if (STATION = 0) generate
        o_inn_tdc_hits_av(POLMUX) <= tdc_hits_o;
        --tdc_hits_i(c_HPS_MAX_HP_INN -1 downto 0) <= i_inn_tdc_hits_av;
      end generate;
      middle : if (STATION = 1) generate
        o_mid_tdc_hits_av(POLMUX) <= tdc_hits_o;
        --tdc_hits_i(c_HPS_MAX_HP_INN -1 downto 0) <= i_mid_tdc_hits_av;
      end generate;
      outer : if (STATION = 2) generate
        o_out_tdc_hits_av(POLMUX) <= tdc_hits_o;
        --tdc_hits_i(c_HPS_MAX_HP_INN -1 downto 0) <= i_mid_tdc_hits_av;
      end generate;
      extra : if (STATION = 3) generate
        o_ext_tdc_hits_av(POLMUX) <= tdc_hits_o;
        --tdc_hits_i(c_HPS_MAX_HP_INN -1 downto 0) <= i_mid_tdc_hits_av;

      end generate;

    end generate;

  end generate;

  
end architecture beh;


