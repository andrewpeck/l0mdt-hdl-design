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
use shared_lib.cfg_pkg.all;
use shared_lib.interfaces_types_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

entity hps_slc_dist is
  generic(
    radius      : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration & control
    i_uCM_pam           : in ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0);
    -- SLc
    i_uCM_data          : in ucm2heg_slc_astdst(MAX_NUM_HEG -1 downto 0);
    o_uCM_data          : out ucm2heg_slc_astdst(MAX_NUM_HEG -1 downto 0)
  );
end entity hps_slc_dist;

architecture beh of hps_slc_dist is

begin

  SLc_CS : process(Reset_b,clk) begin
    if(not Reset_b) then
      o_uCM_data <= (others => (others=> '0'));
    elsif rising_edge(clk) then
      
      for pam_i in MAX_NUM_HEG -1 downto 0 loop
        if(i_uCM_pam(pam_i).sel) then
          o_uCM_data(to_integer(unsigned(i_uCM_pam(pam_i).addr))) <= i_uCM_data(pam_i);
        end if;
      end loop;

      
    end if;
  end process;


end beh;