--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Main pipe line cross switch to track fitter
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

library mpl_lib;


entity mpl_csw is

  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc pipeline
    i_ucm_av            : in pl2pt_bus_avt(c_NUM_THREADS -1 downto 0);
    o_tf_av             : out pl2pt_bus_avt(c_NUM_THREADS -1 downto 0)
    -- o_mtc_av          : out pl2mtc_bus_avt(c_MAX_NUM_SL -1 downto 0)
  );
end entity mpl_csw;

architecture beh of mpl_csw is

  signal slc_pl : pl2pt_bus_at(c_NUM_THREADS -1 downto 0);
  
begin

  V2R: for sl_i in c_NUM_THREADS - 1 downto 0 generate
    slc_pl(sl_i) <= structify(i_ucm_av(sl_i));
  end generate V2R;

  MP2TF_CSW: process(clk)
    variable sli_i      : integer := 0;
    variable slo_found  : std_logic := '0';
  begin
    if rising_edge(clk) then
      if rst = '1' then
        
      else
        for slo_i in c_NUM_THREADS -1 downto 0 loop
          slo_found := '0';
          for sli_i in c_NUM_THREADS -1 downto 0 loop
            if ((slc_pl(sli_i).busy = '1') and (to_integer(unsigned(slc_pl(sli_i).process_ch)) = slo_i)) then
              o_tf_av(slo_i) <= i_ucm_av(sli_i);
              slo_found := '1';
            end if;
          end loop;
          if slo_found = '0' then
            o_tf_av(slo_i) <= nullify(o_tf_av(slo_i));
          end if;
        end loop;
        
      end if;
    end if;
  end process MP2TF_CSW;
  
  -- 
  
end architecture beh;

