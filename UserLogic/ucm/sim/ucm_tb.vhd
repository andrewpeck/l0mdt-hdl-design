--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Muon Candidate Manager
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
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

library project_lib;

library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_tb is
  -- TB, no ports
end entity ucm_tb;

architecture beh of ucm_tb is
  -- clk
  constant clk_period : time := 2.7778 ns;
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles : integer := 3;
  signal rst: std_logic;
  
  signal glob_en : std_logic := '1';

  -- SLc in
  signal i_slc_data_mainA_av     : slc_rx_avt(2 downto 0);
  signal i_slc_data_mainB_av     : slc_rx_avt(2 downto 0);
  signal i_slc_data_neighborA_v : slc_rx_vt;
  signal i_slc_data_neighborB_v : slc_rx_vt;
  -- to hps
  signal o_uCM2hps_inn_av       : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_mid_av       : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_out_av       : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_ext_av       : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  -- pipeline
  signal o_uCM2pl_av            : pipelines_avt(c_MAX_NUM_SL -1 downto 0);

  signal cand1 , cand2 , cand3 , cand4 : slc_rx_rt;
  signal barrel1 , barrel2 , barrel3 , barrel4 : slc_barrel_rt;

  ------------------------------------
  signal tb_motor : std_logic_vector(3 downto 0);

begin
  
  UCM : entity ucm_lib.ucm
  port map(
    clk                     => clk,
    rst                     => rst,
    glob_en                 => glob_en,
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_mainA_av     => i_slc_data_mainA_av,
    i_slc_data_mainB_av     => i_slc_data_mainB_av,
    i_slc_data_neighborA_v => i_slc_data_neighborA_v,
    i_slc_data_neighborB_v => i_slc_data_neighborB_v,
    -- pam out
    o_uCM2hps_inn_av        => o_uCM2hps_inn_av,
    o_uCM2hps_mid_av        => o_uCM2hps_mid_av,
    o_uCM2hps_out_av        => o_uCM2hps_out_av,
    o_uCM2hps_ext_av        => o_uCM2hps_ext_av,
    -- MDT hit
    o_uCM2pl_av             => o_uCM2pl_av
  );
  
 	-------------------------------------------------------------------------------------
	-- clock Generator
	-------------------------------------------------------------------------------------
  CLK_320 : process begin
    clk <= '0';
    wait for CLK_period/2;
    clk <= '1';
    wait for CLK_period/2;
  end process;

 	-------------------------------------------------------------------------------------
	-- Reset Generator
	-------------------------------------------------------------------------------------
	rst_process: process
	begin
		rst<='0';
		wait for CLK_period;
		rst<='1';
		wait for CLK_period*reset_init_cycles;
		rst<= '0';
		wait;
  end process;
 	-------------------------------------------------------------------------------------
	-- candidates
  -------------------------------------------------------------------------------------
  barrel1.spare_bits          <= std_logic_vector(to_unsigned( 0 , SLC_B_SPARE_LEN ));
  barrel1.coin_type           <= std_logic_vector(to_unsigned( 3 , SLC_COIN_TYPE_LEN ));
  barrel1.z_rpc0              <= to_signed(integer(-2079.0 / SLC_Z_RPC_MULT) , SLC_Z_RPC_LEN );
  barrel1.z_rpc1              <= to_signed(integer( 0.0 / SLC_Z_RPC_MULT) , SLC_Z_RPC_LEN );
  barrel1.z_rpc2              <= to_signed(integer( -3858.0 / SLC_Z_RPC_MULT) , SLC_Z_RPC_LEN );
  barrel1.z_rpc3              <= to_signed(integer( -4806.0 / SLC_Z_RPC_MULT) , SLC_Z_RPC_LEN );
  cand1.muid.slcid            <= to_unsigned( 1 , SLC_SLCID_LEN);
  cand1.muid.slid             <= to_unsigned( 1 , SLC_SLID_LEN );
  cand1.muid.bcid             <= to_unsigned( 477 , BCID_LEN );
  cand1.chambers.mdt_inn      <= to_unsigned( 1 , SLC_CHAMBER_LEN );
  cand1.chambers.mdt_mid      <= to_unsigned( 2 , SLC_CHAMBER_LEN );
  cand1.chambers.mdt_out      <= to_unsigned( 2 , SLC_CHAMBER_LEN );
  cand1.chambers.mdt_ext      <= to_unsigned( 3 , SLC_CHAMBER_LEN );
  cand1.common.tcid           <= std_logic_vector(to_unsigned( 1 , SLC_TCID_LEN ));
  cand1.common.tcsent         <= '1'; --std_logic_vector(to_unsigned( 1 , SLC_TCSENT_LEN ));
  cand1.common.pos_eta        <= to_signed( -1355 , SLC_POS_ETA_LEN );
  cand1.common.pos_phi        <= to_unsigned( 292 , SLC_POS_PHI_LEN );
  cand1.common.rpc_pt         <= std_logic_vector(to_unsigned( 0 , 8));
  cand1.common.pt_th          <= std_logic_vector(to_unsigned( 11 , SLC_PT_TH_LEN ));
  cand1.common.charge         <= '0'; --std_logic_vector(to_unsigned( 1 , SLC_CHARGE_LEN ));
  cand1.specific              <= convert(barrel1, cand1.specific);
  cand1.data_valid            <= '1';
  ------------------------
  barrel2.spare_bits          <= std_logic_vector(to_unsigned( 0 , SLC_B_SPARE_LEN ));
  barrel2.coin_type           <= std_logic_vector(to_unsigned( 1 , SLC_COIN_TYPE_LEN ));
  barrel2.z_rpc0              <= to_signed(integer( -537.0 / SLC_Z_RPC_MULT) , SLC_Z_RPC_LEN );
  barrel2.z_rpc1              <= to_signed(integer( -675.0 / SLC_Z_RPC_MULT), SLC_Z_RPC_LEN );
  barrel2.z_rpc2              <= to_signed(integer( -721.0 / SLC_Z_RPC_MULT), SLC_Z_RPC_LEN );
  barrel2.z_rpc3              <= to_signed(integer( 0.0 / SLC_Z_RPC_MULT), SLC_Z_RPC_LEN );
  cand2.muid.slcid            <= to_unsigned( 1 , SLC_SLCID_LEN);
  cand2.muid.slid             <= to_unsigned( 1 , SLC_SLID_LEN );
  cand2.muid.bcid             <= to_unsigned( 1253 , BCID_LEN );
  cand2.chambers.mdt_inn      <= to_unsigned( 1 , SLC_CHAMBER_LEN );
  cand2.chambers.mdt_mid      <= to_unsigned( 2 , SLC_CHAMBER_LEN );
  cand2.chambers.mdt_out      <= to_unsigned( 2 , SLC_CHAMBER_LEN );
  cand2.chambers.mdt_ext      <= to_unsigned( 3 , SLC_CHAMBER_LEN );
  cand2.common.tcid           <= std_logic_vector(to_unsigned( 1 , SLC_TCID_LEN ));
  cand2.common.tcsent         <= '1'; --std_logic_vector(to_unsigned( 1 , SLC_TCSENT_LEN ));
  cand2.common.pos_eta        <= to_signed( -313 , SLC_POS_ETA_LEN );
  cand2.common.pos_phi        <= to_unsigned( 307 , SLC_POS_PHI_LEN );
  cand2.common.rpc_pt         <= std_logic_vector(to_unsigned( 0 , 8));
  cand2.common.pt_th          <= std_logic_vector(to_unsigned( 2 , SLC_PT_TH_LEN ));
  cand2.common.charge         <= '0'; --std_logic_vector(to_unsigned( 1 , SLC_CHARGE_LEN ));
  cand2.specific              <= convert(barrel2,cand2.specific);
  cand2.data_valid            <= '1';
 	-------------------------------------------------------------------------------------
	-- Reset Generator
	-------------------------------------------------------------------------------------
  feed_1_slc : process(clk,rst)

  begin
    if rst= '1' then
      tb_motor <= x"0";
      i_slc_data_mainA_av <= ( others => (others => '0'));
      i_slc_data_mainB_av <= (others => (others => '0'));
      i_slc_data_neighborA_v <= (others => '0');
      i_slc_data_neighborB_v <= (others => '0');
    elsif rising_edge(clk) then

      case tb_motor is
        when x"0"=>
          tb_motor <= x"1";
          i_slc_data_mainA_av(2) <= (others => '0');
          i_slc_data_mainA_av(1) <= (others => '0');
          i_slc_data_mainA_av(0) <= (others => '0');
          i_slc_data_neighborA_v <= (others => '0');
          i_slc_data_neighborB_v <= (others => '0');
        when x"1" =>
          tb_motor <= x"2";
          i_slc_data_mainA_av(2) <= convert(cand1,i_slc_data_mainA_av(2));
          i_slc_data_mainA_av(1) <= convert(cand2,i_slc_data_mainA_av(1));
          i_slc_data_mainA_av(0) <= (others => '0');
          i_slc_data_neighborA_v <= convert(cand2,i_slc_data_neighborA_v);
          i_slc_data_neighborB_v <= (others => '0');
        when others =>
          i_slc_data_mainA_av(2) <= (others => '0');
          i_slc_data_mainA_av(1) <= (others => '0');
          i_slc_data_mainA_av(0) <= (others => '0');
          i_slc_data_neighborA_v <= (others => '0');
          i_slc_data_neighborB_v <= (others => '0');
          -- nothing to do 
      end case;
    end if;

  end process;


  
end architecture beh;
