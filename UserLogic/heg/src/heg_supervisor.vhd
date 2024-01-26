--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: 
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.vhdl2008_functions_pkg.all;
-- use shared_lib.detector_param_pkg.all;
use shared_lib.detector_time_param_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
-- library hegtypes_lib;
-- use hegtypes_lib.hp_pkg.all;
-- use hegtypes_lib.heg_pkg.all;

library ctrl_lib;
use ctrl_lib.HEG_CTRL.all;

entity heg_supervisor is
  generic(
    g_STATION_RADIUS    : integer := 0;  --station
    g_HPS_NUM_MDT_CH     : integer := 6 
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic := '1';
    -- control
    ctrl_v              : in  std_logic_vector; -- HPS_HEG_HEG_CTRL_t;
    mon_v               : out std_logic_vector; -- HPS_HEG_HEG_MON_t;
    -- superior entity ctrls
    i_freeze            : in std_logic := '0';
    o_freeze            : out std_logic;
    --
    o_local_rst         : out std_logic;
    o_local_en          : out std_logic;
    -- inputs
    i_slcs_in           : in std_logic_vector(0 downto 0);
    i_hits_in           : in std_logic_vector(g_HPS_NUM_MDT_CH -1 downto 0);
    i_hits_ok           : in std_logic_vector(g_HPS_NUM_MDT_CH -1 downto 0);
    i_errors            : in std_logic_vector(g_HPS_NUM_MDT_CH -1 downto 0)
  );
end entity heg_supervisor;

architecture beh of heg_supervisor is

  signal ctrl_r : HEG_SUPER_CTRL_t;
  signal mon_r  : HEG_SUPER_MON_t;

 
  signal local_rst : std_logic;
  signal local_en  : std_logic;
  --
  signal int_en   : std_logic;
  signal int_rst  : std_logic := '1';

  signal int_freeze : std_logic;

  constant apb_clk_lat : integer := c_CLK_AXI_MULT;
  signal  apb_clk_cnt : integer;
  signal axi_cnt_reset    : std_logic;
  signal axi_rep_clk      : std_logic;

begin

  ctrl_r <= convert(ctrl_v,ctrl_r);
  mon_v <= convert(mon_r,mon_v);

  o_local_en <= local_en;
  o_local_rst <= local_rst;

  local_en <= glob_en and int_en;
  local_rst <= rst or int_rst;

  o_freeze <= i_freeze or int_freeze;

  signaling: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        int_en <= '1';
        int_rst <= rst;
        apb_clk_cnt <= 0;
        axi_cnt_reset <= '0';
        axi_rep_clk <= '0';
      else
        --------------------------------------------
        --    AXI CLK CTRL
        --------------------------------------------
        if apb_clk_cnt < apb_clk_lat and axi_cnt_reset = '0' then
          apb_clk_cnt <= apb_clk_cnt + 1;
        else
          apb_clk_cnt <= 0;
          axi_rep_clk <= not axi_rep_clk;
        end if;
        --------------------------------------------
        --    from apb
        --------------------------------------------
        -- if apb_clk_cnt = 0 then
          if ctrl_r.actions.reset = '1' then
            int_rst <= '1';
          else
            int_rst <= '0';
          end if;

          if ctrl_r.actions.enable = '1' then
            int_en <= '1';
          elsif ctrl_r.actions.disable = '1' then
            int_en <= '0';
          end if;
          
          if ctrl_r.actions.freeze = '1' then
            int_freeze <= '1';
          else
            int_freeze <= '0';
          end if;
        -- else
        -- end if;

        --------------------------------------------
        --    counters
        --------------------------------------------

      end if;
        --------------------------------------------
        --    to apb
        --------------------------------------------
        mon_r.status.ENABLED <= local_en;
        mon_r.status.READY <= not local_rst;
        mon_r.status.ERROR <= '0';
    end if;
  end process;

  cnt_slc_in : entity shared_lib.vhdl_utils_NinCounter
    generic map(g_NUM_INPUTS => 1 , g_DATA_WIDTH => 32)
    port map(clk => clk,rst => rst, ena => '1', i_triggers => i_slcs_in , o_counter => mon_r.counters.slc_proc);
  cnt_hit_in : entity shared_lib.vhdl_utils_NinCounter
    generic map(g_NUM_INPUTS => g_HPS_NUM_MDT_CH , g_DATA_WIDTH => 32)
    port map(clk => clk,rst => rst, ena => '1', i_triggers => i_hits_in, o_counter => mon_r.counters.hit_proc);
  cnt_hok_in : entity shared_lib.vhdl_utils_NinCounter
    generic map(g_NUM_INPUTS =>g_HPS_NUM_MDT_CH, g_DATA_WIDTH => 32)
    port map(clk => clk,rst => rst, ena => '1', i_triggers => i_hits_ok , o_counter => mon_r.counters.hit_ok);
  cnt_err_in : entity shared_lib.vhdl_utils_NinCounter
    generic map(g_NUM_INPUTS =>g_HPS_NUM_MDT_CH , g_DATA_WIDTH => 32)
    port map(clk => clk,rst => rst, ena => '1', i_triggers => i_errors, o_counter => mon_r.counters.error);

end beh;

-- i_slcs_in
-- i_hits_in
-- i_hits_ok
-- i_errors 
