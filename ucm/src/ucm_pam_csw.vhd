--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: pam csw for processing
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_pam_csw is
  -- generic(
  --   num_delays          : integer; 
  --   num_bits            : integer
  -- );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    --
    i_control           : in ucm_pam_control_rt;
    --
    i_data              : in ucm_prepro_avt(MAX_NUM_HEG -1 downto 0);
    o_data              : out ucm_prepro_avt(MAX_NUM_HEG -1 downto 0)
  );
end entity ucm_pam_csw;

architecture beh of ucm_pam_csw is

begin
  UCM_PAM_CS : process(Reset_b,clk) begin
    if(Reset_b = '0') then
      o_data <= (others => (others => '0'));
    elsif rising_edge(clk) then
      for csw_i in MAX_NUM_HEG -1 downto 0 loop
        if i_control.data_present(csw_i) = '1' then
          o_data(csw_i) <= i_data(to_integer(unsigned(i_control.addr_orig(csw_i))));
        else
          o_data(csw_i) <= (others => '0');
        end if;
      end loop;
    end if;
  end process;
end beh;






