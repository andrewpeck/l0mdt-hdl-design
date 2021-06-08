--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc Control Sorting algorithm + PAM
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_ctrl_top is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena             : in std_logic;
    --
    i_prepro2ctrl_av    : in ucm_prepro2ctrl_bus_avt(c_MAX_NUM_SL -1 downto 0);
    --
    o_csw_ctrl          : out ucm_csw_control_at(c_MAX_NUM_SL -1 downto 0);
    o_pam_ctrl          : out ucm_pam_control_at(c_NUM_THREADS -1 downto 0);
    o_proc_info         : out ucm_proc_info_at(c_NUM_THREADS -1 downto 0);
    --
    o_cvp_rst           : out std_logic_vector(c_NUM_THREADS -1 downto 0);
    o_cvp_ctrl          : out std_logic_vector(c_NUM_THREADS -1 downto 0)
    -- o_pam2heg           : out ucm2heg_pam_art(c_NUM_THREADS -1 downto 0)    
  );
end entity ucm_ctrl_top;

architecture beh of ucm_ctrl_top is

  -- component ucm_ctrl_main is
  --   port (
  --     clk                 : in std_logic;
  --     rst                 : in std_logic;
  --     ena             : in std_logic;
  --     -- extrnals
  --     i_data              : in ucm_prepro2ctrl_bus_avt(c_MAX_NUM_SL -1 downto 0);
  --     o_csw_ctrl          : out ucm_csw_control_at;
  --     -- internals
  --     o_num_cand          : out unsigned(3 downto 0);
  --     o_pam_update        : out std_logic
  
  --   );
  -- end component;

  -- component ucm_ctrl_pam is
  --   port (
  --     clk                 : in std_logic;
  --     rst                 : in std_logic;
  --     ena             : in std_logic;
  --     --
  --     i_num_cand          : in unsigned(3 downto 0);
  --     i_pam_update        : in std_logic;
  --     --
  --     o_pam_ctrl          : out ucm_pam_control_at(c_NUM_THREADS -1 downto 0);
  --     o_proc_info         : out ucm_proc_info_at(c_NUM_THREADS -1 downto 0);
  --     --
  --     o_cvp_rst           : out std_logic_vector(c_NUM_THREADS -1 downto 0);
  --     o_cvp_ctrl          : out std_logic_vector(c_NUM_THREADS -1 downto 0)
  --     -- o_pam2heg           : out ucm2heg_pam_art(c_NUM_THREADS -1 downto 0);
  --     -- internals
  --   );
  -- end component;

  signal num_cand          : unsigned(3 downto 0);
  signal pam_update        : std_logic;


begin

  MAIN_CTRL : entity ucm_lib.ucm_ctrl_main
  port map(
    clk                 => clk,
    rst                 => rst,
    ena             => ena,
    -- extrnals
    i_data              => i_prepro2ctrl_av,
    o_csw_ctrl          => o_csw_ctrl,
    -- internals
    o_num_cand          => num_cand,
    o_pam_update        => pam_update
  );

  PAM_CTRL : entity ucm_lib.ucm_ctrl_pam
  port map(
    clk                 => clk,
    rst                 => rst,
    ena             => ena,
    --
    i_num_cand          => num_cand,
    i_pam_update        => pam_update,
    --
    o_pam_ctrl          => o_pam_ctrl,
    o_proc_info         => o_proc_info,
    --
    o_cvp_rst           => o_cvp_rst,
    o_cvp_ctrl          => o_cvp_ctrl
    -- o_pam2heg             => o_pam2heg,
    -- internals

  );

end beh;
