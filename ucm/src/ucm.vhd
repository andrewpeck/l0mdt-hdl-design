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
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm is
  port (
    clk                     : in std_logic;
    rst                     : in std_logic;
    glob_en                 : in std_logic;
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_mainA_av     : in slc_rx_bus_avt(2 downto 0);
    i_slc_data_mainB_av     : in slc_rx_bus_avt(2 downto 0);
    i_slc_data_neighborA_v  : in slc_rx_rvt;
    i_slc_data_neighborB_v  : in slc_rx_rvt;
    -- to hps
    o_uCM2hps_inn_av        : out ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_mid_av        : out ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_out_av        : out ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_ext_av        : out ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
    -- pipeline
    o_uCM2pl_av             : out ucm2pl_bus_avt(c_MAX_NUM_SL -1 downto 0)
  );
end entity ucm;

architecture beh of ucm is

  signal i_slc_data_av        : slc_rx_bus_avt(c_MAX_NUM_SL -1 downto 0);
  --
  signal prepro2ctrl_av       : ucm_prepro2ctrl_bus_avt(c_MAX_NUM_SL -1 downto 0);
  --
  signal ucm_prepro_av        : slc_rx_bus_avt(c_MAX_NUM_SL -1 downto 0);
  -- signal csin_slc_data_av    : slc_prepro_avt(c_MAX_NUM_SL -1 downto 0);
  signal csw_main_in_av       : slc_rx_bus_avt(c_MAX_NUM_SL -1 downto 0);
  signal csw_main_out_ar      : slc_rx_bus_at(c_MAX_NUM_SL -1 downto 0);
  signal csw_main_out_av      : slc_rx_bus_avt(c_MAX_NUM_SL -1 downto 0);

  signal slc_endcap_ar        : slc_endcap_bus_at(c_MAX_NUM_SL -1 downto 0);

  signal cde_in_av            : slc_rx_bus_avt(c_NUM_THREADS -1 downto 0);

  signal o_uCM2pl_ar          : ucm2pl_bus_at(c_MAX_NUM_SL -1 downto 0);
  -- signal o_uCM2pl_av          : pipeline_avt;

  signal cpam_in_av           : ucm_cde_bus_avt(c_NUM_THREADS -1 downto 0);
  signal cpam_out_av          : ucm_cde_bus_avt(c_NUM_THREADS -1 downto 0);

  signal uCM2pl_av            : ucm2pl_bus_avt(c_MAX_NUM_SL -1 downto 0);

  signal csw_control          : ucm_csw_control_at(c_MAX_NUM_SL -1 downto 0);
  signal pam_CSW_control      : ucm_pam_control_at(c_NUM_THREADS -1 downto 0);
  signal proc_info            : ucm_proc_info_at(c_NUM_THREADS -1 downto 0);
  signal cvp_control          : std_logic_vector(c_NUM_THREADS -1 downto 0);

  -- signal int_slc_data         : slc_prepro_avt(c_MAX_NUM_SL -1 downto 0);
  type ucm2hps_aavt is array (c_NUM_THREADS -1 downto 0) of ucm2hps_bus_avt(c_MAX_POSSIBLE_HPS -1 downto 0);
  signal uCM2hps_data         : ucm2hps_aavt;

begin


  SLC_BoEs : if c_ST_nBARREL_ENDCAP = '0' or c_ENDCAP_nSMALL_LARGE = '0' generate
    i_slc_data_av(c_MAX_NUM_SL -1) <= i_slc_data_mainA_av(2);
    i_slc_data_av(c_MAX_NUM_SL -2) <= i_slc_data_mainA_av(1);
    i_slc_data_av(c_MAX_NUM_SL -3) <= i_slc_data_mainA_av(0);
    SLC1 : if c_ENABLE_NEIGHBORS = '1' generate
      i_slc_data_av(c_MAX_NUM_SL -4) <= i_slc_data_neighborA_v;
      i_slc_data_av(c_MAX_NUM_SL -5) <= i_slc_data_neighborB_v;
    end generate;
  end generate;



  --control
  SLC_CTRL : entity ucm_lib.ucm_ctrl
  port map(
    clk               => clk,
    rst               => rst,
    glob_en           => glob_en,
    --
    i_prepro2ctrl_av  => prepro2ctrl_av,
    --
    o_csw_ctrl        => csw_control,
    o_pam_ctrl        => pam_CSW_control,
    o_proc_info       => proc_info,
    o_cvp_ctrl        => cvp_control
    -- o_pam2heg         => o_uCM2hps_pam_ar
  );

  --input pre processor
  SLC_PP_A : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    SLC_PP : entity ucm_lib.ucm_prepro
    port map(
      clk               => clk,
      rst               => rst,
      glob_en           => glob_en,
      --                =>
      i_slc_data_v      => i_slc_data_av(sl_i),
      o_prepro2ctrl_v   => prepro2ctrl_av(sl_i),
      o_prepro_data_v   => ucm_prepro_av(sl_i)
    );
  end generate;

  -- input pipelines
  SLC_IN_PL_A : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    SLC_IN_PL : entity shared_lib.std_pipeline
    generic map(
      num_delays  => UCM_INPUT_PL_LATENCY,
      num_bits    => SLC_RX_LEN
    )
    port map(
      clk         => clk,
      rst         => rst,
      glob_en     => '1',
      --
      i_data      => ucm_prepro_av(sl_i),
      o_data      => csw_main_in_av(sl_i)
    );
  end generate;

  -- main cross switch
  SLC_CSW : entity ucm_lib.ucm_csw
  port map(
    clk         => clk,
    rst         => rst,
    glob_en     => glob_en,
    
    i_control   => csw_control,
    -- data
    i_data      => csw_main_in_av,
    o_data      => csw_main_out_av
  );

  -- Candidate Data Extractor
  SLC_CDE_A : for sl_i in c_NUM_THREADS -1 downto 0 generate
    SLC_CDE : entity ucm_lib.ucm_cde
    port map(
      clk               => clk,
      rst               => rst,
      glob_en           => glob_en,
      --                =>
      i_slc_data_v      => cde_in_av(sl_i),
      o_cde_data_v      => cpam_in_av(sl_i)
    );
  end generate;

  -- PAM cross switch
  SLC_PAM_CSW : entity ucm_lib.ucm_pam_csw
  port map(
    clk         => clk,
    rst         => rst,
    glob_en     => glob_en,
    
    i_control   => pam_CSW_control,
    -- data
    i_data      => cpam_in_av,
    o_data      => cpam_out_av
  );


  -- vector processors
  SLC_VP_A : for vp_i in c_NUM_THREADS -1 downto 0 generate
    SLC_VP : entity ucm_lib.ucm_cvp
    port map(
      clk           => clk,
      rst           => rst,
      glob_en       => glob_en,
      --
      i_in_en       => cvp_control(vp_i),
      --
      i_data_v      => cpam_out_av(vp_i),
      o_uCM2hps_av  => uCM2hps_data(vp_i)

    );
  end generate;

  -- output pipelines
  SLC_OUT_PL_A : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    SLC_OUT_PL : entity shared_lib.std_pipeline
    generic map(
      num_delays  => UCM_OUTPUT_PL_LATENCY,
      num_bits    => UCM2PL_LEN
    )
    port map(
      clk         => clk,
      rst         => rst,
      glob_en     => glob_en,
      --
      i_data      => uCM2pl_av(sl_i),
      o_data      => o_uCM2pl_av(sl_i)
    );
  end generate;

  -- o_uCM2pl_av <= vectorify(o_uCM2pl_av);

  -- VP2HPS: for hps_i in c_MAX_NUM_HPS -1 downto 0 generate
    VP2HEG: for heg_i in c_NUM_THREADS -1 downto 0 generate
      VP2HPS_INN : if c_HPS_ENABLE_ST_INN generate
        o_uCM2hps_inn_av(heg_i) <= uCM2hps_data(heg_i)(0);
      end generate;
      VP2HPS_MID : if c_HPS_ENABLE_ST_MID generate
        o_uCM2hps_mid_av(heg_i) <= uCM2hps_data(heg_i)(1);
      end generate;
      VP2HPS_OUT : if c_HPS_ENABLE_ST_OUT generate
        o_uCM2hps_out_av(heg_i) <= uCM2hps_data(heg_i)(2);
      end generate;
      VP2HPS_EXT : if c_HPS_ENABLE_ST_EXT generate
        o_uCM2hps_ext_av(heg_i) <= uCM2hps_data(heg_i)(3);
      end generate;

      -- o_uCM2hps_data_av(hps_i)(heg_i) <= uCM2hps_data(heg_i)(hps_i);
    end generate;
  -- end generate;


  PAM_CSW: for heg_i in c_NUM_THREADS -1 downto 0 generate
    cde_in_av(heg_i) <= csw_main_out_av(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - heg_i) - 1);
    -- cpam_in_av(heg_i) <= csw_main_out_av(c_MAX_NUM_SL - c_NUM_THREADS + heg_i);

    -- o_uCM2pl_ar(c_MAX_NUM_SL - c_NUM_THREADS + heg_i).processed <= proc_info(heg_i).processed;
    -- o_uCM2pl_ar(c_MAX_NUM_SL - c_NUM_THREADS + heg_i).processed <= proc_info(heg_i).ch;
  end generate;



  PL_PROC_GEN: for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    csw_main_out_ar(sl_i)         <= structify(csw_main_out_av(sl_i));
    
    BARREL_GEN : if c_ST_nBARREL_ENDCAP = '0' generate
      -- slc_endcap_ar(sl_i)                 <= structify(csw_main_out_ar(sl_i).specific);
      o_uCM2pl_ar(sl_i).nswseg_poseta     <= (others => '0');--slc_endcap_ar(sl_i).nswseg_poseta;
      o_uCM2pl_ar(sl_i).nswseg_posphi     <= (others => '0');--slc_endcap_ar(sl_i).nswseg_posphi;
      o_uCM2pl_ar(sl_i).nswseg_angdtheta  <= (others => '0');--slc_endcap_ar(sl_i).nswseg_angdtheta;
    end generate;

    ENCAP_GEN : if c_ST_nBARREL_ENDCAP = '1' generate
      slc_endcap_ar(sl_i)                 <= structify(csw_main_out_ar(sl_i).specific);
      o_uCM2pl_ar(sl_i).nswseg_poseta     <= slc_endcap_ar(sl_i).nswseg_poseta;
      o_uCM2pl_ar(sl_i).nswseg_posphi     <= slc_endcap_ar(sl_i).nswseg_posphi;
      o_uCM2pl_ar(sl_i).nswseg_angdtheta  <= slc_endcap_ar(sl_i).nswseg_angdtheta;
    end generate;

    -- o_uCM2pl_ar(sl_i).muid        <= csw_main_out_ar(sl_i).muid;
    o_uCM2pl_ar(sl_i).common      <= csw_main_out_ar(sl_i).common;
    -- o_uCM2pl_ar(sl_i).chambers    <= csw_main_out_ar(sl_i).chambers;
    -- o_uCM2pl_ar(sl_i).specific    <= csw_main_out_ar(sl_i).specific;
    o_uCM2pl_ar(sl_i).data_valid  <= csw_main_out_ar(sl_i).data_valid;

    PL_PROC_IF: if sl_i >= c_MAX_NUM_SL - c_NUM_THREADS generate
      o_uCM2pl_ar(sl_i).busy   <= proc_info(sl_i - (c_MAX_NUM_SL - c_NUM_THREADS)).processed;
      o_uCM2pl_ar(sl_i).process_ch  <= proc_info(sl_i - (c_MAX_NUM_SL - c_NUM_THREADS)).ch;
    end generate;
    PL_PROC_0: if sl_i < c_MAX_NUM_SL - c_NUM_THREADS generate
      o_uCM2pl_ar(sl_i).busy   <= '0';
      o_uCM2pl_ar(sl_i).process_ch  <= (others => '0');
    end generate;

    uCM2pl_av(sl_i) <= vectorify(o_uCM2pl_ar(sl_i));
  end generate;

end beh;
