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

entity hps_sf_wrap is
  generic(
    g_STATION_RADIUS    : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    i_control        : in heg_ctrl2hp_rvt;
    i_slc_data       : in heg2sf_rvt;
    i_mdt_data       : in heg2sfhit_rvt;
    --
    o_sf_data_v         : out sf2ptcalc_rvt
  );
end entity hps_sf_wrap;

architecture beh of hps_sf_wrap is
  -- CSF
  signal slc_data     : heg2sf_rt;
  -- signal slc_barrel : ucm_csf_barrel_rt;
  -- signal slc_endcap : ucm_csf_endcap_rt;
  signal mdt_data : heg2sfhit_rt;
  signal sf_data_v    : sf2ptcalc_rvt;
  signal eof          : std_logic;
  

  --barrel
  signal i_seed_r     : csf_seed_rt;
  signal i_mdt_hit_r  : heg2sfhit_rt;
  signal i_seed_v     : csf_seed_rvt;
  signal i_mdt_hit_v  : heg2sfhit_rvt;

begin

  EN_SF : if c_SF_ENABLED = '1' generate
    -- CSF
    EN_CSF : if c_SF_TYPE = '0' generate

      slc_data <= structify(i_slc_data);

      SF_B : if c_ST_nBARREL_ENDCAP = '0' generate
        --SLC
        -- slc_barrel <= structify(slc_data.specific);
        i_seed_v <= vectorify(i_seed_r);

        i_seed_r.muid       <= slc_data.muid;
        i_seed_r.mbar       <= slc_data.vec_ang;
        i_seed_r.pos        <= slc_data.vec_pos;
        i_seed_r.ang        <= (others => '0');
        i_seed_r.chamber_ieta <= slc_data.mdtid.chamber_ieta;
        i_seed_r.data_valid <= slc_data.data_valid;
        
        -- MDT
        mdt_data <= structify(i_mdt_data);
        i_mdt_hit_v <= vectorify(i_mdt_hit_r);

        i_mdt_hit_r.local_y    <= mdt_data.local_y;
        i_mdt_hit_r.local_x    <= mdt_data.local_x;
        i_mdt_hit_r.radius     <= mdt_data.radius;
        i_mdt_hit_r.multilayer <= mdt_data.multilayer;
        i_mdt_hit_r.data_valid <= mdt_data.data_valid;

        -- SF
        -- o_sf_data_v <= vectorify(sf_data_r);
        o_sf_data_v <= sf_data_v;
        -- sf_data_r.data_valid <= 

      end generate;

      SF_E : if c_ST_nBARREL_ENDCAP = '1' generate
        -- slc_endcap <= structify(slc_data.specific);
        i_seed_v <= vectorify(i_seed_r);
        
        i_seed_r.muid       <= slc_data.muid;
        i_seed_r.mbar       <= slc_data.vec_ang;
        i_seed_r.pos        <= (others => '0');
        i_seed_r.ang        <= slc_data.vec_pos;
        i_seed_r.chamber_ieta <= slc_data.mdtid.chamber_ieta;
        i_seed_r.data_valid <= slc_data.data_valid;
      end generate;



      CSF : entity csf_lib.csf
      generic map(
        FLAVOUR => to_integer(unsigned'("0" & c_ST_nBARREL_ENDCAP))
      )
      port map(
        clk        => clk,
        i_seed     => i_seed_v,
        i_mdt_hit  => i_mdt_hit_v,
        i_eof      => eof,
        i_rst      => rst,
        o_seg      => sf_data_v
      );
      
    end generate;

    -- LSF
    EN_LSF : if c_SF_TYPE = '1' generate
      
    end generate;

  end generate;

  DIS_SF : if c_SF_ENABLED = '0' generate

  end generate;


end beh;