--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
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
-- use shared_lib.detector_param_pkg.all;
use shared_lib.fct_sector_phi_center_pkg.all;
 
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
    i_phicenter           : in unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0);
    --
    i_posphi            : in unsigned(SLC_COMMON_POSPHI_LEN -1 downto 0);
    i_dv                : in std_logic;
    --
    o_phimod            : out signed(UCM2PL_PHIMOD_LEN -1 downto 0);
    o_dv                : out std_logic
  );
end entity ucm_cvp_phimod;

architecture beh of ucm_cvp_phimod is



  type phimod_buff_art is array (g_PIPELINE downto 0) of signed(UCM2PL_PHIMOD_LEN -1 downto 0);
  signal phimod_buff : phimod_buff_art;-- := ( others =>  (others => '0'));
  signal dv_buff : std_logic_vector(g_PIPELINE - 1 downto 0);

  signal phimod : signed(UCM2PL_PHIMOD_LEN -1 downto 0);
  signal dv_first : std_logic;

  signal sphi_buff : integer;-- := 0;--unsigned(18 -1 downto 0);
  -- signal sphi : unsigned(SLC_COMMON_POSPHI_LEN -1 downto 0);
  signal phicenter : unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0) := get_sector_phi_center(c_SECTOR_ID,SLC_COMMON_POSPHI_LEN);
  -- signal phicenter_Default : unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0) := get_sector_phi_center(c_SECTOR_ID);

  constant reschanger : integer := integer((1024.0 * SLC_COMMON_POSPHI_MULT)/UCM2PL_PHIMOD_MULT);
  
begin

  o_phimod <= phimod_buff(0);

  PHIMOD_proc: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        
        sphi_buff <= 0;
        phimod <= (others => '0');
      else
        phicenter <= i_phicenter;

        if i_dv = '1' then
          sphi_buff <= (to_integer(i_posphi) * integer(reschanger))/1024;
          phimod <= to_signed(to_integer(unsigned(phicenter) - sphi_buff),UCM2PL_PHIMOD_LEN);
          dv_first <= '1';
        else
          phimod <= (others => '0');
          dv_first<= '0';
        end if;

        -- phimod_buff(g_PIPELINE - 1) <= to_signed(to_integer(unsigned(phicenter) - sphi_buff),UCM2PL_PHIMOD_LEN);

      end if;
    end if;
  end process;

  NO_PL_GEN: if g_PIPELINE = 0 generate
    o_phimod <= phimod;
  end generate NO_PL_GEN;

  PL_GEN: if g_PIPELINE > 0 generate
    phi_pl: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          dv_buff <= (others => '0');
          phimod_buff <= ( others =>  (others => '0'));
        else
          phimod_buff(g_PIPELINE -1) <= phimod;
          dv_buff(g_PIPELINE -1 ) <= dv_first;
          if g_PIPELINE > 1 then

            for i_p in g_PIPELINE - 1 downto 1 loop
              phimod_buff(i_p - 1) <= phimod_buff(i_p);
              dv_buff(i_p -1) <= dv_buff(i_p);
            end loop;

          end if;

        end if;
      end if;
    end process phi_pl;
  end generate PL_GEN;
  
  o_phimod <= phimod_buff(0);
  
  
end architecture beh;