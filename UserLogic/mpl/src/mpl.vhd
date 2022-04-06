--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Main pipe line
--  Description: pipelines between UCM - TF - MTC
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

library mpl_lib;
use mpl_lib.mpl_pkg.all;

library ctrl_lib;
use ctrl_lib.MPL_CTRL.all;


entity mpl is

  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- AXI to SoC
    ctrl_v            : in std_logic_vector; -- : in  MPL_CTRL_t;
    mon_v             : out std_logic_vector;-- : out MPL_MON_t;
    -- configuration, control & Monitoring
    -- SLc pipeline
    i_uCM2pl_av         : in ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);
    o_pl2ptcalc_av      : out pl2ptcalc_avt(c_NUM_THREADS -1 downto 0);
    o_pl2mtc_av         : out pl2mtc_avt(c_MAX_NUM_SL -1 downto 0)
  );
end entity mpl;

architecture beh of mpl is

  signal ctrl_r           : MPL_CTRL_t;
  signal mon_r            : MPL_MON_t;
  --
  signal super_ctrl_r : MPL_SUPER_CTRL_t;
  signal super_mon_r  : MPL_SUPER_MON_t;
  signal super_ctrl_v : std_logic_vector(MPL_SUPER_CTRL_t'w - 1 downto 0);
  signal super_mon_v  : std_logic_vector(MPL_SUPER_MON_t'w - 1 downto 0);
  --
  signal mpl_ctrl_r : MPL_PL_MEM_PL_MEM_CTRL_t;
  signal mpl_ctrl_v : std_logic_vector(MPL_PL_MEM_PL_MEM_CTRL_t'w - 1 downto 0);
  type   mpl_ctrl_avt is array (0 to c_MAX_NUM_SL - 1)of std_logic_vector(MPL_PL_MEM_PL_MEM_CTRL_t'w -1 downto 0);
  signal mpl_ctrl_av  : mpl_ctrl_avt;
  
  signal mpl_mon_r  : MPL_PL_MEM_PL_MEM_MON_t;
  type   mpl_mon_avt is array (0 to c_MAX_NUM_SL - 1)of std_logic_vector(MPL_PL_MEM_PL_MEM_MON_t'w -1 downto 0);
  signal mpl_mon_av  : mpl_mon_avt;

  signal local_en         :  std_logic;
  signal local_rst        :  std_logic;

  signal int_freeze       : std_logic;

  signal i_uCM2pl_ar      : ucm2pl_art(c_MAX_NUM_SL -1 downto 0);

  -- signal pl1out_av : ucm2pl_art(c_MAX_NUM_SL -1 downto 0);
  signal main_pl_out_av   : ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);
  signal pl2csw_av        : pl2ptcalc_avt(c_MAX_NUM_SL -1 downto 0);
  signal pl2ptcalc_av     : mpl2csw_ptcalc_avt(c_NUM_THREADS -1 downto 0);
  signal pl2mtc_av        : pl2mtc_avt(c_MAX_NUM_SL -1 downto 0);

  signal main_pl_out_ar   : ucm2pl_art(c_MAX_NUM_SL -1 downto 0);
  signal pl2ptcalc_ar     : mpl2csw_ptcalc_art(c_NUM_THREADS -1 downto 0);
  signal pl2mtc_ar        : pl2mtc_art(c_MAX_NUM_SL -1 downto 0);

begin

  ctrl_r <= convert(ctrl_v,ctrl_r);
  mon_v <= convert(mon_r,mon_v);

  -- super_ctrl_r <= ctrl_r.super;
  -- mon_r.super <= super_mon_r;

  super_ctrl_v <= convert(ctrl_r.super,super_ctrl_v);
  mon_r.super  <= convert(super_mon_v,mon_r.super);

  -- mon_arrays: for sl_i in 0 to c_MAX_NUM_SL - 1 generate
  --   mpl_ctrl_av(sl_i) <= convert(ctrl_r.PL_MEM.PL_MEM(sl_i),mpl_ctrl_av(sl_i));
  --   mon_r.PL_MEM.PL_MEM(sl_i) <= convert(mpl_mon_av(sl_i),mon_r.PL_MEM.PL_MEM(sl_i));
  -- end generate mon_arrays;

  MPL_SUPERVISOR : entity mpl_lib.mpl_supervisor
  port map(
    clk               => clk,
    rst               => rst,
    glob_en           => glob_en,      
    -- AXI to SoC
    ctrl_v              => super_ctrl_v,
    mon_v               => super_mon_v,
    -- i_actions           => ctrl_r.actions,
    -- i_configs           => ctrl_r.configs,
    -- o_status            => mon_r.status ,
    --
    o_freeze          => int_freeze,
    -- 
    o_local_en          => local_en,
    o_local_rst         => local_rst
  );

  MPL_PL : for sl_i in c_MAX_NUM_SL -1 downto 0 generate

    mpl_ctrl_av(sl_i) <= convert(ctrl_r.PL_MEM.PL_MEM(sl_i),mpl_ctrl_av(sl_i));
    mon_r.PL_MEM.PL_MEM(sl_i) <= convert(mpl_mon_av(sl_i),mon_r.PL_MEM.PL_MEM(sl_i));

    PL : entity mpl_lib.mpl_pl
    port map(
      clk           => clk,
      rst           => local_rst,
      enable        => local_en,
      --
      ctrl_v          => mpl_ctrl_av(sl_i),
      mon_v           => mpl_mon_av(sl_i),
      --
      i_freeze      => int_freeze,
      --
      i_uCM2pl_v    => i_uCM2pl_av(sl_i),
      o_pl2ptcalc_v => main_pl_out_av(sl_i),
      o_pl2mtc_v    => o_pl2mtc_av(sl_i)
    );

  end generate;

  MPL_A : for sl_i in c_MAX_NUM_SL -1 downto 0 generate

    i_uCM2pl_ar(sl_i) <= convert(i_uCM2pl_av(sl_i),i_uCM2pl_ar(sl_i));
    
  end generate;

  PL_CSW : entity mpl_lib.mpl_csw
  port map(
    clk         => clk,
    rst         => local_rst,
    ena         => local_en,
    -- configuration, control & Monitoring
    -- SLc pipeline
    i_ucm_av    => pl2ptcalc_av,
    o_tf_av     => o_pl2ptcalc_av
    -- o_mtc_av      => pl2mtc_av
  );

  PL_2_TF : for c_i in c_NUM_THREADS -1 downto 0 generate
    pl2ptcalc_av(c_i) <= convert(pl2ptcalc_ar(c_i),pl2ptcalc_av(c_i));
    -- muid
    pl2ptcalc_ar(c_i).muid.slcid        <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).common.slcid;
    pl2ptcalc_ar(c_i).muid.slid         <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).common.trailer.slid;
    pl2ptcalc_ar(c_i).muid.bcid         <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).common.header.bcid;
    -- proc control
    pl2ptcalc_ar(c_i).process_ch        <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).process_ch;
    pl2ptcalc_ar(c_i).busy              <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).busy;
    pl2ptcalc_ar(c_i).data_valid        <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).data_valid;
    -- data
    pl2ptcalc_ar(c_i).phimod            <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).phimod;
    pl2ptcalc_ar(c_i).sl_charge         <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).common.sl_charge;
    pl2ptcalc_ar(c_i).nswseg_poseta     <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).nswseg_poseta;
    pl2ptcalc_ar(c_i).nswseg_posphi     <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).nswseg_posphi;
    pl2ptcalc_ar(c_i).nswseg_angdtheta  <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).nswseg_angdtheta;
  end generate;

  PL_2_MTC : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    pl2mtc_ar(sl_i).common <= main_pl_out_ar(sl_i).common;
    pl2mtc_ar(sl_i).process_ch <= main_pl_out_ar(sl_i).process_ch;
    pl2mtc_ar(sl_i).busy <= main_pl_out_ar(sl_i).busy;
    pl2mtc_ar(sl_i).data_valid <= main_pl_out_ar(sl_i).data_valid;
    --
    pl2mtc_av(sl_i) <= convert(pl2mtc_ar(sl_i),pl2mtc_av(sl_i));
    main_pl_out_ar(sl_i) <= convert(main_pl_out_av(sl_i),main_pl_out_ar(sl_i));

  end generate;

  -- pl2ptcalc_av <= convert(pl2ptcalc_ar);
  -- pl2mtc_av <= convert(pl2mtc_ar);
  -- main_pl_out_ar <= convert(main_pl_out_av);

end architecture beh;
