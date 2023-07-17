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

library ctrl_lib;
use ctrl_lib.TAR_CTRL.all;

library tar_lib;
use tar_lib.tar_pkg.all;

library ult_lib;

entity tb_mdt_tar is
  port (
    -- pipeline clock
    clock : in  std_logic;
    reset : in  std_logic;
    --
    --tar_inn_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    --tar_inn_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
    --tar_mid_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    --tar_mid_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
    --tar_out_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    --tar_out_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
    --tar_ext_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    --tar_ext_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
    -- ttc
    -- ttc_commands      : in  l0mdt_ttc_rt;
    -- TDC Hits from Polmux
    i_inn_tdc_hits_av : in  tdcpolmux2tar_avt (c_HPS_MAX_HP_INN -1 downto 0);
    i_mid_tdc_hits_av : in  tdcpolmux2tar_avt (c_HPS_MAX_HP_MID -1 downto 0);
    i_out_tdc_hits_av : in  tdcpolmux2tar_avt (c_HPS_MAX_HP_OUT -1 downto 0);
    i_ext_tdc_hits_av : in  tdcpolmux2tar_avt (c_HPS_MAX_HP_EXT -1 downto 0);
    -- TDC Hits from Tar
    -- i_inn_tar_hits    : in  tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_INN -1 downto 0);
    -- i_mid_tar_hits    : in  tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_MID -1 downto 0);
    -- i_out_tar_hits    : in  tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_OUT -1 downto 0);
    -- i_ext_tar_hits    : in  tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_EXT -1 downto 0);
    -- to DAQ
    o_inn_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_INN -1 downto 0);
    o_mid_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_MID -1 downto 0);
    o_out_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_OUT -1 downto 0);
    o_ext_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_EXT -1 downto 0);
    -- outputs to h2s Tar
    o_inn_tar_hits_av  : out tar2hps_avt(c_HPS_MAX_HP_INN -1 downto 0);
    o_mid_tar_hits_av  : out tar2hps_avt(c_HPS_MAX_HP_MID -1 downto 0);
    o_out_tar_hits_av  : out tar2hps_avt(c_HPS_MAX_HP_OUT -1 downto 0);
    o_ext_tar_hits_av  : out tar2hps_avt(c_HPS_MAX_HP_EXT -1 downto 0);

    o_sump            : out std_logic

    );
end entity tb_mdt_tar;

architecture beh of tb_mdt_tar is
  signal clock_and_control :l0mdt_control_rt;
  signal tar_inn_ctrl_r       : TAR_CTRL_t;
  signal tar_inn_mon_r      : TAR_MON_t;
  signal tar_mid_ctrl_r       :  TAR_CTRL_t;
  signal tar_mid_mon_r     :  TAR_MON_t;
  signal tar_out_ctrl_r        : TAR_CTRL_t;
  signal tar_out_mon_r      : TAR_MON_t;
  signal tar_ext_ctrl_r        :  TAR_CTRL_t;
  signal tar_ext_mon_r      : TAR_MON_t;
 
  signal tar_inn_ctrl_v : std_logic_vector(width(tar_inn_ctrl_r) -1 downto 0) := (others=> '0');
  signal tar_inn_mon_v  : std_logic_vector(width(tar_inn_mon_r) -1 downto 0) := (others=> '0');
  signal tar_mid_ctrl_v : std_logic_vector(width(tar_inn_ctrl_r) -1 downto 0) := (others=> '0');
  signal tar_mid_mon_v  : std_logic_vector(width(tar_inn_mon_r) -1 downto 0) := (others=> '0');
  signal tar_out_ctrl_v : std_logic_vector(width(tar_inn_ctrl_r) -1 downto 0) := (others=> '0');
  signal tar_out_mon_v  : std_logic_vector(width(tar_inn_mon_r) -1 downto 0) := (others=> '0');
  signal tar_ext_ctrl_v : std_logic_vector(width(tar_inn_ctrl_r) -1 downto 0) := (others=> '0');
  signal tar_ext_mon_v  : std_logic_vector(width(tar_inn_mon_r) -1 downto 0) := (others=> '0');

  
  begin

    tar_inn_ctrl_r.actions.reset <= '0';
    tar_inn_ctrl_r.actions.enable <= '1';
    tar_inn_ctrl_r.actions.disable <= '0';
    tar_inn_ctrl_r.actions.freeze <= '0';
    tar_inn_ctrl_r.configs.input_en <= '1';
    tar_inn_ctrl_r.configs.output_en <= '1';
    tar_inn_ctrl_r.configs.flush_mem_reset <= '0';
    tar_inn_ctrl_r.pl_st <= zero(tar_inn_ctrl_r.pl_st);
   
    tar_mid_ctrl_r.actions.reset <= '0';
    tar_mid_ctrl_r.actions.enable <= '1';
    tar_mid_ctrl_r.actions.disable <= '0';
    tar_mid_ctrl_r.actions.freeze <= '0';
    tar_mid_ctrl_r.configs.input_en <= '1';
    tar_mid_ctrl_r.configs.output_en <= '1';
    tar_mid_ctrl_r.configs.flush_mem_reset <= '0';
    tar_mid_ctrl_r.pl_st <= zero(tar_mid_ctrl_r.pl_st);

        tar_out_ctrl_r.actions.reset <= '0';
    tar_out_ctrl_r.actions.enable <= '1';
    tar_out_ctrl_r.actions.disable <= '0';
    tar_out_ctrl_r.actions.freeze <= '0';
    tar_out_ctrl_r.configs.input_en <= '1';
    tar_out_ctrl_r.configs.output_en <= '1';
    tar_out_ctrl_r.configs.flush_mem_reset <= '0';
    tar_out_ctrl_r.pl_st <= zero(tar_out_ctrl_r.pl_st);

        tar_ext_ctrl_r.actions.reset <= '0';
    tar_ext_ctrl_r.actions.enable <= '1';
    tar_ext_ctrl_r.actions.disable <= '0';
    tar_ext_ctrl_r.actions.freeze <= '0';
    tar_ext_ctrl_r.configs.input_en <= '1';
    tar_ext_ctrl_r.configs.output_en <= '1';
    tar_ext_ctrl_r.configs.flush_mem_reset <= '0';
    tar_ext_ctrl_r.pl_st <= zero(tar_ext_ctrl_r.pl_st);

    clock_and_control.clk <= clock;
    clock_and_control.rst <= reset;
    tar_inn_ctrl_v    <=  convert( tar_inn_ctrl_r,  tar_inn_ctrl_v );
    tar_mid_ctrl_v   <=  convert( tar_mid_ctrl_r,  tar_mid_ctrl_v );
    tar_out_ctrl_v    <=  convert( tar_out_ctrl_r,  tar_out_ctrl_v );
    tar_ext_ctrl_v    <=  convert( tar_ext_ctrl_r,  tar_ext_ctrl_v );
    
    ULT_TAR : entity ult_lib.mdt_tar
      port map (
        -- clock, control, and monitoring
        clock_and_control => clock_and_control,  --
        -- ttc_commands      => ttc_commands,       --
        tar_inn_ctrl_v => tar_inn_ctrl_v,
        tar_inn_mon_v  => tar_inn_mon_v ,
        tar_mid_ctrl_v => tar_mid_ctrl_v,
        tar_mid_mon_v  => tar_mid_mon_v ,
        tar_out_ctrl_v => tar_out_ctrl_v,
        tar_out_mon_v  => tar_out_mon_v ,
        tar_ext_ctrl_v => tar_ext_ctrl_v,
        tar_ext_mon_v  => tar_ext_mon_v ,
        -- TDC Hits from Polmux
        i_inn_tdc_hits_av  => i_inn_tdc_hits_av,
        i_mid_tdc_hits_av  => i_mid_tdc_hits_av,
        i_out_tdc_hits_av  => i_out_tdc_hits_av,
        i_ext_tdc_hits_av  => i_ext_tdc_hits_av,

        -- candidates in from hal
        -- i_inn_tar_hits_av  => i_inner_tar_hits,
        -- i_mid_tar_hits_av  => i_middle_tar_hits,
        -- i_out_tar_hits  => i_outer_tar_hits,
        -- i_ext_tar_hits_av  => i_extra_tar_hits,
        --
        o_inn_tdc_hits_av  => o_inn_tdc_hits_av,
        o_mid_tdc_hits_av  => o_mid_tdc_hits_av,
        o_out_tdc_hits_av  => o_out_tdc_hits_av,
        o_ext_tdc_hits_av  => o_ext_tdc_hits_av,
        -- outputs to h2s_out
        o_inn_tar_hits_av  => o_inn_tar_hits_av,
        o_mid_tar_hits_av  => o_mid_tar_hits_av,
        o_out_tar_hits_av  => o_out_tar_hits_av,
        o_ext_tar_hits_av  => o_ext_tar_hits_av

        -- o_sump          => tar_sump

      );
  end architecture beh;
