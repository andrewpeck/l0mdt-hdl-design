--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: VAMC output cross switch 
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee.all;

library vamc_lib;


entity vamc_csw_out is
  generic(
    g_ADDR_WIDTH        : integer := 0;
    g_DATA_WIDTH        : integer := 0;
    -- INT CTRL
    g_FREEZE_ENABLED    : std_logic := '0';
    g_DUAL_MEM          : std_logic := '0'

  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    ena           : in std_logic;
    --
    i_freeze      : in std_logic;
    --
    i_data_a      : in std_logic_vector(g_DATA_WIDTH  - 1 downto 0);
    i_addr_a      : in std_logic_vector(g_ADDR_WIDTH  - 1 downto 0);
    i_data_b      : in std_logic_vector(g_DATA_WIDTH  - 1 downto 0);
    i_addr_b      : in std_logic_vector(g_ADDR_WIDTH  - 1 downto 0);
    --              
    o_data_a      : out std_logic_vector(g_DATA_WIDTH  - 1 downto 0);
    o_addr_a      : out std_logic_vector(g_ADDR_WIDTH  - 1 downto 0);
    o_data_b      : out std_logic_vector(g_DATA_WIDTH  - 1 downto 0);
    o_addr_b      : out std_logic_vector(g_ADDR_WIDTH  - 1 downto 0)

  );
end entity vamc_csw_out;

architecture beh of vamc_csw_out is
  
begin
  
  
  
end architecture beh;