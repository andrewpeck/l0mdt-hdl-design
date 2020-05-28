--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc vector processor
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

entity ucm_cvp is
  -- generic(
  --   num_delays          : integer; 
  --   num_bits            : integer
  -- );
  port (
    clk                 : in std_logic;
    rst            : in std_logic;
    glob_en             : in std_logic;
    --
    i_in_en             : in std_logic;
    --
    i_data_v            : in ucm_prepro_rvt;
    o_ucm2hps_av        : out ucm2hps_avt(MAX_NUM_HPS -1 downto 0)
      
  );
end entity ucm_cvp;

architecture beh of ucm_cvp is
  signal i_data_r     : ucm_prepro_rt;
  signal ucm2hps_ar   : ucm2hps_at(MAX_NUM_HPS -1 downto 0);
begin

  i_data_r <= structify(i_data_v);

  UCM_HPS_GEN: for hps_i in MAX_NUM_HPS -1 downto 0 generate
    o_ucm2hps_av(hps_i) <= vectorify(ucm2hps_ar(hps_i));
  end generate;

  UCM_CVP : process(rst,clk) begin
    if rising_edge(clk) then
      if rst= '1' then
        for hps_i in MAX_NUM_HPS -1 downto 0 loop
          ucm2hps_ar(hps_i) <= nullify(ucm2hps_ar(hps_i));
        end loop;
      else
        -- como usar i_in_en?
      
        if ST_nBARREL_ENDCAP = '0' then  -- Barrel
          if SF_type = '0' then --CSF
            if i_data_r.data_valid = '1' then
              for hps_i in MAX_NUM_HPS -1 downto 0 loop
                ucm2hps_ar(hps_i).id.bcid <= i_data_r.muid.bcid;
              end loop;
              -- slope / mbar calc
              -- local origin calc : to be done in HEG local origin of window
            else
              for hps_i in MAX_NUM_HPS -1 downto 0 loop
                ucm2hps_ar(hps_i) <= nullify(ucm2hps_ar(hps_i));
              end loop;
            end if;
          else --LSF
          end if;
        else -- Endcap
        end if;
      end if;
    end if;
  end process;



end beh;