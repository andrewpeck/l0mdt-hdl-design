library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

-- library ctrl_lib;
-- use ctrl_lib.DAQ_CTRL.all;

library l0mdt;

library daq_lib;
library daq_core;

-- library ttc_def;
-- library daq_def;
-- library daq_lib;

-- use ttc_def.ttc_defs.all;

-- use daq_def.daq_config_defs.all;
-- use daq_def.daq_defs.all;

entity daq is
  -- generic (DELAY : integer; memory_type: string);
  port (
    -- clock and control
    clock_and_control : in  l0mdt_control_rt;
    ttc_commands      : in  l0mdt_ttc_rt;
    ctrl_v            : in  std_logic_vector; -- : in  DAQ_CTRL_t;
    mon_v             : out std_logic_vector;-- : out DAQ_MON_t;
    ----------------------------------------------------------------------
    i_flags           : in  std_logic_vector(6 downto 0);
    i_ec              : in  std_logic;
    i_sector_id       : in  std_logic_vector(3 downto 0);
    i_frag_id         : in  std_logic_vector(3 downto 0);
    ----------------------------------------------------------------------
    i_inn_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_MAX_HP_INN-1 downto 0);
    i_mid_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_MAX_HP_MID-1 downto 0);
    i_out_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_MAX_HP_OUT-1 downto 0);
    i_ext_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_MAX_HP_EXT-1 downto 0);
    o_daq_streams     : out felix_stream_avt(c_DAQ_LINKS-1 downto 0)
    -- o_sump            : out std_logic
  );
end entity daq;

architecture behavioral of daq is


  signal i_ctrl_opening_offset : unsigned(11 downto 0);
  signal i_ctrl_request_offset : unsigned(11 downto 0);
  signal i_ctrl_closing_offset : unsigned(11 downto 0);
  signal i_ctrl_timeout_window : unsigned(11 downto 0);

  signal req_stable       : std_logic;
  signal req_valid        : std_logic;
  
  signal req_strb          : std_logic;
  signal win_opening_cnt      : unsigned(11 downto 0);
  signal win_request_cnt      : unsigned(11 downto 0);
  signal win_closing_cnt      : unsigned(11 downto 0);
  signal win_timeout_cnt      : unsigned(11 downto 0);
  signal win_opening_offset   : unsigned(11 downto 0);
  signal win_request_offset   : unsigned(11 downto 0);
  signal win_closing_offset   : unsigned(11 downto 0);
  signal win_timeout_window   : unsigned(11 downto 0);

  signal event_id              : unsigned(31 downto 0);


  signal inner_flx_streams_hfull_bus   : std_logic_vector(0 to c_DAQ_INN_LINKS-1);
  signal inner_flx_streams_wr_strb_bus : std_logic_vector(0 to c_DAQ_INN_LINKS-1);
  signal inner_flx_streams_ctrl_bus    : std_logic_vector_array(0 to c_DAQ_INN_LINKS-1)(1 downto 0);
  signal inner_flx_streams_payload_bus : std_logic_vector_array(0 to c_DAQ_INN_LINKS-1)(31 downto 0);

  signal middle_flx_streams_hfull_bus   : std_logic_vector(0 to c_DAQ_MID_LINKS-1);
  signal middle_flx_streams_wr_strb_bus : std_logic_vector(0 to c_DAQ_MID_LINKS-1);
  signal middle_flx_streams_ctrl_bus    : std_logic_vector_array(0 to c_DAQ_MID_LINKS-1)(1 downto 0);
  signal middle_flx_streams_payload_bus : std_logic_vector_array(0 to c_DAQ_MID_LINKS-1)(31 downto 0);

  signal outer_flx_streams_hfull_bus   : std_logic_vector(0 to c_DAQ_OUT_LINKS-1);
  signal outer_flx_streams_wr_strb_bus : std_logic_vector(0 to c_DAQ_OUT_LINKS-1);
  signal outer_flx_streams_ctrl_bus    : std_logic_vector_array(0 to c_DAQ_OUT_LINKS-1)(1 downto 0);
  signal outer_flx_streams_payload_bus : std_logic_vector_array(0 to c_DAQ_OUT_LINKS-1)(31 downto 0);

  signal extra_flx_streams_hfull_bus   : std_logic_vector(0 to c_DAQ_EXT_LINKS-1);
  signal extra_flx_streams_wr_strb_bus : std_logic_vector(0 to c_DAQ_EXT_LINKS-1);
  signal extra_flx_streams_ctrl_bus    : std_logic_vector_array(0 to c_DAQ_EXT_LINKS-1)(1 downto 0);
  signal extra_flx_streams_payload_bus : std_logic_vector_array(0 to c_DAQ_EXT_LINKS-1)(31 downto 0);

  signal sys_hdr : std_logic_vector(31 downto 0);

  constant INNER_USR_HDR  : std_logic_vector(15 downto 0) := x"AAAA";
  constant MIDDLE_USR_HDR : std_logic_vector(15 downto 0) := x"BBBB";
  constant OUTER_USR_HDR  : std_logic_vector(15 downto 0) := x"CCCC";
  constant EXTRA_USR_HDR  : std_logic_vector(15 downto 0) := x"DDDD";

  signal daq_streams_ar : felix_stream_art(c_DAQ_LINKS-1 downto 0);
  signal daq_streams_v  : std_logic_vector(daq_streams_ar'length*felix_stream_rt'w-1 downto 0);
    
  -- emulation

  -- -- signal ptcalc_sump         : std_logic_vector (c_NUM_THREADS -1 downto 0);
  -- -- signal pl2mtc_sump         : std_logic_vector (c_MAX_NUM_SL -1 downto 0);
  -- -- signal tdc_hit_inner_sump  : std_logic_vector (c_HPS_MAX_HP_INN-1 downto 0);
  -- -- signal tdc_hit_middle_sump : std_logic_vector (c_HPS_MAX_HP_MID-1 downto 0);
  -- -- signal tdc_hit_outer_sump  : std_logic_vector (c_HPS_MAX_HP_OUT-1 downto 0);
  -- -- signal tdc_hit_extra_sump  : std_logic_vector (c_HPS_MAX_HP_EXT-1 downto 0);

  -- implementation


  function streamify_output (wr_strb_bus : std_logic_vector;
                             ctrl_bus    : std_logic_vector_array;
                             payload_bus : std_logic_vector_array) return felix_stream_art is
    variable y : felix_stream_art(wr_strb_bus'range);
  begin
    for ii in wr_strb_bus'range loop
      y(ii).valid := wr_strb_bus(ii);
      y(ii).data := ctrl_bus(ii) & payload_bus(ii);
    end loop;
    return y;
  end function streamify_output;
  
begin


  daq_streams_v <= convert(daq_streams_ar, daq_streams_v);
  o_daq_streams <= convert(daq_streams_v, o_daq_streams);

  DAQ_GEN : if c_DAQ_ENABLED generate

    sys_hdr <= "00"
               & std_logic_vector(ttc_commands.orid(1 downto 0))
               & std_logic_vector(win_request_cnt)
               & i_flags
               & i_ec
               & i_sector_id
               & i_frag_id;

    u_daq_req : entity daq_core.daq_req
      port map (i_sys_clk_fast => clock_and_control.clk,
                i_sys_rst      => clock_and_control.rst,
                i_sys_bx       => clock_and_control.bx,
                ------------------------------------------------------------------
                i_lxa_strb => ttc_commands.l0a,
                i_ecr_strb => ttc_commands.ecr,
                i_bcid_cnt => ttc_commands.bcid,
                o_event_id => event_id,
                ------------------------------------------------------------------
                i_ctrl_opening_offset => i_ctrl_opening_offset,
                i_ctrl_request_offset => i_ctrl_request_offset,
                i_ctrl_closing_offset => i_ctrl_closing_offset,
                i_ctrl_timeout_window => i_ctrl_timeout_window,
                ------------------------------------------------------------------
                o_status_stable => req_stable,
                o_status_valid  => req_valid,
                ------------------------------------------------------------------
                o_wm_wr_strb        => req_strb,
                o_wm_opening_cnt    => win_opening_cnt,
                o_wm_request_cnt    => win_request_cnt,
                o_wm_closing_cnt    => win_closing_cnt,
                o_wm_timeout_cnt    => win_timeout_cnt,
                o_wm_opening_offset => win_opening_offset,
                o_wm_request_offset => win_request_offset,
                o_wm_closing_offset => win_closing_offset,
                o_wm_timeout_window => win_timeout_window);


    GEN_INNER : if c_DAQ_INN_LINKS > 0 generate
    
        u_daq_inner :  entity daq_lib.daq_station
          generic map (g_DELAY        =>             100, -- : integer := 100; -- number of LHC clocks
                       g_PIPELINES    =>              32, -- : integer :=  32;
                       g_OUTPUT_LINKS => c_DAQ_INN_LINKS) -- : integer := 3); 
          port map (clock_and_control                 => clock_and_control                , -- : in  l0mdt_control_rt;
                    ttc_commands                      => ttc_commands                     , -- : in  l0mdt_ttc_rt;
                    -- ctrl_v                                                             , -- : in std_logic_vector; -- : in  DAQ_CTRL_t;
                    -- mon_v                                                              , -- : out std_logic_vector;-- : out DAQ_MON_t;
                    ---------------------------------------------------------------------------------------------------
                    i_req_strb                        => req_strb                         , -- : in std_logic;
                    i_req_stable                      => req_stable                       , -- : in std_logic;
                    i_win_opening_cnt                 => win_opening_cnt                  , -- : in unsigned(11 downto 0);
                    i_win_request_cnt                 => win_request_cnt                  , -- : in unsigned(11 downto 0);
                    i_win_closing_cnt                 => win_closing_cnt                  , -- : in unsigned(11 downto 0);
                    i_win_timeout_cnt                 => win_timeout_cnt                  , -- : in unsigned(11 downto 0);
                    ---------------------------------------------------------------------------------------------------
                    i_win_opening_offset              => win_opening_offset               , -- : in unsigned(11 downto 0);
                    i_win_request_offset              => win_request_offset               , -- : in unsigned(11 downto 0);
                    i_win_closing_offset              => win_closing_offset               , -- : in unsigned(11 downto 0);
                    i_win_timeout_window              => win_timeout_window               , -- : in unsigned(11 downto 0);
                    ---------------------------------------------------------------------------------------------------
                    i_bcid_cnt                        => ttc_commands.bcid                , -- : in unsigned(11 downto 0);
                    ---------------------------------------------------------------------------------------------------
                    i_event_id                        => event_id                         , -- : in unsigned(31 downto 0);
                    ---------------------------------------------------------------------------------------------------
                    i_sys_hdr                         => sys_hdr                          , -- : in  std_logic_vector := (31 downto 0 => '0');
                    i_station_usr_hdr                 => INNER_USR_HDR                    , -- : in  std_logic_vector := (15 downto 0 => '0');
                    i_station_tdc_hits_av             => i_inn_tdc_hits_av                , -- : in  tdcpolmux2tar_avt := (5 downto 0 => (tdcpolmux2tar_vt'range => '0'));
                    ---------------------------------------------------------------------------------------------------
                    i_station_flx_streams_hfull_bus   => inner_flx_streams_hfull_bus  , -- : in  std_logic_vector(0 to g_OUTPUT_LINKS-1);
                    o_station_flx_streams_wr_strb_bus => inner_flx_streams_wr_strb_bus, -- : out std_logic_vector(0 to g_OUTPUT_LINKS-1);
                    o_station_flx_streams_ctrl_bus    => inner_flx_streams_ctrl_bus   , -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(1 downto 0);
                    o_station_flx_streams_payload_bus => inner_flx_streams_payload_bus); -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(31 downto 0));
        
        daq_streams_ar(c_DAQ_INN_LINKS-1 downto 0)
          <= streamify_output(inner_flx_streams_wr_strb_bus, inner_flx_streams_ctrl_bus, inner_flx_streams_payload_bus);
        
    end generate GEN_INNER;
    
    GEN_MIDDLE : if c_DAQ_MID_LINKS > 0 generate
        
      u_daq_middle :  entity daq_lib.daq_station
        generic map (g_DELAY        =>             100, -- : integer := 100; -- number of LHC clocks
                     g_PIPELINES    =>              32, -- : integer :=  32;
                     g_OUTPUT_LINKS => c_DAQ_MID_LINKS) -- : integer := 3); 
        port map (clock_and_control                 => clock_and_control                , -- : in  l0mdt_control_rt;
                  ttc_commands                      => ttc_commands                     , -- : in  l0mdt_ttc_rt;
                  -- ctrl_v                                                             , -- : in std_logic_vector; -- : in  DAQ_CTRL_t;
                  -- mon_v                                                              , -- : out std_logic_vector;-- : out DAQ_MON_t;
                  ---------------------------------------------------------------------------------------------------
                  i_req_strb                        => req_strb                         , -- : in std_logic;
                  i_req_stable                      => req_stable                       , -- : in std_logic;
                  i_win_opening_cnt                 => win_opening_cnt                  , -- : in unsigned(11 downto 0);
                  i_win_request_cnt                 => win_request_cnt                  , -- : in unsigned(11 downto 0);
                  i_win_closing_cnt                 => win_closing_cnt                  , -- : in unsigned(11 downto 0);
                  i_win_timeout_cnt                 => win_timeout_cnt                  , -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_win_opening_offset              => win_opening_offset               , -- : in unsigned(11 downto 0);
                  i_win_request_offset              => win_request_offset               , -- : in unsigned(11 downto 0);
                  i_win_closing_offset              => win_closing_offset               , -- : in unsigned(11 downto 0);
                  i_win_timeout_window              => win_timeout_window               , -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_bcid_cnt                        => ttc_commands.bcid                , -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_event_id                        => event_id                         , -- : in unsigned(31 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_sys_hdr                         => sys_hdr                          , -- : in  std_logic_vector := (31 downto 0 => '0');
                  i_station_usr_hdr                 => MIDDLE_USR_HDR                    , -- : in  std_logic_vector := (15 downto 0 => '0');
                  i_station_tdc_hits_av             => i_mid_tdc_hits_av                , -- : in  tdcpolmux2tar_avt := (5 downto 0 => (tdcpolmux2tar_vt'range => '0'));
                  ---------------------------------------------------------------------------------------------------
                  i_station_flx_streams_hfull_bus   => middle_flx_streams_hfull_bus  , -- : in  std_logic_vector(0 to g_OUTPUT_LINKS-1);
                  o_station_flx_streams_wr_strb_bus => middle_flx_streams_wr_strb_bus, -- : out std_logic_vector(0 to g_OUTPUT_LINKS-1);
                  o_station_flx_streams_ctrl_bus    => middle_flx_streams_ctrl_bus   , -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(1 downto 0);
                  o_station_flx_streams_payload_bus => middle_flx_streams_payload_bus); -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(31 downto 0));

      daq_streams_ar(c_DAQ_INN_LINKS+c_DAQ_MID_LINKS-1 downto c_DAQ_INN_LINKS)
        <= streamify_output(middle_flx_streams_wr_strb_bus, middle_flx_streams_ctrl_bus, middle_flx_streams_payload_bus);

    end generate GEN_MIDDLE;

    GEN_OUTER : if c_DAQ_OUT_LINKS > 0 generate
      
      u_daq_outer :  entity daq_lib.daq_station
        generic map (g_DELAY        =>             100, -- : integer := 100; -- number of LHC clocks
                     g_PIPELINES    =>              32, -- : integer :=  32;
                     g_OUTPUT_LINKS => c_DAQ_OUT_LINKS) -- : integer := 3); 
        port map (clock_and_control                 => clock_and_control                , -- : in  l0mdt_control_rt;
                  ttc_commands                      => ttc_commands                     , -- : in  l0mdt_ttc_rt;
                  -- ctrl_v                                                             , -- : in std_logic_vector; -- : in  DAQ_CTRL_t;
                  -- mon_v                                                              , -- : out std_logic_vector;-- : out DAQ_MON_t;
                  ---------------------------------------------------------------------------------------------------
                  i_req_strb                        => req_strb                         , -- : in std_logic;
                  i_req_stable                      => req_stable                       , -- : in std_logic;
                  i_win_opening_cnt                 => win_opening_cnt                  , -- : in unsigned(11 downto 0);
                  i_win_request_cnt                 => win_request_cnt                  , -- : in unsigned(11 downto 0);
                  i_win_closing_cnt                 => win_closing_cnt                  , -- : in unsigned(11 downto 0);
                  i_win_timeout_cnt                 => win_timeout_cnt                  , -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_win_opening_offset              => win_opening_offset               , -- : in unsigned(11 downto 0);
                  i_win_request_offset              => win_request_offset               , -- : in unsigned(11 downto 0);
                  i_win_closing_offset              => win_closing_offset               , -- : in unsigned(11 downto 0);
                  i_win_timeout_window              => win_timeout_window               , -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_bcid_cnt                        => ttc_commands.bcid                , -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_event_id                        => event_id                         , -- : in unsigned(31 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_sys_hdr                         => sys_hdr                          , -- : in  std_logic_vector := (31 downto 0 => '0');
                  i_station_usr_hdr                 => OUTER_USR_HDR                    , -- : in  std_logic_vector := (15 downto 0 => '0');
                  i_station_tdc_hits_av             => i_out_tdc_hits_av                , -- : in  tdcpolmux2tar_avt := (5 downto 0 => (tdcpolmux2tar_vt'range => '0'));
                  ---------------------------------------------------------------------------------------------------
                  i_station_flx_streams_hfull_bus   => outer_flx_streams_hfull_bus  , -- : in  std_logic_vector(0 to g_OUTPUT_LINKS-1);
                  o_station_flx_streams_wr_strb_bus => outer_flx_streams_wr_strb_bus, -- : out std_logic_vector(0 to g_OUTPUT_LINKS-1);
                  o_station_flx_streams_ctrl_bus    => outer_flx_streams_ctrl_bus   , -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(1 downto 0);
                  o_station_flx_streams_payload_bus => outer_flx_streams_payload_bus); -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(31 downto 0));

      daq_streams_ar(c_DAQ_INN_LINKS+c_DAQ_MID_LINKS+c_DAQ_OUT_LINKS-1 downto c_DAQ_INN_LINKS+c_DAQ_MID_LINKS)
        <= streamify_output(outer_flx_streams_wr_strb_bus, outer_flx_streams_ctrl_bus, outer_flx_streams_payload_bus);

    end generate GEN_OUTER;

    GEN_EXTRA: if c_DAQ_EXT_LINKS > 0 generate
      u_daq_extra :  entity daq_lib.daq_station
        generic map (g_DELAY        =>             100, -- : integer := 100; -- number of LHC clocks
                     g_PIPELINES    =>              32, -- : integer :=  32;
                     g_OUTPUT_LINKS => c_DAQ_ext_LINKS) -- : integer := 3); 
        port map (clock_and_control                 => clock_and_control                , -- : in  l0mdt_control_rt;
                  ttc_commands                      => ttc_commands                     , -- : in  l0mdt_ttc_rt;
                  -- ctrl_v                                                             , -- : in std_logic_vector; -- : in  DAQ_CTRL_t;
                  -- mon_v                                                              , -- : out std_logic_vector;-- : out DAQ_MON_t;
                  ---------------------------------------------------------------------------------------------------
                  i_req_strb                        => req_strb                         , -- : in std_logic;
                  i_req_stable                      => req_stable                       , -- : in std_logic;
                  i_win_opening_cnt                 => win_opening_cnt                  , -- : in unsigned(11 downto 0);
                  i_win_request_cnt                 => win_request_cnt                  , -- : in unsigned(11 downto 0);
                  i_win_closing_cnt                 => win_closing_cnt                  , -- : in unsigned(11 downto 0);
                  i_win_timeout_cnt                 => win_timeout_cnt                  , -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_win_opening_offset              => win_opening_offset               , -- : in unsigned(11 downto 0);
                  i_win_request_offset              => win_request_offset               , -- : in unsigned(11 downto 0);
                  i_win_closing_offset              => win_closing_offset               , -- : in unsigned(11 downto 0);
                  i_win_timeout_window              => win_timeout_window               , -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_bcid_cnt                        => ttc_commands.bcid                , -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_event_id                        => event_id                         , -- : in unsigned(31 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_sys_hdr                         => sys_hdr                          , -- : in  std_logic_vector := (31 downto 0 => '0');
                  i_station_usr_hdr                 => EXTRA_USR_HDR                    , -- : in  std_logic_vector := (15 downto 0 => '0');
                  i_station_tdc_hits_av             => i_ext_tdc_hits_av                , -- : in  tdcpolmux2tar_avt := (5 downto 0 => (tdcpolmux2tar_vt'range => '0'));
                  ---------------------------------------------------------------------------------------------------
                  i_station_flx_streams_hfull_bus   => extra_flx_streams_hfull_bus  , -- : in  std_logic_vector(0 to g_OUTPUT_LINKS-1);
                  o_station_flx_streams_wr_strb_bus => extra_flx_streams_wr_strb_bus, -- : out std_logic_vector(0 to g_OUTPUT_LINKS-1);
                  o_station_flx_streams_ctrl_bus    => extra_flx_streams_ctrl_bus   , -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(1 downto 0);
                  o_station_flx_streams_payload_bus => extra_flx_streams_payload_bus); -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(31 downto 0));


      daq_streams_ar(c_DAQ_INN_LINKS+c_DAQ_MID_LINKS+c_DAQ_out_LINKS+c_DAQ_ext_LINKS-1 downto c_DAQ_INN_LINKS+c_DAQ_MID_LINKS+c_DAQ_out_LINKS)
        <= streamify_output(extra_flx_streams_wr_strb_bus, extra_flx_streams_ctrl_bus, extra_flx_streams_payload_bus);

    end generate GEN_EXTRA;


    
      
  end generate DAQ_GEN;
                
  -- -- DAQ_EMU : if not c_DAQ_ENABLED generate
  -- -- end generate;

  -------------------------------------------------------------------------

  --# Thu 29 Dec 2022 11:54:35 PM -03
  --# ctrl2mon : entity shared_lib.vhdl_utils_deserializer 
  --#   generic map (g_DATA_WIDTH => mon_v'length) 
  --#   port map(
  --#     clk     => clock_and_control.clk,
  --#     rst     => clock_and_control.rst,
  --#     i_data  => xor_reduce(ctrl_v),
  --#     o_data  => mon_v
  --# );
  --# 
  --# inn_xor : for i in c_HPS_MAX_HP_INN -1 downto 0 generate
  --#   inn_tdc_hits_ab(i) <= xor_reduce(i_inn_tdc_hits_av(i));
  --# end generate ; -- inn_xor
  --# mid_xor : for i in c_HPS_MAX_HP_mid -1 downto 0 generate
  --#   mid_tdc_hits_ab(i) <= xor_reduce(i_mid_tdc_hits_av(i));
  --# end generate ; -- mid_xor
  --# out_xor : for i in c_HPS_MAX_HP_out -1 downto 0 generate
  --#   out_tdc_hits_ab(i) <= xor_reduce(i_out_tdc_hits_av(i));
  --# end generate ; -- out_xor
  --# -- ext_xor : for i in c_HPS_MAX_HP_ext -1 downto 0 generate
  --# --   ext_tdc_hits_ab <= xor_reduce(i_ext_tdc_hits_av(i));
  --# -- end generate ; -- ext_xor
  --# 
  --# daq_streams_ab <= inn_tdc_hits_ab & mid_tdc_hits_ab & out_tdc_hits_ab;
  --# 
  --# daq_o : for i in c_HPS_MAX_HP_INN + c_HPS_MAX_HP_MID + c_HPS_MAX_HP_OUT - 1 downto 0 generate
  --#   daq_o : entity shared_lib.vhdl_utils_deserializer 
  --#   generic map (g_DATA_WIDTH => o_daq_streams(i)'length) 
  --#   port map(
  --#     clk     => clock_and_control.clk,
  --#     rst     => clock_and_control.rst,
  --#     i_data  => daq_streams_ab(i),
  --#     o_data  => o_daq_streams(i)
  --# );
  --# end generate ; -- daq_o

    


end behavioral;
