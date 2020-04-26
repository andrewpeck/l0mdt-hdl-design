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
    i_slc_data_av          : in slc_rx_data_avt(MAX_NUM_SL -1 downto 0);
    -- pam out
    o_uCM2hps_pam_ar       : out ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0);
    o_uCM2hps_data_av      : out ucm2hps_slc_avt(MAX_NUM_HPS -1 downto 0);
    -- MDT hit
    o_uCM2pl_av            : out pipeline_avt(MAX_NUM_SL -1 downto 0)
  );
end entity ucm;

architecture beh of ucm is
  signal ucm_prepro_av        : ucm_prepro_avt(MAX_NUM_SL -1 downto 0);
  -- signal csin_slc_data_av    : slc_prepro_avt(MAX_NUM_SL -1 downto 0);
  signal csw_main_in_av       : ucm_prepro_avt(MAX_NUM_SL -1 downto 0);
  signal csw_main_out_ar      : ucm_prepro_art(MAX_NUM_SL -1 downto 0);
  signal csw_main_out_av      : ucm_prepro_avt(MAX_NUM_SL -1 downto 0);

  signal o_uCM2pl_ar          : pipeline_art(MAX_NUM_SL -1 downto 0);

  signal cpam_in_av           : ucm_prepro_avt(MAX_NUM_HEG -1 downto 0);
  signal cpam_out_av          : ucm_prepro_avt(MAX_NUM_HEG -1 downto 0);

  signal csw_control          : ucm_csw_control_rt;
  signal pam_CSW_control      : ucm_pam_control_rt;
  signal proc_info            : ucm_proc_info_art(MAX_NUM_HEG -1 downto 0);
  signal cvp_control          : std_logic_vector(MAX_NUM_HEG -1 downto 0);

  -- signal int_slc_data         : slc_prepro_avt(MAX_NUM_SL -1 downto 0);
  signal uCM2hps_data         : ucm_cvp_aavt(MAX_NUM_HEG -1 downto 0);
begin
  --control
  SLC_CTRL : entity ucm_lib.ucm_ctrl
  port map(
    clk             => clk,
    Reset_b         => Reset_b,
    glob_en         => glob_en,
    --              =>
    i_data          => ucm_prepro_av,
    --              =>
    o_csw_ctrl      => csw_control,
    o_pam_ctrl      => pam_CSW_control,
    o_proc_info     => proc_info,
    o_cvp_ctrl      => cvp_control,
    o_pam           => o_uCM2hps_pam_ar
  );
  -- input pre processor
  SLC_PP_A : for sl_i in MAX_NUM_SL -1 downto 0 generate
    SLC_PP : entity ucm_lib.ucm_prepro
    port map(
      clk               => clk,
      Reset_b           => Reset_b,
      glob_en           => glob_en,
      --                =>
      i_slc_data_v     => i_slc_data_av(sl_i),
      o_prepro_data_v  => ucm_prepro_av(sl_i)
    );
  end generate;

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
      i_data      => ucm_prepro_av(sl_i),
      o_data      => csw_main_in_av(sl_i)
    );
  end generate;

  -- main cross switch
  SLC_CSW : entity ucm_lib.ucm_csw
  port map(
    clk         => clk,
    Reset_b     => Reset_b,
    glob_en     => glob_en,
    
    i_control   => csw_control,
    -- data
    i_data      => csw_main_in_av,
    o_data      => csw_main_out_av
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
    csw_main_out_ar(sl_i)         <= recordify(csw_main_out_av(sl_i));
    
    o_uCM2pl_ar(sl_i).muid        <= csw_main_out_ar(sl_i).muid;
    o_uCM2pl_ar(sl_i).common      <= csw_main_out_ar(sl_i).common;
    o_uCM2pl_ar(sl_i).chambers    <= csw_main_out_ar(sl_i).chambers;
    o_uCM2pl_ar(sl_i).specific    <= csw_main_out_ar(sl_i).specific;
    o_uCM2pl_ar(sl_i).data_valid  <= csw_main_out_ar(sl_i).data_valid;

    PL_PROC_IF: if sl_i >= MAX_NUM_SL - MAX_NUM_HEG generate
      o_uCM2pl_ar(sl_i).processed   <= proc_info(sl_i - (MAX_NUM_SL - MAX_NUM_HEG)).processed;
      o_uCM2pl_ar(sl_i).process_ch  <= proc_info(sl_i - (MAX_NUM_SL - MAX_NUM_HEG)).ch;
    end generate;
    PL_PROC_0: if sl_i < MAX_NUM_SL - MAX_NUM_HEG generate
      o_uCM2pl_ar(sl_i).processed   <= '0';
      o_uCM2pl_ar(sl_i).process_ch  <= (others => '0');
    end generate;

    o_uCM2pl_av(sl_i) <= vectorify(o_uCM2pl_ar(sl_i));
  end generate;

end beh;