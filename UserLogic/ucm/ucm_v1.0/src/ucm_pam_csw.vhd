--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
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
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_pam_csw is
  -- generic(
  --   g_DELAY_CYCLES          : integer; 
  --   num_bits            : integer
  -- );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_control           : in ucm_pam_control_art;
    --
    i_data              : in  ucm_cde_avt(c_NUM_THREADS -1 downto 0);
    o_data              : out ucm_cde_avt(c_NUM_THREADS -1 downto 0)
  );
end entity ucm_pam_csw;

architecture beh of ucm_pam_csw is

begin
  UCM_PAM_CS : process(rst,clk) begin
    if rising_edge(clk) then
      if(rst= '1') then
        o_data <= (others => (others => '0'));
      else
        for csw_i in c_NUM_THREADS -1 downto 0 loop
          if i_control(csw_i).data_present = '1' then
            o_data(csw_i) <= i_data(to_integer(unsigned(i_control(csw_i).addr_dest)));
          else
            o_data(csw_i) <= (others => '0');
          end if;
        end loop;
      end if;
    end if;
  end process;
end beh;






