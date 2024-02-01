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
library ieee;
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
use shared_lib.fct_barrel_chamb_z2origin_pkg.all;

 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

entity ucm_ieta_calc is
  generic(
    g_STATION           : integer := 0;
    g_RESOLUTION_SCALE  : real := 1.0;
    g_INPUT_WIDTH       : integer := 32
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    --
    -- CHAMBER_Z0_CALC_WR  : in UCM_DP_CHAMB_Z0_DP_CHAMB_Z0_WR_CTRL_t;
    -- CHAMBER_Z0_CALC_RD  : out UCM_DP_CHAMB_Z0_DP_CHAMB_Z0_RD_MON_t;
    i_chamber_z_org_bus   : in b_chamber_z_origin_avt;
    --
    i_z                 : in unsigned (g_INPUT_WIDTH -1 downto 0);
    i_z_dv              : in std_logic;
    --
    o_ieta              : out unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
    o_ieta_dv           : out std_logic

  );
end entity ucm_ieta_calc;

architecture beh of ucm_ieta_calc is

  signal chamber_z_org_a : b_chamber_z_origin_aut;
  -- (open)(g_INPUT_WIDTH -1 downto 0) := 
  --       get_b_chamber_origin_z_u(c_SECTOR_ID,g_STATION,g_RESOLUTION_SCALE,g_INPUT_WIDTH);
  -- signal i_z_i : integer;
  signal wr_addr : integer := 0;

  signal found_u : unsigned(3 downto 0);
  
begin

  -- WRITE_MEM: process(clk)
  -- begin
  --   if rising_edge(clk) then
  --     if rst = '1' then
  --       CHAMBER_Z0_CALC_RD.RST_REQ <= '0';
  --     else
  --       if CHAMBER_Z0_CALC_WR.ADDR = x"00" then
  --       else
  --         CHAMBER_Z0_CALC_RD.VALUE <=std_logic_vector(resize(chamber_z_org_a(to_integer(unsigned(CHAMBER_Z0_CALC_WR.ADDR))),16));
  --         if CHAMBER_Z0_CALC_WR.WR_EN = '1' then
  --           CHAMBER_Z0_CALC_RD.RST_REQ <= '1';
  --           chamber_z_org_a(to_integer(unsigned(CHAMBER_Z0_CALC_WR.ADDR))) <= resize(unsigned(CHAMBER_Z0_CALC_WR.VALUE),chamber_z_org_a(0)'length);
  --         end if;
  --       end if;
        
  --     end if;
  --   end if;
  -- end process;

  READ_MEM: process(clk)
    variable found : std_logic := '0';
    variable ieta : unsigned(VEC_MDTID_CHAMBER_IETA_LEN -1 downto 0);
  begin
    if rising_edge(clk) then
      if rst = '1' then
        -- chamber_z_org_a <= chamber_z_org_a
        found := '0';
        o_ieta <= to_unsigned(15,VEC_MDTID_CHAMBER_IETA_LEN);
        ieta := (others => '0');

      else

        chamber_z_org_a <= convert(i_chamber_z_org_bus);

        o_ieta_dv <= i_z_dv;
        if i_z_dv = '1' then
          found := '0';
          o_ieta <= to_unsigned(15,VEC_MDTID_CHAMBER_IETA_LEN);
          for i_ch in 1 to MAX_NUM_CHAMBER_POS -1 loop
            if to_integer(i_z) < to_integer(chamber_z_org_a(i_ch)) then
              if found = '0' then
                o_ieta <= to_unsigned(i_ch - 1,VEC_MDTID_CHAMBER_IETA_LEN);
                -- found_u := to_unsigned(i_ch - 1,VEC_MDTID_CHAMBER_IETA_LEN);
                found := '1';
              else
                --
              end if;
            else
              --
            end if;
          end loop;

          

          -- if found = '0' then
          --   o_ieta <= to_unsigned(8,4);
          -- else
          --   o_ieta <= ieta;
          --   ieta := to_unsigned(15,VEC_MDTID_CHAMBER_IETA_LEN);
          -- end if;

        else
          found := '0';
          o_ieta <= to_unsigned(15,VEC_MDTID_CHAMBER_IETA_LEN);
        end if;
        
      end if;
    end if;
  end process;
  
  

  
end architecture beh;