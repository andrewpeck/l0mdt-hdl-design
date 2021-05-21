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
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.detector_param_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_cvp_b_slope is
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    glob_en       : in std_logic;
    --
    i_cointype    : in std_logic_vector(SLC_COMMON_COINTYPE_LEN-1 downto 0);
    i_data_v      : in std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
    i_data_valid  : in std_logic;
    --
    o_offset      : out signed(126 -1 downto 0);
    o_slope       : out signed((SLC_Z_RPC_LEN*4 + 8)*2 -1 downto 0);
    o_data_valid  : out std_logic
    
  );
end entity ucm_cvp_b_slope;

architecture beh of ucm_cvp_b_slope is
  
  signal barrel_r   : slc_barrel_rt;
  signal coin : integer;

  type rpc_at is array ( 0 to 3) of signed(SLC_Z_RPC_LEN - 1 downto 0);
  signal rpc_a : rpc_at;
  type rad_at is array ( 0 to 3) of signed(SLC_Z_RPC_LEN - 1 downto 0);
  signal rad_a : rad_at;

  signal e_z                  : signed(SLC_Z_RPC_LEN + 2 -1 downto 0);
  signal e_y , e_y_2          : signed(2*(SLC_Z_RPC_LEN + 2) -1 downto 0);
  signal int_offset           : signed(126 -1 downto 0);
  type sum_pl_st is array (0 to 1) of signed(SLC_Z_RPC_LEN   + 2 -1 downto 0);
  signal sum_y                : sum_pl_st;
  signal sum_z                : sum_pl_st;
  signal sum_zy               : signed(SLC_Z_RPC_LEN*2 + 4 -1 downto 0);
  signal sum_zz               : signed(SLC_Z_RPC_LEN*2 + 4 -1 downto 0);
  signal sqr_sum_z            : signed(SLC_Z_RPC_LEN*2 + 4 -1 downto 0);
  -- signal b_nom                : signed(SLC_Z_RPC_LEN*4 + 8 -1 downto 0);

  constant c_B_DEN_NOM : integer := 5;
  type b_nom_t is array  (0 to c_B_DEN_NOM - 1) of signed(SLC_Z_RPC_LEN*4 + 8 -1 downto 0);
  signal b_nom : b_nom_t; -- : signed(SLC_Z_RPC_LEN*4 + 8 -1 downto 0);

  type b_den_t is array  (0 to c_B_DEN_NOM - 1) of signed(SLC_Z_RPC_LEN*4 + 8 -1 downto 0);
  signal b_den : b_den_t; -- : signed(SLC_Z_RPC_LEN*4 + 8 -1 downto 0);

  signal int_slope, int_slope_2 : signed((SLC_Z_RPC_LEN*4 + 8)*2 -1 downto 0);

  signal s_e_z : signed(126 -1 downto 0);

  signal dv_chain   : std_logic_vector(16 downto 0);

  type num_at is array ( 0 to 16) of integer;
  signal num_h : num_at;


begin

  BARREL: if c_ST_nBARREL_ENDCAP = '0' generate

    barrel_r <= structify(i_data_v);

    coin <= to_integer(unsigned(i_cointype));
    
    slope: process(clk)
    begin
      if rising_edge(clk) then
        if rst= '1' then
          rad_a <= (others => (others => '0'));
          rpc_a <= (others => (others => '0'));
          dv_chain <= (others => '0');
          int_slope <= (others => '0');
          o_slope <= (others => '0');
          int_offset <= (others => '0');
          o_offset <= (others => '0');
          e_z <= (others => '0');
          e_y <= (others => '0');
          sum_zy <= (others => '0');
          sum_y <= (others => (others => '0'));
          sum_z <= (others => (others => '0'));
          sum_zz <= (others => '0');
          sqr_sum_z <= (others => '0');
          b_nom <= (others => (others => '0'));
          b_den <= (others => (others => '0'));
          num_h <= (others => 1);
        else

          -- dv_chain(7 downto 0) <= dv_chain(6 downto 0) & i_data_valid;

          -- dv_chain(0)  <= i_data_valid;
          for i in 0 to 15 loop
            num_h(i+1) <= num_h(i);
          end loop;
          
          sum_y(1) <= sum_y(0);
          sum_z(1) <= sum_z(0);

          if i_data_valid = '1' then
            -- coin type
            case coin is
              when 0 => num_h(0) <=  2;
              when 1 => num_h(0) <=  3;
              when 2 => num_h(0) <=  3;
              when 3 => num_h(0) <=  3;
              when 4 => num_h(0) <=  3;
              when 5 => num_h(0) <=  4;
              when others =>
            end case;
            -- set r
            case coin is
              when 0 =>
                rad_a(0) <= PHY_BARREL_R0;
                rad_a(1) <= PHY_BARREL_R3;
                rad_a(2) <= (others => '0');
                rad_a(3) <= (others => '0');
              when 1 =>
                rad_a(0) <= PHY_BARREL_R0;
                rad_a(1) <= PHY_BARREL_R1;
                rad_a(2) <= PHY_BARREL_R2;
                rad_a(3) <= (others => '0');
              when 2 =>
                rad_a(0) <= PHY_BARREL_R0;
                rad_a(1) <= PHY_BARREL_R1;
                rad_a(2) <= (others => '0');
                rad_a(3) <= (others => '0');
              when 3 =>
                rad_a(0) <= PHY_BARREL_R0;
                rad_a(1) <= PHY_BARREL_R2;
                rad_a(2) <= PHY_BARREL_R3;
                rad_a(3) <= (others => '0');
              when 4 =>
                rad_a(0) <= PHY_BARREL_R1;
                rad_a(1) <= PHY_BARREL_R2;
                rad_a(2) <= PHY_BARREL_R3;
                rad_a(3) <= (others => '0');
              when 5 =>  
                rad_a(0) <= PHY_BARREL_R0;
                rad_a(1) <= PHY_BARREL_R1;
                rad_a(2) <= PHY_BARREL_R2;
                rad_a(3) <= PHY_BARREL_R3;
            
              when others => 
            end case;
            -- set_Z
            case coin is
              when 0 =>
                rpc_a(0) <= barrel_r.rpc0_posz;
                rpc_a(1) <= barrel_r.rpc3_posz;
                rpc_a(2) <= (others => '0');
                rpc_a(3) <= (others => '0');
              when 1 =>
                rpc_a(0) <= barrel_r.rpc0_posz;
                rpc_a(1) <= barrel_r.rpc1_posz;
                rpc_a(2) <= barrel_r.rpc2_posz;
                rpc_a(3) <= (others => '0');
              when 2 =>
                rpc_a(0) <= barrel_r.rpc0_posz;
                rpc_a(1) <= barrel_r.rpc1_posz;
                rpc_a(2) <= (others => '0');
                rpc_a(3) <= (others => '0');
              when 3 =>
                rpc_a(0) <= barrel_r.rpc0_posz;
                rpc_a(1) <= barrel_r.rpc2_posz;
                rpc_a(2) <= barrel_r.rpc3_posz;
                rpc_a(3) <= (others => '0');
              when 4 =>
                rpc_a(0) <= barrel_r.rpc1_posz;
                rpc_a(1) <= barrel_r.rpc2_posz;
                rpc_a(2) <= barrel_r.rpc3_posz;
                rpc_a(3) <= (others => '0');
              when 5 =>  
                rpc_a(0) <= barrel_r.rpc0_posz;
                rpc_a(1) <= barrel_r.rpc1_posz;
                rpc_a(2) <= barrel_r.rpc2_posz;
                rpc_a(3) <= barrel_r.rpc3_posz;
            
              when others => 
            end case;
            dv_chain(0)  <= '1';
          else
            rad_a <= (others => (others => '0'));
            rpc_a <= (others => (others => '0'));
            num_h(0) <= 0;
            dv_chain(0)  <= '0';
          end if;

          if dv_chain(0) = '1' then
            if num_h(0) = 2 then
              sum_zy <=     (resize(rpc_a(0),SLC_Z_RPC_LEN +2) * resize(rad_a(0),SLC_Z_RPC_LEN +2)) + 
                            (resize(rpc_a(1),SLC_Z_RPC_LEN +2) * resize(rad_a(1),SLC_Z_RPC_LEN +2));
              sum_y(0) <=   resize(rad_a(0),SLC_Z_RPC_LEN +2) + resize(rad_a(1),SLC_Z_RPC_LEN +2);
              sum_z(0) <=   resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2);
              sum_zz <=     (resize(rpc_a(0),SLC_Z_RPC_LEN +2) * resize(rpc_a(0),SLC_Z_RPC_LEN +2)) + 
                            (resize(rpc_a(1),SLC_Z_RPC_LEN +2) * resize(rpc_a(1),SLC_Z_RPC_LEN +2));
              sqr_sum_z <=  (resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2)) * 
                            (resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2));
            elsif num_h(0) = 3 then
              sum_zy <=     (resize(rpc_a(0),SLC_Z_RPC_LEN +2) * resize(rad_a(0),SLC_Z_RPC_LEN +2)) + 
                            (resize(rpc_a(1),SLC_Z_RPC_LEN +2) * resize(rad_a(1),SLC_Z_RPC_LEN +2)) + 
                            (resize(rpc_a(2),SLC_Z_RPC_LEN +2) * resize(rad_a(2),SLC_Z_RPC_LEN +2));
              sum_y(0) <=   resize(rad_a(0),SLC_Z_RPC_LEN +2) + resize(rad_a(1),SLC_Z_RPC_LEN +2) + 
                            resize(rad_a(2),SLC_Z_RPC_LEN +2);
              sum_z(0) <=   resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2) + 
                            resize(rpc_a(2),SLC_Z_RPC_LEN +2);
              sum_zz <=     (resize(rpc_a(0),SLC_Z_RPC_LEN +2) * resize(rpc_a(0),SLC_Z_RPC_LEN +2)) + 
                            (resize(rpc_a(1),SLC_Z_RPC_LEN +2) * resize(rpc_a(1),SLC_Z_RPC_LEN +2)) + 
                            (resize(rpc_a(2),SLC_Z_RPC_LEN +2) * resize(rpc_a(2),SLC_Z_RPC_LEN +2));
              sqr_sum_z <=  (resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2) + resize(rpc_a(2),SLC_Z_RPC_LEN +2)) * 
                            (resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2) + resize(rpc_a(2),SLC_Z_RPC_LEN +2));
            elsif num_h(0) = 4 then
              sum_zy <=     (resize(rpc_a(0),SLC_Z_RPC_LEN +2) * resize(rad_a(0),SLC_Z_RPC_LEN +2)) + 
                            (resize(rpc_a(1),SLC_Z_RPC_LEN +2) * resize(rad_a(1),SLC_Z_RPC_LEN +2)) + 
                            (resize(rpc_a(2),SLC_Z_RPC_LEN +2) * resize(rad_a(2),SLC_Z_RPC_LEN +2)) + 
                            (resize(rpc_a(3),SLC_Z_RPC_LEN +2) * resize(rad_a(3),SLC_Z_RPC_LEN +2));
              sum_y(0) <=   resize(rad_a(0),SLC_Z_RPC_LEN +2) + resize(rad_a(1),SLC_Z_RPC_LEN +2) + 
                            resize(rad_a(2),SLC_Z_RPC_LEN +2) + resize(rad_a(3),SLC_Z_RPC_LEN +2);
              sum_z(0) <=   resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2) + 
                            resize(rpc_a(2),SLC_Z_RPC_LEN +2) + resize(rpc_a(3),SLC_Z_RPC_LEN +2);
              sum_zz <=     (resize(rpc_a(0),SLC_Z_RPC_LEN +2) * resize(rpc_a(0),SLC_Z_RPC_LEN +2)) + 
                            (resize(rpc_a(1),SLC_Z_RPC_LEN +2) * resize(rpc_a(1),SLC_Z_RPC_LEN +2)) + 
                            (resize(rpc_a(2),SLC_Z_RPC_LEN +2) * resize(rpc_a(2),SLC_Z_RPC_LEN +2)) +
                            (resize(rpc_a(3),SLC_Z_RPC_LEN +2) * resize(rpc_a(3),SLC_Z_RPC_LEN +2));
              sqr_sum_z <=  (resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2) + resize(rpc_a(2),SLC_Z_RPC_LEN +2) + resize(rpc_a(3),SLC_Z_RPC_LEN +2)) * 
                            (resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2) + resize(rpc_a(2),SLC_Z_RPC_LEN +2) + resize(rpc_a(3),SLC_Z_RPC_LEN +2));
            else
              sum_zy <= (others => '0');
              sum_y(0) <= (others => '0');
              sum_z(0) <= (others => '0');
              sum_zz <= (others => '0');
              sqr_sum_z <= (others => '0');
            end if;
            dv_chain(1)  <= '1';
          else
            dv_chain(1)  <= '0';
          end if;

          if dv_chain(1) = '1' then
            b_nom(0) <= (num_h(1) * sum_zy) - (sum_y(0) * sum_Z(0));
            b_den(0) <= (num_h(1) * sum_zz) - sqr_sum_z;
            dv_chain(2)  <= '1';
          else
            dv_chain(2)  <= '0';
          end if;

          for i in 0 to c_B_DEN_NOM - 2 loop
            b_nom(i + 1) <= b_nom(i);
            b_den(i + 1) <= b_den(i);
          end loop;

          for i in 2 to c_B_DEN_NOM loop
            dv_chain(i + 1) <= dv_chain(i);
          end loop;

          if dv_chain(6) = '1' then
            int_slope <= (b_nom(c_B_DEN_NOM - 1) * 2048)/b_den(c_B_DEN_NOM -1);
            --
            e_y <= (sum_y(1) * 2048) / num_h(6);
            e_z <= sum_Z(1) / num_h(6);
            dv_chain(7)  <= '1';
          else
            int_slope <= (others => '0');
            e_y <= (others => '0');
            e_z <= (others => '0');
            dv_chain(7)  <= '0';
          end if;
          
          if dv_chain(7) = '1' then
            int_slope_2 <= int_slope;
            s_e_z <= (int_slope * e_z);
            e_y_2 <= e_y;
            dv_chain(8)  <= '1';
          else
            dv_chain(8)  <= '0';
            int_slope_2 <= (others => '0');
            s_e_z <= (others => '0');
            e_y_2 <=  (others => '0');
          end if;
          
          -- if dv_chain(8) = '1' then
          --   o_slope <= int_slope_2;
          --   o_offset <= (e_y_2) - s_e_z;
          --   -- o_offset <= (e_y * 1000) - resize((int_slope * e_z * 1000),126);
          --   dv_chain(9)  <= '1';
          -- else
            -- o_slope <= (others => '0');
            -- o_offset <= (others => '0');
            -- dv_chain(9) <= '0';
          -- end if;


          
        end if;
      end if;
    end process slope;

    -- o_data_valid <= dv_chain(9);
    -- o_slope <= resize(int_slope,UCM_MBAR_LEN);
    
  end generate BARREL;


  
  
  
end architecture beh;



-- set coin type
    -- num_h <=  2 when coin = 0 else
    --           3 when coin = 1 else
    --           3 when coin = 2 else
    --           3 when coin = 3 else
    --           3 when coin = 4 else
    --           4 when coin = 5 else
    --           0;
    -- set z
    -- rpc_a(0) <= barrel_r.rpc0_posz when coin = 0 else
    --             barrel_r.rpc0_posz when coin = 1 else
    --             barrel_r.rpc0_posz when coin = 2 else
    --             barrel_r.rpc0_posz when coin = 3 else
    --             barrel_r.rpc1_posz when coin = 4 else
    --             barrel_r.rpc0_posz when coin = 5 else
    --             (others => '0');
    -- rpc_a(1) <= barrel_r.rpc3_posz when coin = 0 else
    --             barrel_r.rpc1_posz when coin = 1 else
    --             barrel_r.rpc1_posz when coin = 2 else
    --             barrel_r.rpc2_posz when coin = 3 else
    --             barrel_r.rpc2_posz when coin = 4 else
    --             barrel_r.rpc1_posz when coin = 5 else
    --               (others => '0');
    -- rpc_a(2) <= (others => '0') when coin = 0 else
    --             barrel_r.rpc2_posz when coin = 1 else
    --             barrel_r.rpc3_posz when coin = 2 else
    --             barrel_r.rpc3_posz when coin = 3 else
    --             barrel_r.rpc2_posz when coin = 4 else
    --             barrel_r.rpc2_posz when coin = 5 else
    --             (others => '0');
    -- rpc_a(3) <= barrel_r.rpc3_posz when coin = 5 else
    --             (others => '0');
    -- set r
    -- rad_a(0) <= PHY_BARREL_R0 when coin = 0 else
    --             PHY_BARREL_R0 when coin = 1 else
    --             PHY_BARREL_R0 when coin = 2 else
    --             PHY_BARREL_R0 when coin = 3 else
    --             PHY_BARREL_R1 when coin = 4 else
    --             PHY_BARREL_R0 when coin = 5 else
    --             (others => '0');
    -- rad_a(1) <= PHY_BARREL_R3 when coin = 0 else
    --             PHY_BARREL_R1 when coin = 1 else
    --             PHY_BARREL_R1 when coin = 2 else
    --             PHY_BARREL_R2 when coin = 3 else
    --             PHY_BARREL_R2 when coin = 4 else
    --             PHY_BARREL_R1 when coin = 5 else
    --             (others => '0');
    -- rad_a(2) <= (others => '0') when coin = 0 else
    --             PHY_BARREL_R2 when coin = 1 else
    --             PHY_BARREL_R3 when coin = 2 else
    --             PHY_BARREL_R3 when coin = 3 else
    --             PHY_BARREL_R2 when coin = 4 else
    --             PHY_BARREL_R2 when coin = 5 else
    --             (others => '0');
    -- rad_a(3) <= PHY_BARREL_R3 when coin = 5 else
    --             (others => '0');
    