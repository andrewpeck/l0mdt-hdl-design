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
use shared_lib.config_pkg.all;
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
    -- to hps
    o_uCM2hps_inn_av      : out ucm2hps_avt(NUM_THREADS -1 downto 0);
    o_uCM2hps_mid_av      : out ucm2hps_avt(NUM_THREADS -1 downto 0);
    o_uCM2hps_out_av      : out ucm2hps_avt(NUM_THREADS -1 downto 0);
    o_uCM2hps_ext_av      : out ucm2hps_avt(NUM_THREADS -1 downto 0);
    -- pipeline
    o_uCM2pl_av            : out pipelines_avt(MAX_NUM_SL -1 downto 0)
  );
end entity ucm;

architecture beh of ucm is
  signal ucm_prepro_av        : ucm_prepro_avt(MAX_NUM_SL -1 downto 0);
  -- signal csin_slc_data_av    : slc_prepro_avt(MAX_NUM_SL -1 downto 0);
  signal csw_main_in_av       : ucm_prepro_avt(MAX_NUM_SL -1 downto 0);
  signal csw_main_out_ar      : ucm_prepro_at(MAX_NUM_SL -1 downto 0);
  signal csw_main_out_av      : ucm_prepro_avt(MAX_NUM_SL -1 downto 0);

  signal o_uCM2pl_ar          : pipelines_at(MAX_NUM_SL -1 downto 0);
  -- signal o_uCM2pl_av          : pipeline_avt;

  signal cpam_in_av           : ucm_prepro_avt(NUM_THREADS -1 downto 0);
  signal cpam_out_av          : ucm_prepro_avt(NUM_THREADS -1 downto 0);

  signal uCM2pl_av            : pipelines_avt(MAX_NUM_SL -1 downto 0);

  signal csw_control          : ucm_csw_control_at(MAX_NUM_SL -1 downto 0);
  signal pam_CSW_control      : ucm_pam_control_at(NUM_THREADS -1 downto 0);
  signal proc_info            : ucm_proc_info_at(NUM_THREADS -1 downto 0);
  signal cvp_control          : std_logic_vector(NUM_THREADS -1 downto 0);

  -- signal int_slc_data         : slc_prepro_avt(MAX_NUM_SL -1 downto 0);
  type ucm2hps_aavt is array (NUM_THREADS -1 downto 0) of ucm2hps_avt(MAX_NUM_HPS -1 downto 0);
  signal uCM2hps_data         : ucm2hps_aavt;
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
    o_cvp_ctrl      => cvp_control
    -- o_pam2heg       => o_uCM2hps_pam_ar
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

  -- SLC_PP_A : for sl_i in MAX_NUM_SL -1 downto 0 generate
  --   SLC_PP : entity shared_lib.ucm_prepro
  --   port map(
  --     clk         => clk,
  --     Reset_b     => Reset_b,
  --     glob_en     => glob_en,
  --     --
  --     i_slc_data_av     => i_slc_data_av(sl_i),
  --     o_prepro_data_av  => ucm_prepro_av(sl_i)
  --   );
  -- end generate;

  -- input pipelines
  SLC_IN_PL_A : for sl_i in MAX_NUM_SL -1 downto 0 generate
    SLC_IN_PL : entity shared_lib.std_pipeline
    generic map(
      num_delays  => UCM_INPUT_PL_LATENCY,
      num_bits    => UCM_PREPRO_LEN
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
  SLC_VP_A : for vp_i in NUM_THREADS -1 downto 0 generate
    SLC_VP : entity ucm_lib.ucm_cvp
    port map(
      clk           => clk,
      Reset_b       => Reset_b,
      glob_en       => glob_en,
      --
      i_in_en       => cvp_control(vp_i),
      --
      i_data_v      => cpam_out_av(vp_i),
      o_uCM2hps_av  => uCM2hps_data(vp_i)

    );
  end generate;

  -- output pipelines
  SLC_OUT_PL_A : for sl_i in MAX_NUM_SL -1 downto 0 generate
    SLC_OUT_PL : entity shared_lib.std_pipeline
    generic map(
      num_delays  => UCM_OUTPUT_PL_LATENCY,
      num_bits    => PIPELINE_LEN
    )
    port map(
      clk         => clk,
      Reset_b     => Reset_b,
      glob_en     => glob_en,
      --
      i_data      => uCM2pl_av(sl_i),
      o_data      => o_uCM2pl_av(sl_i)
    );
  end generate;

  -- o_uCM2pl_av <= vectorify(o_uCM2pl_av);

  -- VP2HPS: for hps_i in MAX_NUM_HPS -1 downto 0 generate
    VP2HEG: for heg_i in NUM_THREADS -1 downto 0 generate
      VP2HPS_INN : if HPS_ENABLE_ST_INN generate
        o_uCM2hps_inn_av(heg_i) <= uCM2hps_data(heg_i)(0);
      end generate;
      VP2HPS_MID : if HPS_ENABLE_ST_MID generate
        o_uCM2hps_mid_av(heg_i) <= uCM2hps_data(heg_i)(1);
      end generate;
      VP2HPS_OUT : if HPS_ENABLE_ST_OUT generate
        o_uCM2hps_out_av(heg_i) <= uCM2hps_data(heg_i)(2);
      end generate;
      VP2HPS_EXT : if HPS_ENABLE_ST_EXT generate
        o_uCM2hps_ext_av(heg_i) <= uCM2hps_data(heg_i)(3);
      end generate;

      -- o_uCM2hps_data_av(hps_i)(heg_i) <= uCM2hps_data(heg_i)(hps_i);
    end generate;
  -- end generate;







  PAM_CSW: for heg_i in NUM_THREADS -1 downto 0 generate
    cpam_in_av(heg_i) <= csw_main_out_av(MAX_NUM_SL - ((NUM_THREADS - 1) - heg_i) - 1);
    -- cpam_in_av(heg_i) <= csw_main_out_av(MAX_NUM_SL - NUM_THREADS + heg_i);

    -- o_uCM2pl_ar(MAX_NUM_SL - NUM_THREADS + heg_i).processed <= proc_info(heg_i).processed;
    -- o_uCM2pl_ar(MAX_NUM_SL - NUM_THREADS + heg_i).processed <= proc_info(heg_i).ch;
  end generate;

  PL_PROC_GEN: for sl_i in MAX_NUM_SL -1 downto 0 generate
    csw_main_out_ar(sl_i)         <= structify(csw_main_out_av(sl_i));
    
    o_uCM2pl_ar(sl_i).muid        <= csw_main_out_ar(sl_i).muid;
    o_uCM2pl_ar(sl_i).common      <= csw_main_out_ar(sl_i).common;
    o_uCM2pl_ar(sl_i).chambers    <= csw_main_out_ar(sl_i).chambers;
    o_uCM2pl_ar(sl_i).specific    <= csw_main_out_ar(sl_i).specific;
    o_uCM2pl_ar(sl_i).data_valid  <= csw_main_out_ar(sl_i).data_valid;

    PL_PROC_IF: if sl_i >= MAX_NUM_SL - NUM_THREADS generate
      o_uCM2pl_ar(sl_i).processed   <= proc_info(sl_i - (MAX_NUM_SL - NUM_THREADS)).processed;
      o_uCM2pl_ar(sl_i).process_ch  <= proc_info(sl_i - (MAX_NUM_SL - NUM_THREADS)).ch;
    end generate;
    PL_PROC_0: if sl_i < MAX_NUM_SL - NUM_THREADS generate
      o_uCM2pl_ar(sl_i).processed   <= '0';
      o_uCM2pl_ar(sl_i).process_ch  <= (others => '0');
    end generate;

    uCM2pl_av(sl_i) <= vectorify(o_uCM2pl_ar(sl_i));
  end generate;

end beh;