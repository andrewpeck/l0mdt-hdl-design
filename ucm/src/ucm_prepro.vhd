--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Muon Candidate Manager
--          Preprocesing
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
use shared_lib.common_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_prepro is
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_v          : in slc_rx_data_vt;
    -- pam out
    o_prepro_data_v       : out ucm_prepro_vt
  );
end entity ucm_prepro;

architecture beh of ucm_prepro is
  
  signal i_slc_data_r     : slc_rx_data_rt;
  signal o_prepro_data_r  : ucm_prepro_rt;

begin
  
  i_slc_data_r <= recordify(i_slc_data_v);
  o_prepro_data_v <= vectorify(o_prepro_data_r);

  UCM_PRE_PROC : process(Reset_b,clk) begin
    if(Reset_b = '0') then
      -- o_prepro_data_r <= nullify;
    elsif rising_edge(clk) then
      if i_slc_data_r.data_valid = '1' then
        o_prepro_data_r.muid <= i_slc_data_r.muid;
        o_prepro_data_r.chambers <= i_slc_data_r.chambers;
        o_prepro_data_r.common <= i_slc_data_r.common;
        o_prepro_data_r.specific <= i_slc_data_r.specific;
        o_prepro_data_r.data_valid <= i_slc_data_r.data_valid;
      else
        -- o_prepro_data_r <= nullify;
      end if;

    end if;
  end process;




  -- fala el calculo de phimod 
  -- falta el calculo de sl destino


end beh;