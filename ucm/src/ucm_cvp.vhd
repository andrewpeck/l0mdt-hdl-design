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
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_cvp is
  -- generic(
  --   num_delays          : integer; 
  --   num_bits            : integer
  -- );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_in_en             : in std_logic;
    --
    i_data_v            : in ucm_cde_rvt;
    o_ucm2hps_av        : out ucm2hps_bus_avt(MAX_NUM_HPS -1 downto 0)
      
  );
end entity ucm_cvp;

architecture beh of ucm_cvp is

  signal i_data_r     : ucm_cde_rt;
  signal ucm2hps_ar   : ucm2hps_bus_at(MAX_NUM_HPS -1 downto 0);

  signal slope        : signed(UCM_MBAR_LEN-1 downto 0);
  signal slope_dv     : std_logic;
  
begin

  B_SLOPE : if c_ST_nBARREL_ENDCAP = '0' generate

    SLOPE_CALC : entity ucm_lib.ucm_cvp_slope
    port map(
      clk           => clk,
      rst           => rst,
      glob_en       => glob_en,
      --
      i_data_v      => i_data_r.specific,
      i_data_Valid  => i_data_r.data_valid,
      o_slope       => slope,
      o_data_valid  => slope_dv
    );

  end generate;

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
      
        if c_ST_nBARREL_ENDCAP = '0' then  -- Barrel
          if c_SF_TYPE = '0' then --CSF
            if i_data_r.data_valid = '1' then
              for hps_i in MAX_NUM_HPS -1 downto 0 loop
                ucm2hps_ar(hps_i).muid .bcid <= i_data_r.muid .bcid;
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
