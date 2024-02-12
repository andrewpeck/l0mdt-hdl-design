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

library ult_lib;

library fm_lib;
  use fm_lib.fm_types.all;


library ctrl_lib;
use ctrl_lib.MPL_CTRL.all;
use ctrl_lib.MTC_CTRL.all;
use ctrl_lib.TF_CTRL.all;
use ctrl_lib.fm_ctrl.all;
-- use ctrl_lib.ctrl_constants_pkg.all;



entity tb_ult_pt_mpl_mtc_primary is
  generic (
    SUMP_SIGNALS : boolean := false;
    DUMMY        : boolean := false
    );
  port (
    -- clock and ttc
    clock             : in std_logic;
    rst               : in std_logic;
    ttc_commands      : in l0mdt_ttc_rt;

 

 --    mtc_ctrl_v            : in std_logic_vector; --  : in  MTC_CTRL_t;
 --   mtc_mon_v             : out std_logic_vector;--  : out MTC_MON_t;

   

 --   tf_ctrl_v             : in std_logic_vector; --  : in  TF_CTRL_t;
 --   tf_mon_v              : out std_logic_vector;-- : out TF_MON_t;

 --   mpl_ctrl_v            : in std_logic_vector; -- : in  MPL_CTRL_t;
 --   mpl_mon_v             : out std_logic_vector;-- : out MPL_MON_t;


    ucm2pl_av              : in ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);

    inn_segments_av   : in sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
    mid_segments_av  : in sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
    out_segments_av   : in sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
    ext_segments_av   : in sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);

    i_plus_neighbor_segments  : in  sf2ptcalc_vt;
    i_minus_neighbor_segments : in  sf2ptcalc_vt;

  

    -- -- MUCTPI
    o_MTC                     : out mtc_out_avt(c_NUM_MTC-1 downto 0);
    o_NSP                     : out mtc2nsp_avt(c_NUM_NSP-1 downto 0)
  

    );
end entity  tb_ult_pt_mpl_mtc_primary;

architecture behavioral of  tb_ult_pt_mpl_mtc_primary is
    -- slc to mtc (from pipeline)
  signal pl2pt_av   : pl2ptcalc_avt (c_NUM_THREADS-1 downto 0);
  signal pl2mtc_av : pl2mtc_avt (c_MAX_NUM_SL-1 downto 0);
  
   -- pt calc 2 mtc
  signal pt2mtc_av : ptcalc2mtc_avt(c_NUM_THREADS-1 downto 0);

    signal pt_sump  : std_logic := '1';
    signal mtc_sump : std_logic := '1';
  --ACCESS attribute
    signal mtc_mon_v             : std_logic_vector(MTC_MON_t'w -1 downto 0);--  : out MTC_MON_t;
    signal mpl_mon_v             : std_logic_vector(MPL_MON_t'w -1 downto 0);-- : out MPL_MON_t; 
  --signal tf_mon_v              : std_logic_vector(TF_MON_t'w * c_NUM_THREADS-1 downto 0);-- : out TF_MON_t;
    signal tf_mon_v              : std_logic_vector(TF_MON_t'w -1 downto 0);-- : out TF_MON_t;
    signal mtc_ctrl_v            : std_logic_vector(MTC_CTRL_t'w -1 downto 0):= (others => '0'); --  : in  MTC_CTRL_t;
    signal mpl_ctrl_v            : std_logic_vector(MPL_CTRL_t'w -1 downto 0):= (others => '0');-- : out MPL_MON_t;
  --signal tf_ctrl_v             : std_logic_vector(TF_CTRL_t'w * c_NUM_THREADS-1 downto 0):= (others => '0');-- : out TF_MON_t;
    signal tf_ctrl_v             : std_logic_vector(TF_CTRL_t'w-1 downto 0):= (others => '0');-- : out TF_MON_t;

  signal mtc_fm_mon_v : std_logic_vector(fm_mtc_mon_data'w-1 downto 0);
  signal fm_mtc2sl_pb_v                : mtc_out_avt(mtc_sb_n-1 downto 0);
  
    signal clock_and_control : l0mdt_control_rt;
begin

  clock_and_control.clk <= clock;
  clock_and_control.rst <= rst;
  mpl_ctrl_v(MPL_PL_MEM_PL_MEM_CTRL_t'w-1 downto MPL_PL_MEM_PL_MEM_CTRL_t'w - 12 ) <= x"03e";
 
  
  ULT_MPL : entity ult_lib.pipeline
    port map (
      -- clock, control, and monitoring
      clock_and_control => clock_and_control,
      ttc_commands      => ttc_commands,
      ctrl_v                     => mpl_ctrl_v,
      mon_v                   => mpl_mon_v,
      
      -- Sector Logic Candidates from uCM
      i_ucm2pl_av => ucm2pl_av,
      
      -- Sector Logic Candidates to pt calculation
      o_pl2pt_av  => pl2pt_av,
      -- Sector Logic Candidates to mTC
      o_pl2mtc_av => pl2mtc_av
      );
  
  ULT_PTCALC : entity ult_lib.ptcalc
    port map (
      -- clock, control, and monitoring
      clock_and_control         => clock_and_control,
      ttc_commands              => ttc_commands,
      ctrl_v                             => tf_ctrl_v,
      mon_v                           => tf_mon_v,
      --  segments from neighbors
      i_plus_neighbor_segments    => i_plus_neighbor_segments,
      i_minus_neighbor_segments => i_minus_neighbor_segments,
      -- segments from hps
      i_inn_segments             => inn_segments_av,
      i_mid_segments             => mid_segments_av,
      i_out_segments             => out_segments_av,
      i_ext_segments             => ext_segments_av,     
      -- from pipeline
      i_pl2pt_av                      => pl2pt_av,
      -- to mtc
      o_pt2mtc                        => pt2mtc_av,
      -- dummy
      o_sump                           => pt_sump
    );

  
  ULT_MTCB : entity ult_lib.mtc_builder
    port map (
      -- clock, control, and monitoring
      clock_and_control => clock_and_control,
      ttc_commands      => ttc_commands,
      ctrl_v                     => mtc_ctrl_v,
      mon_v                   => mtc_mon_v,
      --  inputs
      i_ptcalc                 => pt2mtc_av,
      i_pl2mtc                => pl2mtc_av,
      -- outputs
      o_mtc                    => o_mtc,
      o_nsp                    => o_nsp,
      
      o_sump                => mtc_sump,

      fm_mtc_mon_v => mtc_fm_mon_v,
      fm_mtc2sl_pb_v => fm_mtc2sl_pb_v

      
      );
end behavioral;
    
      
      
