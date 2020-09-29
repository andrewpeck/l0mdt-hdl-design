--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: HPS candidate distributor
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

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library csf_lib;
use csf_lib.csf_pkg.all;

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;

library lsf_lib;

entity hps_sf_wrap is
  generic(
    g_STATION_RADIUS    : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;

    -- control
    csf_ctrl            : in  H2S_HPS_CSF_CTRL_t;
    csf_mon             : out H2S_HPS_CSF_MON_t;

    lsf_ctrl            : in  H2S_HPS_LSF_CTRL_t;
    lsf_mon             : out H2S_HPS_LSF_MON_t;

    -- configuration
    i_control_v         : in heg_ctrl2sf_rvt;
    i_slc_data_v        : in heg2sfslc_rvt;
    i_mdt_data_v        : in heg2sfhit_rvt;
    --
    o_sf_data_v         : out sf2ptcalc_rvt
  );
end entity hps_sf_wrap;

architecture beh of hps_sf_wrap is

  signal i_control_r  : heg_ctrl2sf_rt;
  -- CSF
  -- signal slc_data     : heg2sfslc_rt;
  -- signal slc_barrel : ucm_csf_barrel_rt;
  -- signal slc_endcap : ucm_csf_endcap_rt;
  signal mdt_data     : heg2sfhit_rt;
  signal sf_data_v    : sf2ptcalc_rvt;
  signal eof          : std_logic;
  

  --barrel
  signal i_seed_r     : heg2sfslc_rt;
  signal i_mdt_hit_r  : heg2sfhit_rt;
  signal i_seed_v     : csf_seed_rvt;
  signal i_mdt_hit_v  : heg2sfhit_rvt;

  -- LSF
  signal slc_roi        : std_logic_vector(HEG2SFSLC_LEN-1 downto 0);
  signal mdt_hit        : std_logic_vector(HEG2SFHIT_LEN-1 downto 0); -- 14
  signal lsf            : std_logic_vector(SF2PTCALC_LEN-1 downto 0);
 -- signal hba_max_clocks : std_logic_vector(9 downto 0);
 

begin

  i_control_r <= structify(i_control_v);

  EN_SF : if c_SF_ENABLED = '1' generate
    -- CSF
    EN_CSF : if c_SF_TYPE = '0' generate

      --slc_data <= structify(i_slc_data_v);

      --SF_B : if c_ST_nBARREL_ENDCAP = '0' generate
      --  --SLC
      --  -- slc_barrel <= structify(slc_data.specific);
      --  i_seed_v <= vectorify(i_seed_r);

      --  i_seed_r.muid       <= slc_data.muid;
      --  i_seed_r.mbar       <= slc_data.vec_ang;
      --  i_seed_r.vecpos        <= slc_data.vec_pos;
      --  i_seed_r.ang        <= (others => '0');
      --  i_seed_r.mdtid      <= slc_data.mdtid;
      --  i_seed_r.data_valid <= slc_data.data_valid;
        
      --  -- MDT
      --  mdt_data <= structify(i_mdt_data_v);
      --  i_mdt_hit_v <= vectorify(i_mdt_hit_r);

      --  i_mdt_hit_r.localy      <= mdt_data.localy;
      --  i_mdt_hit_r.localx      <= mdt_data.localx;
      --  i_mdt_hit_r.radius      <= mdt_data.radius;
      --  i_mdt_hit_r.mlayer      <= mdt_data.mlayer;
      --  i_mdt_hit_r.data_valid  <= mdt_data.data_valid;

      --  -- SF
      --  -- o_sf_data_v <= vectorify(sf_data_r);
      --  o_sf_data_v <= sf_data_v;
      --  -- sf_data_r.data_valid <= 

      --end generate;

      --SF_E : if c_ST_nBARREL_ENDCAP = '1' generate
      --  -- slc_endcap <= structify(slc_data.specific);
      --  i_seed_v <= vectorify(i_seed_r);
        
      --  i_seed_r.muid       <= slc_data.muid;
      --  i_seed_r.mbar       <= slc_data.vec_ang;
      --  i_seed_r.pos        <= (others => '0');
      --  i_seed_r.ang        <= slc_data.vec_pos;
      --  i_seed_r.mdtid <= slc_data.mdtid;
      --  i_seed_r.data_valid <= slc_data.data_valid;
      --end generate;



      CSF : entity csf_lib.csf
      generic map(
        FLAVOUR => to_integer(unsigned'("0" & c_ST_nBARREL_ENDCAP))
      )
      port map(
        clk        => clk,
        i_seed     => i_slc_data_v,
        i_mdt_hit  => i_mdt_data_v,
        i_eof      => i_control_r.eof,
        i_rst      => rst,
        o_seg      => sf_data_v
      );
      
    end generate;

    -- LSF
    EN_LSF : if c_SF_TYPE = '1' generate

      LSF : entity lsf_lib.top_lsf
       -- generic map(
          --FLAVOUR => to_integer(unsigned'("0" & c_ST_nBARREL_ENDCAP))
       --   )


        port map(
          clock           => clk,
          reset           => rst,
          slc_roi         => i_slc_data_v,
          mdt_hit         => i_mdt_data_v,
          lsf             => sf_data_v,
          hba_max_clocks  => lsf_ctrl.hba_max_clocks,
          --SpyBuffer 
          sb_lsf_mdt_hits_freeze        => lsf_ctrl.sb_lsf_mdt_hits_freeze,
          sb_lsf_mdt_hits_re            => lsf_ctrl.sb_lsf_mdt_hits_re,
          sb_lsf_mdt_hits_raddr         => lsf_ctrl.sb_lsf_mdt_hits_raddr,
          sb_lsf_mdt_hits_rdata         => lsf_mon.sb_lsf_mdt_hits_rdata 
          );

    end generate;

  end generate;

  DIS_SF : if c_SF_ENABLED = '0' generate

  end generate;


end beh;
