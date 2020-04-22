--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Muon Candidate Manager
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
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm is
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_av          : in slc_prepro_avt(MAX_NUM_SL -1 downto 0);
    -- pam out
    o_uCM2hps_pam_ar       : out ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0);
    o_uCM2hps_data_av      : out ucm2hps_slc_avt(MAX_NUM_HPS -1 downto 0);
    -- MDT hit
    o_uCM2pl_av            : out pipeline_avt(MAX_NUM_SL -1 downto 0)
  );
end entity ucm;

architecture beh of ucm is
  signal csin_slc_data_av    : slc_prepro_avt(MAX_NUM_SL -1 downto 0);
  signal csout_slc_data_av   : slc_prepro_avt(MAX_NUM_SL -1 downto 0);
  signal csout_slc_data_ar   : slc_prepro_art(MAX_NUM_SL -1 downto 0);

  signal o_uCM2pl_ar          : pipeline_art(MAX_NUM_SL -1 downto 0);

  signal cpam_in_av          : pipeline_avt(MAX_NUM_HEG -1 downto 0);
  signal cpam_out_av         : pipeline_avt(MAX_NUM_HEG -1 downto 0);

  signal csw_control      : ucm_csw_control_rt;
  signal pam_CSW_control  : ucm_pam_control_rt;
  signal proc_info        : ucm_proc_info_art(MAX_NUM_HEG -1 downto 0);
  signal cvp_control      : std_logic_vector(MAX_NUM_HEG -1 downto 0);

  -- signal int_slc_data     : slc_prepro_avt(MAX_NUM_SL -1 downto 0);
  signal uCM2hps_data     : ucm_vp_data_aastdst(MAX_NUM_HEG -1 downto 0);
begin

  -- input pipelines
  SLC_IN_PL_A : for sl_i in MAX_NUM_SL -1 downto 0 generate
    SLC_IN_PL : entity shared_lib.std_pipeline
    generic map(
      num_delays  => UCM_INPUT_PL_LATENCY,
      num_bits    => SLC_PREPRO_WIDTH
    )
    port map(
      clk         => clk,
      Reset_b     => Reset_b,
      glob_en     => glob_en,
      --
      i_data      => i_slc_data_av(sl_i),
      o_data      => csin_slc_data_av(sl_i)
    );
  end generate;

    --control
    SLC_CTRL : entity ucm_lib.ucm_ctrl
    port map(
      clk         => clk,
      Reset_b     => Reset_b,
      glob_en     => glob_en,
      --
      i_data      => i_slc_data_av,
      --
      o_csw_ctrl  => csw_control,
      o_pam_ctrl  => pam_CSW_control,
      o_proc_info => proc_info,
      o_cvp_ctrl  => cvp_control,
      
      o_pam       => o_uCM2hps_pam_ar
    );

  -- main cross switch
  SLC_CSW : entity ucm_lib.ucm_csw
  port map(
    clk         => clk,
    Reset_b     => Reset_b,
    glob_en     => glob_en,
    
    i_control   => csw_control,
    -- data
    i_data      => csin_slc_data_av,
    o_data      => csout_slc_data_av
  );

  -- PAM cross switch
  SLC_PAM_CSW : entity ucm_lib.ucm_pam_csw
  port map(
    clk         => clk,
    Reset_b     => Reset_b,
    glob_en     => glob_en,
    
    i_control   => pam_CSW_control,
    -- data
    i_data      => cpam_in_av,
    o_data      => cpam_out_av
  );


  -- vector processors
  SLC_VP_A : for vp_i in MAX_NUM_HEG -1 downto 0 generate
    SLC_VP : entity ucm_lib.ucm_cvp
    port map(
      clk         => clk,
      Reset_b     => Reset_b,
      glob_en     => glob_en,
      --
      i_in_en     => cvp_control(vp_i),
      --
      i_data      => cpam_out_av(vp_i),
      o_ucm2hps   => uCM2hps_data(vp_i)

    );
  end generate;

  VP2HPS: for hps_i in MAX_NUM_HPS -1 downto 0 generate
    VP2HEG: for heg_i in MAX_NUM_HEG -1 downto 0 generate
      o_uCM2hps_data_av(hps_i)(heg_i) <= uCM2hps_data(heg_i)(hps_i);
    end generate;
  end generate;

  -- VP2HEG: for heg_i in MAX_NUM_HEG -1 downto 0 generate
  --   -- cpam_in_av(heg_i) <= csout_slc_data_av(MAX_NUM_SL - ((MAX_NUM_HEG - 1) - heg_i) - 1);
  --   -- cpam_in_av(heg_i) <= csout_slc_data_av(MAX_NUM_SL - MAX_NUM_HEG + heg_i);

  --   o_uCM2pl_ar(MAX_NUM_SL - MAX_NUM_HEG + heg_i).processed <= proc_info(heg_i).processed;
  --   o_uCM2pl_ar(MAX_NUM_SL - MAX_NUM_HEG + heg_i).processed <= proc_info(heg_i).ch;
  -- end generate;

  PL_PROC_GEN: for sl_i in MAX_NUM_SL -1 downto 0 generate
    
    o_uCM2pl_ar(sl_i).muid <= recordify(csout_slc_data_av(sl_i)).muid;
    o_uCM2pl_ar(sl_i).common <= recordify(csout_slc_data_av(sl_i)).common;
    o_uCM2pl_ar(sl_i).pl_common <= recordify(csout_slc_data_av(sl_i)).pl_common;
    o_uCM2pl_ar(sl_i).specific <= recordify(csout_slc_data_av(sl_i)).specific;
    o_uCM2pl_ar(sl_i).data_valid <= recordify(csout_slc_data_av(sl_i)).data_valid;

    PL_PROC_IF: if sl_i >= MAX_NUM_SL - MAX_NUM_HEG generate
      o_uCM2pl_ar(sl_i).processed <= proc_info(sl_i - (MAX_NUM_SL - MAX_NUM_HEG)).processed;
      o_uCM2pl_ar(sl_i).process_ch <= proc_info(sl_i - (MAX_NUM_SL - MAX_NUM_HEG)).ch;
    end generate;
    PL_PROC_0: if sl_i < MAX_NUM_SL - MAX_NUM_HEG generate
      o_uCM2pl_ar(sl_i).processed <= '0';
      o_uCM2pl_ar(sl_i).process_ch <= (others => '0');
    end generate;



    o_uCM2pl_av(sl_i) <= vectorify(o_uCM2pl_ar(sl_i));
  end generate;
  
  -- o_uCM2pl_av <= csout_slc_data_av;

end beh;