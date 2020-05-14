--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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
use shared_lib.common_pkg.all;

library project_lib;

library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_tb is
  -- TB, no ports
end entity ucm_tb;

architecture beh of ucm_tb is
  -- clk
  constant clk_period : time := 4.0 ns;
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles : integer := 3;
  signal reset_b : std_logic;
  
  signal glob_en : std_logic := '1';

  -- SLc in
  signal i_slc_data_av          : slc_rx_data_avt(MAX_NUM_SL -1 downto 0);
  -- to hps
  -- signal o_uCM2hps_pam_ar       : ucm2heg_pam_art(NUM_THREADS -1 downto 0);
  signal o_uCM2hps_data_av      : ucm2hps_aavt(MAX_NUM_HPS -1 downto 0);
  -- pipeline
  signal o_uCM2pl_av            : pipelines_avt;

  signal cand1  : slc_rx_data_rt;
  signal barrel1 : slc_barrel_rt;

  ------------------------------------
  signal tb_motor : std_logic_vector(3 downto 0);

begin
  
  UCM : entity project_lib.top_ucm
  port map(
    clk                 => clk,
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_av          => i_slc_data_av,
    -- pam out
    -- o_uCM2hps_pam_ar       => o_uCM2hps_pam_ar,
    o_uCM2hps_data_av      => o_uCM2hps_data_av,
    -- MDT hit
    o_uCM2pl_av            => o_uCM2pl_av
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
		reset_b <='1';
		wait for CLK_period;
		reset_b<='0';
		wait for CLK_period*reset_init_cycles;
		reset_b <= '1';
		wait;
  end process;
 	-------------------------------------------------------------------------------------
	-- candidates
  -------------------------------------------------------------------------------------
  barrel1.spare_bits          <= std_logic_vector(to_unsigned( 1 , SLC_B_SPARE_LEN ));
  barrel1.coin_type           <= std_logic_vector(to_unsigned( 1 , SLC_COIN_TYPE_LEN ));
  barrel1.z_rpc0              <= to_signed( 1 , SLC_Z_RPC_LEN );
  barrel1.z_rpc1              <= to_signed( 1 , SLC_Z_RPC_LEN );
  barrel1.z_rpc2              <= to_signed( 1 , SLC_Z_RPC_LEN );
  barrel1.z_rpc3              <= to_signed( 1 , SLC_Z_RPC_LEN );
  cand1.muid.slcid            <= to_unsigned( 1 , SLC_SLCID_LEN);
  cand1.muid.slid             <= to_unsigned( 1 , SLC_SLID_LEN );
  cand1.muid.bcid             <= to_unsigned( 1 , BCID_LEN );
  cand1.chambers.mdt_inn      <= to_unsigned( 1 , SLC_CHAMBER_LEN );
  cand1.chambers.mdt_mid      <= to_unsigned( 1 , SLC_CHAMBER_LEN );
  cand1.chambers.mdt_out      <= to_unsigned( 1 , SLC_CHAMBER_LEN );
  cand1.chambers.mdt_ext      <= to_unsigned( 1 , SLC_CHAMBER_LEN );
  cand1.common.tcid           <= std_logic_vector(to_unsigned( 1 , SLC_TCID_LEN ));
  cand1.common.tcsent         <= '1'; --std_logic_vector(to_unsigned( 1 , SLC_TCSENT_LEN ));
  cand1.common.pos_eta        <= to_signed( 1 , SLC_POS_ETA_LEN );
  cand1.common.pos_phi        <= to_unsigned( 1 , SLC_POS_PHI_LEN );
  cand1.common.pt_th          <= std_logic_vector(to_unsigned( 1 , SLC_PT_TH_LEN ));
  cand1.common.charge         <= '1'; --std_logic_vector(to_unsigned( 1 , SLC_CHARGE_LEN ));
  cand1.specific              <= vectorify(barrel1);
  cand1.data_valid            <= '1';
 	-------------------------------------------------------------------------------------
	-- Reset Generator
	-------------------------------------------------------------------------------------
  feed_1_slc : process(clk,reset_b)

  begin
    if Reset_b = '0' then
      tb_motor <= x"0";
      i_slc_data_av(0) <= (others => '0');
      i_slc_data_av(1) <= (others => '0');
      i_slc_data_av(2) <= (others => '0');
      i_slc_data_av(3) <= (others => '0');
      i_slc_data_av(4) <= (others => '0');
    elsif rising_edge(clk) then

      case tb_motor is
        when x"0"=>
          tb_motor <= x"1";
          i_slc_data_av(0) <= (others => '0');
          i_slc_data_av(1) <= (others => '0');
          i_slc_data_av(2) <= (others => '0');
          i_slc_data_av(3) <= (others => '0');
          i_slc_data_av(4) <= (others => '0');
        when x"1" =>
        tb_motor <= x"2";
          i_slc_data_av(4) <= (others => '0');
          i_slc_data_av(3) <= vectorify(cand1);
          i_slc_data_av(2) <= (others => '0');
          i_slc_data_av(1) <= (others => '0');
          i_slc_data_av(0) <= (others => '0');  
        when others =>
          i_slc_data_av(0) <= (others => '0');
          i_slc_data_av(1) <= (others => '0');
          i_slc_data_av(2) <= (others => '0');
          i_slc_data_av(3) <= (others => '0');
          i_slc_data_av(4) <= (others => '0');
          -- nothing to do 
      end case;
    end if;

  end process;


  
end architecture beh;