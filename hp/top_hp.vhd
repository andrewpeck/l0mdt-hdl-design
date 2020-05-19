--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module:
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--   26/11/2019  0.1  File created
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- library work;
-- use work.cfg_global_pkg.all;

-- library shared_lib;
-- use shared_lib.cfg_global_pkg.all;

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity top_hp is
    Generic(
      -- config      : cfg_pkg := CFG_DEFAULTS;
      radius      : integer := 1
      -- num_layers  : integer := 8
    );
    Port(
      clk                 : in std_logic;    
      Reset_b             : in std_logic;
      glob_en             : in std_logic;
      -- configuration
      local_Reset_b       : in std_logic;
      local_en            : in std_logic;

      time_offset         : in unsigned(7 downto 0);
  
      -- SLc
      i_SLC_Window        : in hp_heg2hp_window_avt;
      i_slc_data_v        : in hp_heg2hp_slc_rvt;
      -- MDT hit
      i_mdt_data          : in hp_hpsPc2hp_rvt;
      -- to Segment finder
      o_hit_data          : out hp_hp2bm_rvt
    );
end top_hp;

architecture beh of top_hp is


begin

    Hit_Processor : entity hp_lib.hit_processor
    generic map(
      -- config      => config,
      radius      => radius
      -- num_layers  => num_layers
      -- tube_max    => 5
    )
    port map(
      clk                 => clk,
      Reset_b             => Reset_b,
      glob_en             => glob_en,
      -- configuration
      local_Reset_b       => local_Reset_b,
      local_en            => local_en,
      time_offset         => time_offset,
      -- RoI_size            => RoI_size,
      -- SLc
      i_SLC_Window        => i_SLC_Window,
      i_slc_data_v        => i_slc_data_v,
      -- MDT hit
      i_mdt_data          => i_mdt_data,
      -- i_mdt_valid         => i_mdt_valid,
      -- i_mdt_time_real     => i_mdt_time_real,
      -- to Segment finder
      o_hit_data          => o_hit_data
      -- o_data_valid        => o_data_valid
    );

end beh;





