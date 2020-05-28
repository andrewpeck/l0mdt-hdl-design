--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc data Cross switch
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
use shared_lib.config_pkg.all;
use shared_lib.common_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_csw is
  -- generic(
  --   num_delays          : integer; 
  --   num_bits            : integer
  -- );
  port (
    clk                 : in std_logic;
    rst            : in std_logic;
    glob_en             : in std_logic;
    --
    i_control           : in ucm_csw_control_at;
    --
    i_data              : in ucm_prepro_avt(MAX_NUM_SL -1 downto 0);
    o_data              : out ucm_prepro_avt(MAX_NUM_SL -1 downto 0)
  );
end entity ucm_csw;

architecture beh of ucm_csw is

begin
  UCM_MAIN_CSW : process(rst,clk) begin
    if rising_edge(clk) then
      if(rst= '1') then
        o_data <= (others => (others => '0'));
      else
        for csw_i in MAX_NUM_SL -1 downto 0 loop
          if i_control(csw_i).data_present = '1' then
            o_data(csw_i) <= i_data(to_integer(unsigned(i_control(csw_i).addr_orig)));
          else
            o_data(csw_i) <= (others => '0');
          end if;
        end loop;
      end if;
    end if;
  end process;
end beh;























