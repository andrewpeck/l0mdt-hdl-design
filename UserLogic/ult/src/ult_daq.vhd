--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ult_daq.vhd
-- Module: <<moduleName>>
-- File PATH: /ult_daq.vhd
-- -----
-- File Created: Thursday, 16th February 2023 1:31:51 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 16th February 2023 4:30:22 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------



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

library ctrl_lib;
use ctrl_lib.DAQ_CTRL.all;

-- library l0mdt;

library daq_lib;
library daq_core;

-- use daq_def.daq_defs.all;

entity daq is
  -- generic (DELAY : integer; memory_type: string);
  port (
    -- clock and control
    clock_and_control : in  l0mdt_control_rt;
    ttc_commands      : in  l0mdt_ttc_rt;
    ctrl_v            : in  std_logic_vector(DAQ_CTRL_t'w-1 downto 0); -- : in  DAQ_CTRL_t;
    mon_v             : out std_logic_vector( DAQ_MON_t'w-1 downto 0);-- : out DAQ_MON_t;
    ----------------------------------------------------------------------
    i_flags           : in  std_logic_vector(6 downto 0);
    i_ec              : in  std_logic;
    i_sector_id       : in  std_logic_vector(3 downto 0);
    i_frag_id         : in  std_logic_vector(3 downto 0);
    ----------------------------------------------------------------------
    i_inn_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_INN-1 downto 0);
    i_mid_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_MID-1 downto 0);
    i_out_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_OUT-1 downto 0);
    i_ext_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_EXT-1 downto 0);
    ----------------------------------------------------------------------
    o_daq_stream_data_v : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(31 downto 0);
    o_daq_stream_ctrl_v : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)( 1 downto 0);
    o_daq_stream_wren_v : out std_logic_vector(c_DAQ_LINKS-1 downto 0)
    -- o_sump            : out std_logic
  );
end entity daq;

architecture behavioral of daq is

begin

  DAQ_GEN : if c_DAQ_ENABLED generate

    signal ctrl_bcid_offset    : unsigned(11 downto 0);
    signal ctrl_opening_offset : unsigned(11 downto 0);
    signal ctrl_request_offset : unsigned(11 downto 0);
    signal ctrl_closing_offset : unsigned(11 downto 0);
    signal ctrl_window_timeout : unsigned(11 downto 0);
    signal ctrl_busy_threshold : unsigned( 7 downto 0);

    signal ctrl_r : DAQ_CTRL_t;
    signal mon_r  : DAQ_MON_t;

    signal busy : std_logic;
    
  begin
    
    ctrl_r <= convert(ctrl_v, ctrl_r);
    mon_v <= convert( mon_r,  mon_v);

    process(clock_and_control.clk)
    begin
      if rising_edge(clock_and_control.clk) then
        if ctrl_r.action.wr_en = '1' then
          ctrl_opening_offset   <= unsigned(ctrl_r.wr0.opening_offset);
          ctrl_request_offset   <= unsigned(ctrl_r.wr0.request_offset);
          ctrl_closing_offset   <= unsigned(ctrl_r.wr1.closing_offset);
          ctrl_window_timeout   <= unsigned(ctrl_r.wr1.window_timeout);
          ctrl_busy_threshold   <= unsigned(ctrl_r.wr1.busy_threshold);
          ctrl_bcid_offset <= unsigned(ctrl_r.wr2.ctrl_bcid_offset);
        end if; -- wr en
        mon_r.rd0.opening_offset <= std_logic_vector(ctrl_opening_offset);
        mon_r.rd0.request_offset <= std_logic_vector(ctrl_request_offset);
        mon_r.rd1.closing_offset <= std_logic_vector(ctrl_closing_offset);
        mon_r.rd1.window_timeout <= std_logic_vector(ctrl_window_timeout);
        mon_r.rd1.busy_threshold <= std_logic_vector(ctrl_busy_threshold);
        mon_r.status.busy       <= busy;
      end if; -- clk
    end process;


    u_daq_data_path : entity daq_lib.daq_data_path
      port map (i_clk                 => clock_and_control.clk, -- : in  std_logic;                   
                i_rst                 => clock_and_control.rst, -- : in  std_logic;                   
                i_bx                  => clock_and_control.bx , -- : in  std_logic;                   
                -----------------------------------------------------
                i_orid                => ttc_commands.orid    , -- : in  std_logic_vector(1 downto 0);
                i_l1a                 => ttc_commands.l1a     , -- : in  std_logic;                   
                i_ecr                 => ttc_commands.ecr     , -- : in  std_logic;                   
                i_bcid                => ttc_commands.bcid    , -- : in  unsigned(11 downto 0);       
                -----------------------------------------------------
                i_ctrl_bcid_offset    => ctrl_bcid_offset     , -- : in  unsigned(11 downto 0);
                i_ctrl_opening_offset => ctrl_opening_offset  , -- : in  unsigned(11 downto 0);   
                i_ctrl_request_offset => ctrl_request_offset  , -- : in  unsigned(11 downto 0);   
                i_ctrl_closing_offset => ctrl_closing_offset  , -- : in  unsigned(11 downto 0);   
                i_ctrl_window_timeout => ctrl_window_timeout  , -- : in  unsigned(11 downto 0);   
                i_ctrl_busy_threshold => ctrl_busy_threshold  , -- : in  unsigned(11 downto 0);   
                ----------------------------------------------------------------------
                o_busy                => busy                 , -- : in  std_logic;
                ----------------------------------------------------------------------
                i_flags             => i_flags                , -- : in  std_logic_vector(6 downto 0);
                i_ec                => i_ec                   , -- : in  std_logic;
                i_sector_id         => i_sector_id            , -- : in  std_logic_vector(3 downto 0);
                i_frag_id           => i_frag_id              , -- : in  std_logic_vector(3 downto 0);
                ----------------------------------------  ------------------------------
                i_inn_tdc_hits_av   => i_inn_tdc_hits_av      , -- : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_INN-1 downto 0);
                i_mid_tdc_hits_av   => i_mid_tdc_hits_av      , -- : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_MID-1 downto 0);
                i_out_tdc_hits_av   => i_out_tdc_hits_av      , -- : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_OUT-1 downto 0);
                i_ext_tdc_hits_av   => i_ext_tdc_hits_av      , -- : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_EXT-1 downto 0);
                ----------------------------------------------------------------------
                o_daq_stream_data_v => o_daq_stream_data_v    , -- : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(31 downto 0);
                o_daq_stream_ctrl_v => o_daq_stream_ctrl_v    , -- : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)( 1 downto 0);
                o_daq_stream_wren_v => o_daq_stream_wren_v    ); -- : out std_logic_vector(c_DAQ_LINKS-1 downto 0));

  end generate DAQ_GEN;

end behavioral;
