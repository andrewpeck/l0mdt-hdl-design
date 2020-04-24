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

library shared_lib;
use shared_lib.cfg_pkg.all;
use shared_lib.interfaces_types_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity top_hp is
    Generic(
      radius      : integer := 0
      -- num_layers  : integer := 8
    );
    Port(
      clk                 : in std_logic;
      Reset_b             : in std_logic;
      glob_en             : in std_logic;
      -- configuration
      time_offset         : in unsigned(7 downto 0);
      -- RoI_size            : in unsigned(7 downto 0);
      -- SLc
      i_SLC_Window        : in SLc_window_std;
      i_slc_data_av          : in hp_slc_rt;
      -- MDT hit
      i_mdt_data          : in hp_hit_data_stdst;
      -- i_mdt_valid         : in std_logic;
      -- i_mdt_time_real     : in mdt_time_le_st;
      -- to Segment finder
      o_mdt2sf_data    : out hp2bm_stdst
    );
end top_hp;

architecture beh of top_hp is


begin

    Hit_Processor : entity hp_lib.hit_processor
    generic map(
      radius      => radius
      -- num_layers  => num_layers
      -- tube_max    => 5
    )
    port map(
      clk                 => clk,
      Reset_b             => Reset_b,
      glob_en             => glob_en,
      -- configuration
      time_offset         => time_offset,
      -- RoI_size            => RoI_size,
      -- SLc
      i_SLC_Window        => i_SLC_Window,
      i_slc_data_av          => i_slc_data_av,
      -- MDT hit
      i_mdt_data          => i_mdt_data,
      -- i_mdt_valid         => i_mdt_valid,
      -- i_mdt_time_real     => i_mdt_time_real,
      -- to Segment finder
      o_mdt2sf_data    => o_mdt2sf_data
      -- o_data_valid        => o_data_valid
    );

end beh;





