-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2019.2.1
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
--
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity compute_r_bins_64 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    mdt_localy_V_ap_vld : IN STD_LOGIC;
    mdt_localx_V : IN STD_LOGIC_VECTOR (14 downto 0);
    mdt_localy_V : IN STD_LOGIC_VECTOR (14 downto 0);
    mdt_r_offset_0_V : IN STD_LOGIC_VECTOR (21 downto 0);
    mdt_r_offset_1_V : IN STD_LOGIC_VECTOR (21 downto 0);
    hw_sin_val_V : IN STD_LOGIC_VECTOR (17 downto 0);
    hw_cos_val_V : IN STD_LOGIC_VECTOR (17 downto 0);
    r_bin_0_V : OUT STD_LOGIC_VECTOR (6 downto 0);
    r_bin_0_V_ap_vld : OUT STD_LOGIC;
    r_bin_1_V : OUT STD_LOGIC_VECTOR (6 downto 0);
    r_bin_1_V_ap_vld : OUT STD_LOGIC );
end;


architecture behav of compute_r_bins_64 is
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "compute_r_bins_64,hls_ip_2019_2_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xcku15p-ffva1760-2-e,HLS_INPUT_CLOCK=3.125000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=2.533000,HLS_SYN_LAT=2,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=2,HLS_SYN_FF=206,HLS_SYN_LUT=89,HLS_VERSION=2019_2_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv15_0 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_1C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011100";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal mdt_localx_V_0_data_reg : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";
    signal mdt_localx_V_0_vld_reg : STD_LOGIC := '0';
    signal mdt_localx_V_0_ack_out : STD_LOGIC;
    signal mdt_localy_V_preg : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";
    signal mdt_localy_V_ap_vld_preg : STD_LOGIC := '0';
    signal mdt_r_offset_0_V_0_data_reg : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000000000";
    signal mdt_r_offset_0_V_0_vld_reg : STD_LOGIC := '0';
    signal mdt_r_offset_0_V_0_ack_out : STD_LOGIC;
    signal mdt_r_offset_1_V_0_data_reg : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000000000";
    signal mdt_r_offset_1_V_0_vld_reg : STD_LOGIC := '0';
    signal mdt_r_offset_1_V_0_ack_out : STD_LOGIC;
    signal hw_sin_val_V_0_data_reg : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    signal hw_sin_val_V_0_vld_reg : STD_LOGIC := '0';
    signal hw_sin_val_V_0_ack_out : STD_LOGIC;
    signal hw_cos_val_V_0_data_reg : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    signal hw_cos_val_V_0_vld_reg : STD_LOGIC := '0';
    signal hw_cos_val_V_0_ack_out : STD_LOGIC;
    signal mdt_localy_V_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ret_V_4_fu_196_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal ret_V_4_reg_208 : STD_LOGIC_VECTOR (32 downto 0);
    signal ret_V_5_fu_202_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal ret_V_5_reg_213 : STD_LOGIC_VECTOR (32 downto 0);
    signal trunc_ln1353_fu_126_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal trunc_ln1353_reg_218 : STD_LOGIC_VECTOR (12 downto 0);
    signal trunc_ln1353_1_fu_130_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal trunc_ln1353_1_reg_223 : STD_LOGIC_VECTOR (12 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal tmp_fu_134_p4 : STD_LOGIC_VECTOR (12 downto 0);
    signal add_ln215_fu_143_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal zext_ln215_3_cast_fu_148_p4 : STD_LOGIC_VECTOR (12 downto 0);
    signal ret_V_fu_157_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal add_ln1353_fu_174_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal ret_V_3_fu_179_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to1 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;

    component compute_r_bins_64bkb IS
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



begin
    compute_r_bins_64bkb_U1 : component compute_r_bins_64bkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 18,
        din1_WIDTH => 15,
        dout_WIDTH => 33)
    port map (
        din0 => hw_cos_val_V_0_data_reg,
        din1 => mdt_localx_V_0_data_reg,
        dout => ret_V_4_fu_196_p2);

    compute_r_bins_64bkb_U2 : component compute_r_bins_64bkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 18,
        din1_WIDTH => 15,
        dout_WIDTH => 33)
    port map (
        din0 => hw_sin_val_V_0_data_reg,
        din1 => mdt_localy_V_preg,
        dout => ret_V_5_fu_202_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                    ap_enable_reg_pp0_iter1 <= ap_start;
                end if;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if;
            end if;
        end if;
    end process;


    mdt_localy_V_ap_vld_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                mdt_localy_V_ap_vld_preg <= ap_const_logic_0;
            else
                if ((not(((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (mdt_localy_V_ap_vld = ap_const_logic_1))) then
                    mdt_localy_V_ap_vld_preg <= mdt_localy_V_ap_vld;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                    mdt_localy_V_ap_vld_preg <= ap_const_logic_0;
                end if;
            end if;
        end if;
    end process;


    mdt_localy_V_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                mdt_localy_V_preg <= ap_const_lv15_0;
            else
                if ((not(((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (mdt_localy_V_ap_vld = ap_const_logic_1))) then
                    mdt_localy_V_preg <= mdt_localy_V;
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

    mdt_r_offset_0_V_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;

    mdt_r_offset_1_V_0_vld_reg_assign_proc : process (ap_clk)
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
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (mdt_localx_V_0_vld_reg = ap_const_logic_0) and (ap_const_logic_1 = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (mdt_localx_V_0_ack_out = ap_const_logic_1) and (ap_const_logic_1 = ap_const_logic_1) and (mdt_localx_V_0_vld_reg = ap_const_logic_1)))) then
                mdt_localx_V_0_data_reg <= mdt_localx_V;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (mdt_r_offset_0_V_0_vld_reg = ap_const_logic_0) and (ap_const_logic_1 = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (mdt_r_offset_0_V_0_ack_out = ap_const_logic_1) and (ap_const_logic_1 = ap_const_logic_1) and (mdt_r_offset_0_V_0_vld_reg = ap_const_logic_1)))) then
                mdt_r_offset_0_V_0_data_reg <= mdt_r_offset_0_V;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (mdt_r_offset_1_V_0_vld_reg = ap_const_logic_0) and (ap_const_logic_1 = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (mdt_r_offset_1_V_0_ack_out = ap_const_logic_1) and (ap_const_logic_1 = ap_const_logic_1) and (mdt_r_offset_1_V_0_vld_reg = ap_const_logic_1)))) then
                mdt_r_offset_1_V_0_data_reg <= mdt_r_offset_1_V;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ret_V_4_reg_208 <= ret_V_4_fu_196_p2;
                ret_V_5_reg_213 <= ret_V_5_fu_202_p2;
                trunc_ln1353_1_reg_223 <= trunc_ln1353_1_fu_130_p1;
                trunc_ln1353_reg_218 <= trunc_ln1353_fu_126_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage0_subdone, ap_reset_idle_pp0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 =>
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln1353_fu_174_p2 <= std_logic_vector(unsigned(trunc_ln1353_1_reg_223) + unsigned(tmp_fu_134_p4));
    add_ln215_fu_143_p2 <= std_logic_vector(unsigned(trunc_ln1353_reg_218) + unsigned(tmp_fu_134_p4));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, mdt_localy_V_ap_vld_preg)
    begin
                ap_block_pp0_stage0_01001 <= (((ap_start = ap_const_logic_0) and (ap_start = ap_const_logic_1)) or ((mdt_localy_V_ap_vld_preg = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, mdt_localy_V_ap_vld_preg)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_start = ap_const_logic_0) and (ap_start = ap_const_logic_1)) or ((mdt_localy_V_ap_vld_preg = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, mdt_localy_V_ap_vld_preg)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_start = ap_const_logic_0) and (ap_start = ap_const_logic_1)) or ((mdt_localy_V_ap_vld_preg = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ap_start)
    begin
                ap_block_state1_pp0_stage0_iter0 <= (ap_start = ap_const_logic_0);
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(mdt_localy_V_ap_vld_preg)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (mdt_localy_V_ap_vld_preg = ap_const_logic_0);
    end process;

        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_done_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then
            ap_done <= ap_const_logic_1;
        else
            ap_done <= ap_const_logic_0;
        end if;
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start;

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


    ap_ready_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
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


    hw_cos_val_V_0_ack_out_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then
            hw_cos_val_V_0_ack_out <= ap_const_logic_1;
        else
            hw_cos_val_V_0_ack_out <= ap_const_logic_0;
        end if;
    end process;


    hw_sin_val_V_0_ack_out_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then
            hw_sin_val_V_0_ack_out <= ap_const_logic_1;
        else
            hw_sin_val_V_0_ack_out <= ap_const_logic_0;
        end if;
    end process;


    mdt_localx_V_0_ack_out_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then
            mdt_localx_V_0_ack_out <= ap_const_logic_1;
        else
            mdt_localx_V_0_ack_out <= ap_const_logic_0;
        end if;
    end process;


    mdt_localy_V_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then
            mdt_localy_V_blk_n <= ap_const_logic_0;
        else
            mdt_localy_V_blk_n <= ap_const_logic_1;
        end if;
    end process;


    mdt_r_offset_0_V_0_ack_out_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then
            mdt_r_offset_0_V_0_ack_out <= ap_const_logic_1;
        else
            mdt_r_offset_0_V_0_ack_out <= ap_const_logic_0;
        end if;
    end process;


    mdt_r_offset_1_V_0_ack_out_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then
            mdt_r_offset_1_V_0_ack_out <= ap_const_logic_1;
        else
            mdt_r_offset_1_V_0_ack_out <= ap_const_logic_0;
        end if;
    end process;

    r_bin_0_V <= ret_V_fu_157_p2(12 downto 6);

    r_bin_0_V_ap_vld_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then
            r_bin_0_V_ap_vld <= ap_const_logic_1;
        else
            r_bin_0_V_ap_vld <= ap_const_logic_0;
        end if;
    end process;

    r_bin_1_V <= ret_V_3_fu_179_p2(12 downto 6);

    r_bin_1_V_ap_vld_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then
            r_bin_1_V_ap_vld <= ap_const_logic_1;
        else
            r_bin_1_V_ap_vld <= ap_const_logic_0;
        end if;
    end process;

    ret_V_3_fu_179_p2 <= std_logic_vector(unsigned(add_ln1353_fu_174_p2) + unsigned(zext_ln215_3_cast_fu_148_p4));
    ret_V_fu_157_p2 <= std_logic_vector(unsigned(add_ln215_fu_143_p2) + unsigned(zext_ln215_3_cast_fu_148_p4));
    tmp_fu_134_p4 <= ret_V_5_reg_213(28 downto 16);
    trunc_ln1353_1_fu_130_p1 <= mdt_r_offset_1_V_0_data_reg(13 - 1 downto 0);
    trunc_ln1353_fu_126_p1 <= mdt_r_offset_0_V_0_data_reg(13 - 1 downto 0);
    zext_ln215_3_cast_fu_148_p4 <= ret_V_4_reg_208(28 downto 16);
end behav;
