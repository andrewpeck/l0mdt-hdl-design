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
    i_slc_data          : in slprepro_Data_astdst(MAX_NUM_SL -1 downto 0);
    -- pam out
    o_uCM2hps_pam       : out ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0);
    o_uCM2hps_data      : out ucm2hps_slc_astdst(MAX_NUM_HPS -1 downto 0);
    -- MDT hit
    o_uCM2pl            : out ucm_pl_data_astdst(MAX_NUM_SL -1 downto 0)
  );
end entity ucm;

architecture beh of ucm is
  signal csin_slc_data    : slprepro_Data_astdst(MAX_NUM_SL -1 downto 0);
  signal csout_slc_data   : ucm_pl_data_astdst(MAX_NUM_SL -1 downto 0);

  signal csw_control      : ucm_csw_control_rt;
  signal cvp_control      : std_logic_vector(MAX_NUM_HEG -1 downto 0);

  -- signal int_slc_data     : slprepro_Data_astdst(MAX_NUM_SL -1 downto 0);
  signal uCM2hps_data     : ucm_vp_data_aastdst(MAX_NUM_HEG -1 downto 0);
begin

  -- input pipelines
  SLC_IN_PL_A : for sl_i in MAX_NUM_SL -1 downto 0 generate
    SLC_IN_PL : entity shared_lib.std_pipeline
    generic map(
      num_delays  => UCM_INPUT_PL_LATENCY,
      num_bits    => SLPREPRO_WIDTH
    )
    port map(
      clk         => clk,
      Reset_b     => Reset_b,
      glob_en     => glob_en,
      --
      i_data      => i_slc_data(sl_i),
      o_data      => csin_slc_data(sl_i)
    );
  end generate;
  -- cross switch
  SLC_CSW : entity ucm_lib.ucm_csw
  port map(
    clk         => clk,
    Reset_b     => Reset_b,
    glob_en     => glob_en,
    
    i_control   => csw_control,
    -- data
    i_data      => csin_slc_data,
    o_data      => csout_slc_data
  );
  --control
  SLC_CTRL : entity ucm_lib.ucm_ctrl
  port map(
    clk         => clk,
    Reset_b     => Reset_b,
    glob_en     => glob_en,
    --
    i_data      => i_slc_data,
    --
    o_csw_ctrl  => csw_control,
    o_cvp_ctrl  => cvp_control,
    o_pam       => o_uCM2hps_pam
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
      i_data      => csout_slc_data(MAX_NUM_SL - ((MAX_NUM_HEG  -1) - vp_i) - 1),
      o_ucm2hps   => uCM2hps_data(vp_i)

    );
  end generate;

  VP2HPS: for hps_i in MAX_NUM_HPS -1 downto 0 generate
    VP2HEG: for heg_i in MAX_NUM_HEG -1 downto 0 generate
      o_uCM2hps_data(hps_i)(heg_i) <= uCM2hps_data(heg_i)(hps_i);
    end generate;
  end generate;

  o_uCM2pl <= csout_slc_data;

end beh;