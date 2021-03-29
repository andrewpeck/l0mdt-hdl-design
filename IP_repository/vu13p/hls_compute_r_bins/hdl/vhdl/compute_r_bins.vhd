-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2019.2.1
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
--
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity compute_r_bins is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    mdt_r_offset_V_TVALID : IN STD_LOGIC;
    r_bin_V_TREADY : IN STD_LOGIC;
    mdt_localx_V : IN STD_LOGIC_VECTOR (14 downto 0);
    mdt_localy_V : IN STD_LOGIC_VECTOR (14 downto 0);
    mdt_r_offset_V_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
    mdt_r_offset_V_TREADY : OUT STD_LOGIC;
    hw_sin_val_V : IN STD_LOGIC_VECTOR (17 downto 0);
    hw_cos_val_V : IN STD_LOGIC_VECTOR (17 downto 0);
    r_bin_V_TDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
    r_bin_V_TVALID : OUT STD_LOGIC );
end;


architecture behav of compute_r_bins is
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "compute_r_bins,hls_ip_2019_2_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xcvu13p-flga2577-1-e,HLS_INPUT_CLOCK=3.125000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=2.846000,HLS_SYN_LAT=5,HLS_SYN_TPT=2,HLS_SYN_MEM=0,HLS_SYN_DSP=2,HLS_SYN_FF=225,HLS_SYN_LUT=149,HLS_VERSION=2019_2_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_1B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011011";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_block_state2_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage1_iter1 : BOOLEAN;
    signal regslice_both_r_bin_V_U_apdone_blk : STD_LOGIC;
    signal ap_block_state6_pp0_stage1_iter2 : BOOLEAN;
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal mdt_localx_V_0_data_reg : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";
    signal mdt_localx_V_0_vld_reg : STD_LOGIC := '0';
    signal mdt_localx_V_0_ack_out : STD_LOGIC;
    signal mdt_localy_V_0_data_reg : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";
    signal mdt_localy_V_0_vld_reg : STD_LOGIC := '0';
    signal mdt_localy_V_0_ack_out : STD_LOGIC;
    signal hw_sin_val_V_0_data_reg : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    signal hw_sin_val_V_0_vld_reg : STD_LOGIC := '0';
    signal hw_sin_val_V_0_ack_out : STD_LOGIC;
    signal hw_cos_val_V_0_data_reg : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    signal hw_cos_val_V_0_vld_reg : STD_LOGIC := '0';
    signal hw_cos_val_V_0_ack_out : STD_LOGIC;
    signal mdt_r_offset_V_TDATA_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal r_bin_V_TDATA_blk_n : STD_LOGIC;
    signal trunc_ln1353_fu_93_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal trunc_ln1353_reg_194 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal trunc_ln1353_reg_194_pp0_iter1_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal hw_sin_val_V_read_reg_199 : STD_LOGIC_VECTOR (17 downto 0);
    signal mdt_localy_V_read_reg_204 : STD_LOGIC_VECTOR (14 downto 0);
    signal ret_V_fu_182_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal ret_V_reg_209 : STD_LOGIC_VECTOR (32 downto 0);
    signal trunc_ln1353_1_fu_105_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal trunc_ln1353_1_reg_214 : STD_LOGIC_VECTOR (11 downto 0);
    signal ret_V_1_fu_188_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal ret_V_1_reg_219 : STD_LOGIC_VECTOR (32 downto 0);
    signal zext_ln215_1_cast_reg_224 : STD_LOGIC_VECTOR (11 downto 0);
    signal zext_ln321_fu_153_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln1503_1_reg_235 : STD_LOGIC_VECTOR (6 downto 0);
    signal zext_ln321_1_fu_178_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_enable_reg_pp0_iter0_reg : STD_LOGIC := '0';
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal ap_block_pp0_stage1_01001 : BOOLEAN;
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal tmp_fu_124_p4 : STD_LOGIC_VECTOR (11 downto 0);
    signal add_ln1353_fu_133_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal add_ln1353_1_fu_138_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal trunc_ln1_fu_143_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal add_ln1353_2_fu_158_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal add_ln1353_3_fu_163_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_idle_pp0_1to2 : STD_LOGIC;
    signal ap_idle_pp0_0to1 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal regslice_both_mdt_r_offset_V_U_apdone_blk : STD_LOGIC;
    signal mdt_r_offset_V_TDATA_int : STD_LOGIC_VECTOR (23 downto 0);
    signal mdt_r_offset_V_TVALID_int : STD_LOGIC;
    signal mdt_r_offset_V_TREADY_int : STD_LOGIC;
    signal regslice_both_mdt_r_offset_V_U_ack_in : STD_LOGIC;
    signal r_bin_V_TDATA_int : STD_LOGIC_VECTOR (7 downto 0);
    signal r_bin_V_TVALID_int : STD_LOGIC;
    signal r_bin_V_TREADY_int : STD_LOGIC;
    signal regslice_both_r_bin_V_U_vld_out : STD_LOGIC;

    component compute_r_bins_mubkb IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (17 downto 0);
        din1 : IN STD_LOGIC_VECTOR (14 downto 0);
        dout : OUT STD_LOGIC_VECTOR (32 downto 0) );
    end component;


    component regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    compute_r_bins_mubkb_U1 : component compute_r_bins_mubkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 18,
        din1_WIDTH => 15,
        dout_WIDTH => 33)
    port map (
        din0 => hw_cos_val_V_0_data_reg,
        din1 => mdt_localx_V_0_data_reg,
        dout => ret_V_fu_182_p2);

    compute_r_bins_mubkb_U2 : component compute_r_bins_mubkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 18,
        din1_WIDTH => 15,
        dout_WIDTH => 33)
    port map (
        din0 => hw_sin_val_V_read_reg_199,
        din1 => mdt_localy_V_read_reg_204,
        dout => ret_V_1_fu_188_p2);

    regslice_both_mdt_r_offset_V_U : component regslice_both
    generic map (
        DataWidth => 24)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => mdt_r_offset_V_TDATA,
        vld_in => mdt_r_offset_V_TVALID,
        ack_in => regslice_both_mdt_r_offset_V_U_ack_in,
        data_out => mdt_r_offset_V_TDATA_int,
        vld_out => mdt_r_offset_V_TVALID_int,
        ack_out => mdt_r_offset_V_TREADY_int,
        apdone_blk => regslice_both_mdt_r_offset_V_U_apdone_blk);

    regslice_both_r_bin_V_U : component regslice_both
    generic map (
        DataWidth => 8)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => r_bin_V_TDATA_int,
        vld_in => r_bin_V_TVALID_int,
        ack_in => r_bin_V_TREADY_int,
        data_out => r_bin_V_TDATA,
        vld_out => regslice_both_r_bin_V_U_vld_out,
        ack_out => r_bin_V_TREADY,
        apdone_blk => regslice_both_r_bin_V_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter0_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then
                    ap_enable_reg_pp0_iter0_reg <= ap_start;
                end if;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                end if;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if;
            end if;
        end if;
    end process;


    hw_cos_val_V_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;

    hw_sin_val_V_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;

    mdt_localx_V_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;

    mdt_localy_V_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (hw_cos_val_V_0_vld_reg = ap_const_logic_0) and (ap_const_logic_1 = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (hw_cos_val_V_0_ack_out = ap_const_logic_1) and (ap_const_logic_1 = ap_const_logic_1) and (hw_cos_val_V_0_vld_reg = ap_const_logic_1)))) then
                hw_cos_val_V_0_data_reg <= hw_cos_val_V;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (hw_sin_val_V_0_vld_reg = ap_const_logic_0) and (ap_const_logic_1 = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (hw_sin_val_V_0_ack_out = ap_const_logic_1) and (ap_const_logic_1 = ap_const_logic_1) and (hw_sin_val_V_0_vld_reg = ap_const_logic_1)))) then
                hw_sin_val_V_0_data_reg <= hw_sin_val_V;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                hw_sin_val_V_read_reg_199 <= hw_sin_val_V_0_data_reg;
                mdt_localy_V_read_reg_204 <= mdt_localy_V_0_data_reg;
                ret_V_reg_209 <= ret_V_fu_182_p2;
                trunc_ln1353_1_reg_214 <= trunc_ln1353_1_fu_105_p1;
                trunc_ln1503_1_reg_235 <= add_ln1353_3_fu_163_p2(11 downto 5);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (mdt_localx_V_0_vld_reg = ap_const_logic_0) and (ap_const_logic_1 = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (mdt_localx_V_0_ack_out = ap_const_logic_1) and (ap_const_logic_1 = ap_const_logic_1) and (mdt_localx_V_0_vld_reg = ap_const_logic_1)))) then
                mdt_localx_V_0_data_reg <= mdt_localx_V;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (mdt_localy_V_0_vld_reg = ap_const_logic_0) and (ap_const_logic_1 = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (mdt_localy_V_0_ack_out = ap_const_logic_1) and (ap_const_logic_1 = ap_const_logic_1) and (mdt_localy_V_0_vld_reg = ap_const_logic_1)))) then
                mdt_localy_V_0_data_reg <= mdt_localy_V;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ret_V_1_reg_219 <= ret_V_1_fu_188_p2;
                trunc_ln1353_reg_194 <= trunc_ln1353_fu_93_p1;
                trunc_ln1353_reg_194_pp0_iter1_reg <= trunc_ln1353_reg_194;
                zext_ln215_1_cast_reg_224 <= ret_V_reg_209(27 downto 16);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_block_pp0_stage1_subdone, ap_block_pp0_stage0_subdone, ap_idle_pp0_1to2, ap_reset_idle_pp0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 =>
                if ((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0_1to2 = ap_const_logic_1))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 =>
                if ((((ap_reset_idle_pp0 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) or ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_reset_idle_pp0 = ap_const_logic_1)))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when others =>
                ap_NS_fsm <= "XX";
        end case;
    end process;
    add_ln1353_1_fu_138_p2 <= std_logic_vector(unsigned(add_ln1353_fu_133_p2) + unsigned(zext_ln215_1_cast_reg_224));
    add_ln1353_2_fu_158_p2 <= std_logic_vector(unsigned(trunc_ln1353_1_reg_214) + unsigned(tmp_fu_124_p4));
    add_ln1353_3_fu_163_p2 <= std_logic_vector(unsigned(add_ln1353_2_fu_158_p2) + unsigned(zext_ln215_1_cast_reg_224));
    add_ln1353_fu_133_p2 <= std_logic_vector(unsigned(trunc_ln1353_reg_194_pp0_iter1_reg) + unsigned(tmp_fu_124_p4));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(1);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter0, mdt_r_offset_V_TVALID_int)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and ((ap_start = ap_const_logic_0) or (mdt_r_offset_V_TVALID_int = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter2, mdt_r_offset_V_TVALID_int, r_bin_V_TREADY_int)
    begin
                ap_block_pp0_stage0_11001 <= (((r_bin_V_TREADY_int = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and ((ap_start = ap_const_logic_0) or (mdt_r_offset_V_TVALID_int = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter2, mdt_r_offset_V_TVALID_int, r_bin_V_TREADY_int)
    begin
                ap_block_pp0_stage0_subdone <= (((r_bin_V_TREADY_int = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and ((ap_start = ap_const_logic_0) or (mdt_r_offset_V_TVALID_int = ap_const_logic_0))));
    end process;

        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage1_01001_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter2, regslice_both_r_bin_V_U_apdone_blk, mdt_r_offset_V_TVALID_int)
    begin
                ap_block_pp0_stage1_01001 <= (((regslice_both_r_bin_V_U_apdone_blk = ap_const_logic_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((mdt_r_offset_V_TVALID_int = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage1_11001_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, regslice_both_r_bin_V_U_apdone_blk, mdt_r_offset_V_TVALID_int, r_bin_V_TREADY_int)
    begin
                ap_block_pp0_stage1_11001 <= (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((r_bin_V_TREADY_int = ap_const_logic_0) or (regslice_both_r_bin_V_U_apdone_blk = ap_const_logic_1))) or ((r_bin_V_TREADY_int = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((mdt_r_offset_V_TVALID_int = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage1_subdone_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, regslice_both_r_bin_V_U_apdone_blk, mdt_r_offset_V_TVALID_int, r_bin_V_TREADY_int)
    begin
                ap_block_pp0_stage1_subdone <= (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((r_bin_V_TREADY_int = ap_const_logic_0) or (regslice_both_r_bin_V_U_apdone_blk = ap_const_logic_1))) or ((r_bin_V_TREADY_int = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((mdt_r_offset_V_TVALID_int = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1)));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ap_start, mdt_r_offset_V_TVALID_int)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_start = ap_const_logic_0) or (mdt_r_offset_V_TVALID_int = ap_const_logic_0));
    end process;


    ap_block_state2_pp0_stage1_iter0_assign_proc : process(mdt_r_offset_V_TVALID_int)
    begin
                ap_block_state2_pp0_stage1_iter0 <= (mdt_r_offset_V_TVALID_int = ap_const_logic_0);
    end process;

        ap_block_state3_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage1_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state6_pp0_stage1_iter2_assign_proc : process(regslice_both_r_bin_V_U_apdone_blk)
    begin
                ap_block_state6_pp0_stage1_iter2 <= (regslice_both_r_bin_V_U_apdone_blk = ap_const_logic_1);
    end process;


    ap_done_assign_proc : process(ap_enable_reg_pp0_iter2, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then
            ap_done <= ap_const_logic_1;
        else
            ap_done <= ap_const_logic_0;
        end if;
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_enable_reg_pp0_iter0_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0_reg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then
            ap_enable_reg_pp0_iter0 <= ap_start;
        else
            ap_enable_reg_pp0_iter0 <= ap_enable_reg_pp0_iter0_reg;
        end if;
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_idle_pp0)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
            ap_idle <= ap_const_logic_1;
        else
            ap_idle <= ap_const_logic_0;
        end if;
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then
            ap_idle_pp0 <= ap_const_logic_1;
        else
            ap_idle_pp0 <= ap_const_logic_0;
        end if;
    end process;


    ap_idle_pp0_0to1_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then
            ap_idle_pp0_0to1 <= ap_const_logic_1;
        else
            ap_idle_pp0_0to1 <= ap_const_logic_0;
        end if;
    end process;


    ap_idle_pp0_1to2_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then
            ap_idle_pp0_1to2 <= ap_const_logic_1;
        else
            ap_idle_pp0_1to2 <= ap_const_logic_0;
        end if;
    end process;


    ap_ready_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then
            ap_ready <= ap_const_logic_1;
        else
            ap_ready <= ap_const_logic_0;
        end if;
    end process;


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to1 = ap_const_logic_1))) then
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if;
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    hw_cos_val_V_0_ack_out_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then
            hw_cos_val_V_0_ack_out <= ap_const_logic_1;
        else
            hw_cos_val_V_0_ack_out <= ap_const_logic_0;
        end if;
    end process;


    hw_sin_val_V_0_ack_out_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then
            hw_sin_val_V_0_ack_out <= ap_const_logic_1;
        else
            hw_sin_val_V_0_ack_out <= ap_const_logic_0;
        end if;
    end process;


    mdt_localx_V_0_ack_out_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then
            mdt_localx_V_0_ack_out <= ap_const_logic_1;
        else
            mdt_localx_V_0_ack_out <= ap_const_logic_0;
        end if;
    end process;


    mdt_localy_V_0_ack_out_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then
            mdt_localy_V_0_ack_out <= ap_const_logic_1;
        else
            mdt_localy_V_0_ack_out <= ap_const_logic_0;
        end if;
    end process;


    mdt_r_offset_V_TDATA_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage0, ap_block_pp0_stage1, mdt_r_offset_V_TVALID_int)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1)) or ((ap_start = ap_const_logic_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)))) then
            mdt_r_offset_V_TDATA_blk_n <= mdt_r_offset_V_TVALID_int;
        else
            mdt_r_offset_V_TDATA_blk_n <= ap_const_logic_1;
        end if;
    end process;


    mdt_r_offset_V_TREADY_assign_proc : process(mdt_r_offset_V_TVALID, regslice_both_mdt_r_offset_V_U_ack_in)
    begin
        if (((mdt_r_offset_V_TVALID = ap_const_logic_1) and (regslice_both_mdt_r_offset_V_U_ack_in = ap_const_logic_1))) then
            mdt_r_offset_V_TREADY <= ap_const_logic_1;
        else
            mdt_r_offset_V_TREADY <= ap_const_logic_0;
        end if;
    end process;


    mdt_r_offset_V_TREADY_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then
            mdt_r_offset_V_TREADY_int <= ap_const_logic_1;
        else
            mdt_r_offset_V_TREADY_int <= ap_const_logic_0;
        end if;
    end process;


    r_bin_V_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage0, ap_block_pp0_stage1, r_bin_V_TREADY_int)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1)) or ((ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1)) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)))) then
            r_bin_V_TDATA_blk_n <= r_bin_V_TREADY_int;
        else
            r_bin_V_TDATA_blk_n <= ap_const_logic_1;
        end if;
    end process;


    r_bin_V_TDATA_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_CS_fsm_pp0_stage1, zext_ln321_fu_153_p1, zext_ln321_1_fu_178_p1, ap_block_pp0_stage1_01001, ap_block_pp0_stage0_01001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
            r_bin_V_TDATA_int <= zext_ln321_1_fu_178_p1;
        elsif (((ap_const_boolean_0 = ap_block_pp0_stage1_01001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then
            r_bin_V_TDATA_int <= zext_ln321_fu_153_p1;
        else
            r_bin_V_TDATA_int <= "XXXXXXXX";
        end if;
    end process;

    r_bin_V_TVALID <= regslice_both_r_bin_V_U_vld_out;

    r_bin_V_TVALID_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then
            r_bin_V_TVALID_int <= ap_const_logic_1;
        else
            r_bin_V_TVALID_int <= ap_const_logic_0;
        end if;
    end process;

    tmp_fu_124_p4 <= ret_V_1_reg_219(27 downto 16);
    trunc_ln1353_1_fu_105_p1 <= mdt_r_offset_V_TDATA_int(12 - 1 downto 0);
    trunc_ln1353_fu_93_p1 <= mdt_r_offset_V_TDATA_int(12 - 1 downto 0);
    trunc_ln1_fu_143_p4 <= add_ln1353_1_fu_138_p2(11 downto 5);
    zext_ln321_1_fu_178_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln1503_1_reg_235),8));
    zext_ln321_fu_153_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln1_fu_143_p4),8));
end behav;
