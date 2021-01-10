--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: phimod calculator
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.detector_param_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

entity ucm_cvp_phimod is
  generic(
    g_PIPELINE : integer := 0
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    --
    SECTOR_PHI          : in UCM_SECTOR_PHI_CTRL_t;
    --
    i_posphi            : in unsigned(SLC_COMMON_POSPHI_LEN -1 downto 0);
    i_dv                : in std_logic;
    --
    o_phimod            : out signed(UCM2PL_PHIMOD_LEN -1 downto 0)
    -- o_dv                : out std_logic;
  );
end entity ucm_cvp_phimod;

architecture beh of ucm_cvp_phimod is



  type phimod_buff_at is array (g_PIPELINE downto 0) of signed(UCM2PL_PHIMOD_LEN -1 downto 0);
  signal phimod_buff : phimod_buff_at := ( others =>  (others => '0'));

  signal sphi_buff : integer := 0;--unsigned(18 -1 downto 0);
  -- signal sphi : unsigned(SLC_COMMON_POSPHI_LEN -1 downto 0);
  signal phicenter : unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0) := (others => '0');
  signal phicenter_Default : unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0) := get_sector_phi_center(c_SECTOR_ID);

  constant reschanger : real := SLC_COMMON_POSPHI_MULT/UCM2PL_PHIMOD_MULT;
  
begin

  OVERRIDES : process(clk)
  begin
    if rising_edge(clk) then
      if SECTOR_PHI.OVERRIDE = '1' then
        phicenter <= unsigned(SECTOR_PHI.VALUE(SLC_COMMON_POSPHI_LEN -1 downto 0));
      else
        phicenter <= phicenter_Default;
      end if;
    end if;
  end process;

  o_phimod <= phimod_buff(0);

  PHIMOD: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        -- sphi <= sphi_buff;
        -- phicenter <= 
        sphi_buff <= 0;
        phimod_buff <= ( others =>  (others => '0'));
      else
        -- sphi_buff <= i_posphi * to_unsigned(integer(reschanger),9);
        -- phimod_buff(g_PIPELINE) <= resize(signed(resize(signed(SECTOR_PHI),32) - signed(sphi_buff)),UCM2PL_PHIMOD_LEN);
        --
        if i_dv = '1' then
          sphi_buff <= to_integer(i_posphi) * integer(reschanger);
        else
          sphi_buff <= 0;
        end if;
        phimod_buff(g_PIPELINE) <= to_signed(to_integer(unsigned(phicenter) - sphi_buff),UCM2PL_PHIMOD_LEN);
        --
        --resize(signed(sphi_buff),32)),UCM2PL_PHIMOD_LEN);
        for i_p in g_PIPELINE downto 1 loop
          phimod_buff(i_p - 1) <= phimod_buff(i_p);
        end loop;
      end if;
    end if;
  end process PHIMOD;
  
  
  
end architecture beh;