--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc vector processor center window z calculator
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


entity ucm_cvp_z_calc is
  generic(
    g_STATION_RADIUS      : integer := 0  --station
  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    glob_en       : in std_logic;
    --
    i_chamb_ieta  : in unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
    i_offset      : in signed(126 -1 downto 0);
    i_slope       : in signed((SLC_Z_RPC_LEN*4 + 8)*2 -1 downto 0);
    i_data_valid  : in std_logic;
    --
    o_vec_z_pos     : out unsigned(UCM2HPS_VEC_POS_LEN-1 downto 0);
    o_vec_z_pos_dv  : out std_logic
    
  );
end entity ucm_cvp_z_calc;

architecture beh of ucm_cvp_z_calc is

  signal chamber_center_Y : b_chamber_center_radius_unsigned_au := get_b_chamber_center_radius(c_SECTOR_ID,g_STATION_RADIUS);
  
  signal chamb_h : signed (24 -1 downto 0);

  -- signal vec_z_pos : signed(UCM_Z_ROI_LEN-1 downto 0);

  constant resolution_change : integer := integer( (1024.0 * UCM2HPS_VEC_POS_MULT ) /  SLC_Z_RPC_MULT);

  signal vec_pos : signed(141-1 downto 0);

  
begin

  o_vec_z_pos <= resize(unsigned(vec_pos/1024),UCM2HPS_VEC_POS_LEN);

  -- chamb_h <= signed(resize(chamber_center_Y(to_integer(unsigned(i_chamb_ieta))),SLC_Z_RPC_LEN +1));
  -- chamb_h <= signed(chamber_center_Y(to_integer(unsigned(i_chamb_ieta))) * 1024);
  
  Z_CALC: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        vec_pos <= (others => '0');
        
      else
        
        o_vec_z_pos_dv <= i_data_valid;

        if i_data_valid = '1' then
          vec_pos <= ((signed(chamber_center_Y(to_integer(unsigned(i_chamb_ieta))) * 1024) - i_offset) * to_signed(resolution_change,15)) / i_slope;
        else
          vec_pos <= (others => '0');
        end if;
      end if;
    end if;
  end process Z_CALC;
  
  
end architecture beh;

