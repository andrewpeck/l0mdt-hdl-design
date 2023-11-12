--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ucm_cvp_pc_setdata.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_cvp_pc_setdata.vhd
-- -----
-- File Created: Thursday, 17th August 2023 9:14:01 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 17th August 2023 9:14:36 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.detector_param_pkg.all;
use shared_lib.vhdl2008_functions_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;
use ucm_lib.ucm_vhdl_pkg.all;


entity ucm_cvp_pc_setdata is
  generic(
    g_NUM_RPC_LAYERS      : integer := 4;
    g_INPUT_RESOLUTION    : real := 1.0;
    g_OUTPUT_RESOLUTION   : real := 1.0;
    g_OUTPUT_WIDTH        : integer := 10;
    g_DIV_IP_R2_EN        : std_logic := '1';
    g_DIV_VU_EN           : std_logic := '1';
    g_DIV_SEL             : string := "IPR2"
  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    ena           : in std_logic;
    --
    i_cointype    : in std_logic_vector(SLC_COMMON_COINTYPE_LEN-1 downto 0);
    i_rpc_Z_a     : in rpc_pos_oast(g_NUM_RPC_LAYERS -1 downto 0);
    i_cand_dv    : in std_logic;
    -- i_data_v      : in std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
    -- i_data_valid  : in std_logic;
    --
    i_rpc_R_a     : in ucm_rpc_r_alt(g_NUM_RPC_LAYERS -1 downto 0);
    i_rpc_R_dv    : in std_logic;
    -- i_mdt_R_a     : in std_logic_vector(UCM_Z_ROI_LEN-1 downto 0);
    -- i_mdt_R_dv    : in std_logic;
    -- i_chamb_ieta  : in unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
    -- i_offset      : in signed(31 downto 0);--signed(126 -1 downto 0);
    -- i_slope       : in signed(31 downto 0);--signed((SLC_Z_RPC_LEN*4 + 8)*2 -1 downto 0);
    -- i_data_valid  : in std_logic;
    --
    o_num_h_i       : out integer;
    o_rpc_a         : out rpc_pos_ast;
    o_rad_a         : out rpc_rad_ast;
    o_set_data_dv   : out std_logic
    
  );
end entity ucm_cvp_pc_setdata;

architecture beh of ucm_cvp_pc_setdata is

  signal coin : integer;
  signal coin_pl : integer;

  signal num_h_i : integer := 0;
  
  signal pl_rpc_Z_a : rpc_pos_oast(g_NUM_RPC_LAYERS -1 downto 0);
  signal pl_cand_dv : std_logic;

  signal rpc_a : rpc_pos_ast;
  signal rad_a : rpc_rad_ast;
  signal set_data_dv : std_logic;
  
begin

  o_num_h_i     <= num_h_i;
  o_rpc_a       <= rpc_a;
  o_rad_a       <= rad_a;
  o_set_data_dv <= set_data_dv;

  -- barrel_r <= convert(i_data_v,barrel_r);

  -- coin <= to_integer(unsigned(i_cointype));
  
  set_data: process(clk) begin
    if rising_edge(clk) then
      if rst= '1' then
        rad_a <= (others => (others => '0'));
        rpc_a <= (others => (others => '0'));
        num_h_i <= 0;
      else
        if i_cand_dv = '1' then
          coin <= to_integer(unsigned(i_cointype));
        end if;
        -- coin_pl <= coin;
        pl_rpc_Z_a <= i_rpc_Z_a;
        pl_cand_dv <= i_cand_dv;
        if ena =  '1' then
          -- if i_cand_dv = '1' then
            if or_reduce(std_logic_vector(pl_rpc_Z_a(0))) = '0' then
              rad_a(0) <= (others => '0');
            else
              rad_a(0) <= resize(signed(i_rpc_R_a(0)),SLC_IN_RPC_LEN);
            end if;
            if or_reduce(std_logic_vector(pl_rpc_Z_a(1))) = '0' then
              rad_a(1) <= (others => '0');
            else
              rad_a(1) <= resize(signed(i_rpc_R_a(1)),SLC_IN_RPC_LEN);
            end if;
            if or_reduce(std_logic_vector(pl_rpc_Z_a(2))) = '0' then
              rad_a(2) <= (others => '0');
            else
              rad_a(2) <= resize(signed(i_rpc_R_a(2)),SLC_IN_RPC_LEN);
            end if;
            if to_integer(signed(pl_rpc_Z_a(3))) = 0 then
              rad_a(3) <= (others => '0');
            else
              rad_a(3) <= resize(signed(i_rpc_R_a(3)),SLC_IN_RPC_LEN);
            end if;
            -- rad_a(1) <= signed(i_rpc_R_a(1));
            -- rad_a(2) <= signed(i_rpc_R_a(2));
            -- rad_a(3) <= signed(i_rpc_R_a(3));

            rpc_a(0) <= resize(signed(pl_rpc_Z_a(0)),SLC_IN_RPC_LEN);
            rpc_a(1) <= resize(signed(pl_rpc_Z_a(1)),SLC_IN_RPC_LEN);
            rpc_a(2) <= resize(signed(pl_rpc_Z_a(2)),SLC_IN_RPC_LEN);
            rpc_a(3) <= resize(signed(pl_rpc_Z_a(3)),SLC_IN_RPC_LEN);

            -- coin type
            case coin is
              when 0 => num_h_i <=  2;
              when 1 => num_h_i <=  3;
              when 2 => num_h_i <=  3;
              when 3 => num_h_i <=  3;
              when 4 => num_h_i <=  3;
              when 5 => num_h_i <=  4;
              when others =>
            end case;
          if pl_cand_dv = '1' then
            set_data_dv  <= '1';
          else
            set_data_dv  <= '0';
          end if;
        end if;
      end if;
    end if;
  end process set_data;
  
end architecture beh;

