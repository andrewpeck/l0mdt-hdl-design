--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc vector processor slope calculator
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
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_cvp_slope is
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    glob_en       : in std_logic;
    --
    i_data_v      : in std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
    i_data_valid  : in std_logic;
    o_slope       : out signed(UCM_MBAR_LEN-1 downto 0);
    o_data_valid  : out std_logic
    
  );
end entity ucm_cvp_slope;

architecture beh of ucm_cvp_slope is
  
  signal barrel_r   : slc_barrel_rt;
  signal coin : integer;

  type rpc_at is array ( 0 to 3) of signed(SLC_Z_RPC_LEN-1 downto 0);
  signal rpc_a : rpc_at;
  type rad_at is array ( 0 to 3) of signed(SLC_Z_RPC_LEN-1 downto 0);
  signal rad_a : rad_at;

  signal num_h : integer;

  signal sum_zy     : signed(UCM_Z_ROI_LEN*2 + 2 -1 downto 0);
  signal sum_y      : signed(UCM_Z_ROI_LEN   + 2 -1 downto 0);
  signal sum_z      : signed(UCM_Z_ROI_LEN   + 1 -1 downto 0);
  signal sum_zz     : signed(UCM_Z_ROI_LEN*2 + 2 -1 downto 0);
  signal sqr_sum_z  : signed(UCM_Z_ROI_LEN*2 + 2 -1 downto 0);
  signal b_nom      : signed(UCM_Z_ROI_LEN*4 + 4 -1 downto 0);
  signal b_den      : signed(UCM_Z_ROI_LEN*4 + 4 -1 downto 0);
  signal int_slope  : signed(88 -1 downto 0);

  signal dv_chain   : std_logic_vector(7 downto 0);

  -- signal slope_mult : signal()

begin

  BARREL: if ST_nBARREL_ENDCAP = '0' generate

    barrel_r <= structify(i_data_v);

    coin <= to_integer(unsigned(barrel_r.coin_type));
    -- set coin type
    num_h <=  2 when coin = 0 else
              3 when coin = 1 else
              3 when coin = 2 else
              3 when coin = 3 else
              3 when coin = 4 else
              4 when coin = 5 else
              0;
    -- set z
    rpc_a(0) <= barrel_r.z_rpc0 when coin = 0 else
                barrel_r.z_rpc0 when coin = 1 else
                barrel_r.z_rpc0 when coin = 2 else
                barrel_r.z_rpc0 when coin = 3 else
                barrel_r.z_rpc1 when coin = 4 else
                barrel_r.z_rpc0 when coin = 5 else
                (others => '0');
    rpc_a(1) <= barrel_r.z_rpc3 when coin = 0 else
                barrel_r.z_rpc1 when coin = 1 else
                barrel_r.z_rpc1 when coin = 2 else
                barrel_r.z_rpc2 when coin = 3 else
                barrel_r.z_rpc2 when coin = 4 else
                barrel_r.z_rpc1 when coin = 5 else
                  (others => '0');
    rpc_a(2) <= (others => '0') when coin = 0 else
                barrel_r.z_rpc2 when coin = 1 else
                barrel_r.z_rpc3 when coin = 2 else
                barrel_r.z_rpc3 when coin = 3 else
                barrel_r.z_rpc2 when coin = 4 else
                barrel_r.z_rpc2 when coin = 5 else
                (others => '0');
    rpc_a(3) <= barrel_r.z_rpc3 when coin = 5 else
                (others => '0');
    -- set r
    rad_a(0) <= PHY_BARREL_R0 when coin = 0 else
                PHY_BARREL_R0 when coin = 1 else
                PHY_BARREL_R0 when coin = 2 else
                PHY_BARREL_R0 when coin = 3 else
                PHY_BARREL_R1 when coin = 4 else
                PHY_BARREL_R0 when coin = 5 else
                (others => '0');
    rad_a(1) <= PHY_BARREL_R3 when coin = 0 else
                PHY_BARREL_R1 when coin = 1 else
                PHY_BARREL_R1 when coin = 2 else
                PHY_BARREL_R2 when coin = 3 else
                PHY_BARREL_R2 when coin = 4 else
                PHY_BARREL_R1 when coin = 5 else
                (others => '0');
    rad_a(2) <= (others => '0') when coin = 0 else
                PHY_BARREL_R2 when coin = 1 else
                PHY_BARREL_R3 when coin = 2 else
                PHY_BARREL_R3 when coin = 3 else
                PHY_BARREL_R2 when coin = 4 else
                PHY_BARREL_R2 when coin = 5 else
                (others => '0');
    rad_a(3) <= PHY_BARREL_R3 when coin = 5 else
                (others => '0');



    slope: process(clk)
    begin
      if rising_edge(clk) then
        if rst= '1' then
          
        else
          if i_data_valid = '1' then
            if num_h = 2 then
              sum_zy <=     (( '0' & rpc_a(0)) * ('0' & rad_a(0))) + 
                            (( '0' & rpc_a(1)) * ('0' & rad_a(1)));
              sum_y <=      ( "00" & rad_a(0)) + ( "00" & rad_a(1));
              sum_z <=      ( '0' & rpc_a(0)) + ( '0' & rpc_a(1));
              sum_zz <=     (( '0' & rpc_a(0)) * ( '0' & rpc_a(0))) + 
                            (( '0' & rpc_a(1)) * ( '0' & rpc_a(1)));
              sqr_sum_z <=  (('0' & rpc_a(0)) + 
                            ( '0' & rpc_a(1))) * 
                            (('0' & rpc_a(0)) + 
                            ( '0' & rpc_a(1)));
            elsif num_h = 3 then
              sum_zy <=     (( '0' & rpc_a(0)) * ('0' & rad_a(0))) + 
                            (( '0' & rpc_a(1)) * ('0' & rad_a(1))) + 
                            (( '0' & rpc_a(2)) * ('0' & rad_a(2)));
              sum_y <=      ( "00" & rad_a(0)) + ( "00" & rad_a(1)) + 
                            ( "00" & rad_a(2));
              sum_z <=      ( '0' & rpc_a(0)) + ( '0' & rpc_a(1)) + 
                            ( '0' & rpc_a(2));
              sum_zz <=     (( '0' & rpc_a(0)) * ( '0' & rpc_a(0))) + 
                            (( '0' & rpc_a(1)) * ( '0' & rpc_a(1))) + 
                            (( '0' & rpc_a(2)) * ( '0' & rpc_a(2)));
              sqr_sum_z <=  (('0' & rpc_a(0)) + 
                            ( '0' & rpc_a(1)) + 
                            ( '0' & rpc_a(2))) * 
                            (('0' & rpc_a(0)) + 
                            ( '0' & rpc_a(1)) + 
                            ( '0' & rpc_a(2)));
            elsif num_h = 4 then
              sum_zy <=     (( '0' & rpc_a(0)) * ('0' & rad_a(0))) + 
                            (( '0' & rpc_a(1)) * ('0' & rad_a(1))) + 
                            (( '0' & rpc_a(2)) * ('0' & rad_a(2))) + 
                            (( '0' & rpc_a(3)) * ('0' & rad_a(3)));
              sum_y <=      ( "00" & rad_a(0)) + ( "00" & rad_a(1)) + 
                            ( "00" & rad_a(2)) + ( "00" & rad_a(3)) ;
              sum_z <=      ( '0' & rpc_a(0)) + ( '0' & rpc_a(1)) + 
                            ( '0' & rpc_a(2)) + ( '0' & rpc_a(3)) ;
              sum_zz <=     (( '0' & rpc_a(0)) * ( '0' & rpc_a(0))) + 
                            (( '0' & rpc_a(1)) * ( '0' & rpc_a(1))) + 
                            (( '0' & rpc_a(2)) * ( '0' & rpc_a(2))) + 
                            (( '0' & rpc_a(3)) * ( '0' & rpc_a(3)));
              sqr_sum_z <=  (('0' & rpc_a(0)) + 
                            ( '0' & rpc_a(1)) + 
                            ( '0' & rpc_a(2)) + 
                            ( '0' & rpc_a(3))) * 
                            (('0' & rpc_a(0)) + 
                            ( '0' & rpc_a(1)) + 
                            ( '0' & rpc_a(2)) + 
                            ( '0' & rpc_a(3)));
            end if;
            dv_chain(0) <= '1';
          else
            dv_chain(0) <= '0';
          end if;

          if dv_chain(0) = '1' then
            b_nom <= (num_h * sum_zy) - (("00" & sum_y) * sum_Z);
            b_den <= (num_h * sum_zz) - sqr_sum_z;
            dv_chain(1) <= '1';
          else
            dv_chain(1) <= '0';
          end if;

          if dv_chain(1) = '1' then
            int_slope <= (b_nom * 2048)/b_den;
            dv_chain(2) <= '1';
          else
            dv_chain(2) <= '0';
          end if;


          
        end if;
      end if;
    end process slope;

    o_slope <= resize(int_slope,UCM_MBAR_LEN);
    
  end generate BARREL;


  
  
  
end architecture beh;