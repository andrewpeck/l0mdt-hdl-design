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
use shared_lib.interfaces_types_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_prepro is-
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_av          : in slc_rx_data_avt(MAX_NUM_SL -1 downto 0);
    -- pam out
    o_prepro_data_av       : out ucm_prepro_avt(MAX_NUM_SL -1 downto 0)
  );
end entity ucm_prepro;

architecture beh of ucm_prepro is


begin

  
end beh;