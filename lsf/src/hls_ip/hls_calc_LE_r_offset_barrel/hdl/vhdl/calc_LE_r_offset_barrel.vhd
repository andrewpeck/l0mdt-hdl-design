-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2019.2.1
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity calc_LE_r_offset_barrel is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    hw_sin_val_V : IN STD_LOGIC_VECTOR (17 downto 0);
    hw_cos_val_V : IN STD_LOGIC_VECTOR (17 downto 0);
    roi_seed_r_V : OUT STD_LOGIC_VECTOR (21 downto 0);
    hewindow_pos_ref_V : IN STD_LOGIC_VECTOR (17 downto 0);
    hewindow_pos_V : IN STD_LOGIC_VECTOR (13 downto 0);
    slcvec_pos_V : IN STD_LOGIC_VECTOR (13 downto 0);
    slcvec_pos_ref_V : IN STD_LOGIC_VECTOR (17 downto 0) );
end;


architecture behav of calc_LE_r_offset_barrel is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "calc_LE_r_offset_barrel,hls_ip_2019_2_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xcku15p-ffva1760-2-e,HLS_INPUT_CLOCK=3.125000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=2.533000,HLS_SYN_LAT=5,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=2,HLS_SYN_FF=282,HLS_SYN_LUT=85,HLS_VERSION=2019_2_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv34_3F8100000 : STD_LOGIC_VECTOR (33 downto 0) := "1111111000000100000000000000000000";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_21 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100001";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter4 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter5 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal roi_seed_r_V_1_ack_in : STD_LOGIC;
    signal ap_block_state6_pp0_stage0_iter5 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal hw_sin_val_V_0_data_reg : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    signal hw_sin_val_V_0_vld_reg : STD_LOGIC := '0';
    signal hw_sin_val_V_0_ack_out : STD_LOGIC;
    signal hw_cos_val_V_0_data_reg : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    signal hw_cos_val_V_0_vld_reg : STD_LOGIC := '0';
    signal hw_cos_val_V_0_ack_out : STD_LOGIC;
    signal roi_seed_r_V_1_data_reg : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000000000";
    signal roi_seed_r_V_1_vld_reg : STD_LOGIC := '0';
    signal roi_seed_r_V_1_vld_in : STD_LOGIC;
    signal hewindow_pos_ref_V_0_data_reg : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    signal hewindow_pos_ref_V_0_vld_reg : STD_LOGIC := '0';
    signal hewindow_pos_ref_V_0_ack_out : STD_LOGIC;
    signal hewindow_pos_V_0_data_reg : STD_LOGIC_VECTOR (13 downto 0) := "00000000000000";
    signal hewindow_pos_V_0_vld_reg : STD_LOGIC := '0';
    signal hewindow_pos_V_0_ack_out : STD_LOGIC;
    signal slcvec_pos_V_0_data_reg : STD_LOGIC_VECTOR (13 downto 0) := "00000000000000";
    signal slcvec_pos_V_0_vld_reg : STD_LOGIC := '0';
    signal slcvec_pos_V_0_ack_out : STD_LOGIC;
    signal slcvec_pos_ref_V_0_data_reg : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    signal slcvec_pos_ref_V_0_vld_reg : STD_LOGIC := '0';
    signal slcvec_pos_ref_V_0_ack_out : STD_LOGIC;
    signal hw_cos_val_V_read_reg_208 : STD_LOGIC_VECTOR (17 downto 0);
    signal hw_cos_val_V_read_reg_208_pp0_iter2_reg : STD_LOGIC_VECTOR (17 downto 0);
    signal hw_sin_val_V_read_reg_213 : STD_LOGIC_VECTOR (17 downto 0);
    signal sub_ln731_fu_123_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal sub_ln731_reg_218 : STD_LOGIC_VECTOR (12 downto 0);
    signal sub_ln731_reg_218_pp0_iter2_reg : STD_LOGIC_VECTOR (12 downto 0);
    signal sub_ln731_1_fu_137_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal sub_ln731_1_reg_223 : STD_LOGIC_VECTOR (12 downto 0);
    signal r_V_4_fu_194_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal r_V_4_reg_228 : STD_LOGIC_VECTOR (32 downto 0);
    signal grp_fu_200_p3 : STD_LOGIC_VECTOR (33 downto 0);
    signal ret_V_reg_233 : STD_LOGIC_VECTOR (33 downto 0);
    signal sext_ln708_fu_189_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal trunc_ln731_fu_99_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal trunc_ln731_1_fu_111_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal shl_ln_fu_103_p3 : STD_LOGIC_VECTOR (12 downto 0);
    signal shl_ln731_1_fu_115_p3 : STD_LOGIC_VECTOR (12 downto 0);
    signal trunc_ln731_2_fu_129_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal trunc_ln731_3_fu_133_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal slcvec_pos_local_Rho_fu_143_p3 : STD_LOGIC_VECTOR (14 downto 0);
    signal slcvec_pos_local_Z_V_fu_157_p3 : STD_LOGIC_VECTOR (14 downto 0);
    signal ret_V_1_fu_174_p2 : STD_LOGIC_VECTOR (33 downto 0);
    attribute use_dsp48 : string;
    attribute use_dsp48 of ret_V_1_fu_174_p2 : signal is "no";
    signal trunc_ln1_fu_179_p4 : STD_LOGIC_VECTOR (17 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to4 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;

    component calc_LE_r_offset_bkb IS
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


    component calc_LE_r_offset_cud IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (17 downto 0);
        din1 : IN STD_LOGIC_VECTOR (14 downto 0);
        din2 : IN STD_LOGIC_VECTOR (32 downto 0);
        dout : OUT STD_LOGIC_VECTOR (33 downto 0) );
    end component;



begin
    calc_LE_r_offset_bkb_U1 : component calc_LE_r_offset_bkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 18,
        din1_WIDTH => 15,
        dout_WIDTH => 33)
    port map (
        din0 => hw_sin_val_V_read_reg_213,
        din1 => slcvec_pos_local_Rho_fu_143_p3,
        dout => r_V_4_fu_194_p2);

    calc_LE_r_offset_cud_U2 : component calc_LE_r_offset_cud
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 18,
        din1_WIDTH => 15,
        din2_WIDTH => 33,
        dout_WIDTH => 34)
    port map (
        din0 => hw_cos_val_V_read_reg_208_pp0_iter2_reg,
        din1 => slcvec_pos_local_Z_V_fu_157_p3,
        din2 => r_V_4_reg_228,
        dout => grp_fu_200_p3);





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


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter4_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter5_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter5 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
                end if; 
            end if;
        end if;
    end process;


    hewindow_pos_V_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;

    hewindow_pos_ref_V_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
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

    roi_seed_r_V_1_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;

    slcvec_pos_V_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;

    slcvec_pos_ref_V_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (hewindow_pos_V_0_vld_reg = ap_const_logic_0) and (ap_const_logic_1 = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (hewindow_pos_V_0_ack_out = ap_const_logic_1) and (ap_const_logic_1 = ap_const_logic_1) and (hewindow_pos_V_0_vld_reg = ap_const_logic_1)))) then
                hewindow_pos_V_0_data_reg <= hewindow_pos_V;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (hewindow_pos_ref_V_0_vld_reg = ap_const_logic_0) and (ap_const_logic_1 = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (hewindow_pos_ref_V_0_ack_out = ap_const_logic_1) and (ap_const_logic_1 = ap_const_logic_1) and (hewindow_pos_ref_V_0_vld_reg = ap_const_logic_1)))) then
                hewindow_pos_ref_V_0_data_reg <= hewindow_pos_ref_V;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (hw_cos_val_V_0_ack_out = ap_const_logic_1) and (ap_const_logic_1 = ap_const_logic_1) and (hw_cos_val_V_0_vld_reg = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (hw_cos_val_V_0_vld_reg = ap_const_logic_0) and (ap_const_logic_1 = ap_const_logic_1)))) then
                hw_cos_val_V_0_data_reg <= hw_cos_val_V;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                hw_cos_val_V_read_reg_208 <= hw_cos_val_V_0_data_reg;
                hw_sin_val_V_read_reg_213 <= hw_sin_val_V_0_data_reg;
                sub_ln731_1_reg_223 <= sub_ln731_1_fu_137_p2;
                    sub_ln731_reg_218(12 downto 3) <= sub_ln731_fu_123_p2(12 downto 3);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                hw_cos_val_V_read_reg_208_pp0_iter2_reg <= hw_cos_val_V_read_reg_208;
                r_V_4_reg_228 <= r_V_4_fu_194_p2;
                    sub_ln731_reg_218_pp0_iter2_reg(12 downto 3) <= sub_ln731_reg_218(12 downto 3);
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
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then
                ret_V_reg_233 <= grp_fu_200_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (roi_seed_r_V_1_vld_reg = ap_const_logic_0) and (roi_seed_r_V_1_vld_in = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (ap_const_logic_1 = ap_const_logic_1) and (roi_seed_r_V_1_vld_in = ap_const_logic_1) and (roi_seed_r_V_1_vld_reg = ap_const_logic_1)))) then
                roi_seed_r_V_1_data_reg <= sext_ln708_fu_189_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (slcvec_pos_V_0_vld_reg = ap_const_logic_0) and (ap_const_logic_1 = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (slcvec_pos_V_0_ack_out = ap_const_logic_1) and (ap_const_logic_1 = ap_const_logic_1) and (slcvec_pos_V_0_vld_reg = ap_const_logic_1)))) then
                slcvec_pos_V_0_data_reg <= slcvec_pos_V;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (slcvec_pos_ref_V_0_vld_reg = ap_const_logic_0) and (ap_const_logic_1 = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (slcvec_pos_ref_V_0_ack_out = ap_const_logic_1) and (ap_const_logic_1 = ap_const_logic_1) and (slcvec_pos_ref_V_0_vld_reg = ap_const_logic_1)))) then
                slcvec_pos_ref_V_0_data_reg <= slcvec_pos_ref_V;
            end if;
        end if;
    end process;
    sub_ln731_reg_218(2 downto 0) <= "000";
    sub_ln731_reg_218_pp0_iter2_reg(2 downto 0) <= "000";

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage0_subdone, ap_reset_idle_pp0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter5, roi_seed_r_V_1_ack_in)
    begin
                ap_block_pp0_stage0_01001 <= (((ap_start = ap_const_logic_0) and (ap_start = ap_const_logic_1)) or ((roi_seed_r_V_1_ack_in = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter5, roi_seed_r_V_1_ack_in)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_start = ap_const_logic_0) and (ap_start = ap_const_logic_1)) or ((roi_seed_r_V_1_ack_in = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter5, roi_seed_r_V_1_ack_in)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_start = ap_const_logic_0) and (ap_start = ap_const_logic_1)) or ((roi_seed_r_V_1_ack_in = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1)));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ap_start)
    begin
                ap_block_state1_pp0_stage0_iter0 <= (ap_start = ap_const_logic_0);
    end process;

        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter4 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state6_pp0_stage0_iter5_assign_proc : process(roi_seed_r_V_1_ack_in)
    begin
                ap_block_state6_pp0_stage0_iter5 <= (roi_seed_r_V_1_ack_in = ap_const_logic_0);
    end process;


    ap_done_assign_proc : process(ap_enable_reg_pp0_iter5, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5)
    begin
        if (((ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to4_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4)
    begin
        if (((ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0_0to4 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to4 <= ap_const_logic_0;
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


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to4)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to4 = ap_const_logic_1))) then 
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else 
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    hewindow_pos_V_0_ack_out_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            hewindow_pos_V_0_ack_out <= ap_const_logic_1;
        else 
            hewindow_pos_V_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;


    hewindow_pos_ref_V_0_ack_out_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            hewindow_pos_ref_V_0_ack_out <= ap_const_logic_1;
        else 
            hewindow_pos_ref_V_0_ack_out <= ap_const_logic_0;
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

    ret_V_1_fu_174_p2 <= std_logic_vector(signed(ap_const_lv34_3F8100000) + signed(ret_V_reg_233));
    roi_seed_r_V <= roi_seed_r_V_1_data_reg;

    roi_seed_r_V_1_ack_in_assign_proc : process(roi_seed_r_V_1_vld_reg)
    begin
        if (((roi_seed_r_V_1_vld_reg = ap_const_logic_0) or ((ap_const_logic_1 = ap_const_logic_1) and (roi_seed_r_V_1_vld_reg = ap_const_logic_1)))) then 
            roi_seed_r_V_1_ack_in <= ap_const_logic_1;
        else 
            roi_seed_r_V_1_ack_in <= ap_const_logic_0;
        end if; 
    end process;


    roi_seed_r_V_1_vld_in_assign_proc : process(ap_enable_reg_pp0_iter4, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1))) then 
            roi_seed_r_V_1_vld_in <= ap_const_logic_1;
        else 
            roi_seed_r_V_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;

        sext_ln708_fu_189_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln1_fu_179_p4),22));

    shl_ln731_1_fu_115_p3 <= (trunc_ln731_1_fu_111_p1 & ap_const_lv3_0);
    shl_ln_fu_103_p3 <= (trunc_ln731_fu_99_p1 & ap_const_lv3_0);

    slcvec_pos_V_0_ack_out_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            slcvec_pos_V_0_ack_out <= ap_const_logic_1;
        else 
            slcvec_pos_V_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;

    slcvec_pos_local_Rho_fu_143_p3 <= (sub_ln731_1_reg_223 & ap_const_lv2_0);
    slcvec_pos_local_Z_V_fu_157_p3 <= (sub_ln731_reg_218_pp0_iter2_reg & ap_const_lv2_0);

    slcvec_pos_ref_V_0_ack_out_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            slcvec_pos_ref_V_0_ack_out <= ap_const_logic_1;
        else 
            slcvec_pos_ref_V_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;

    sub_ln731_1_fu_137_p2 <= std_logic_vector(unsigned(trunc_ln731_2_fu_129_p1) - unsigned(trunc_ln731_3_fu_133_p1));
    sub_ln731_fu_123_p2 <= std_logic_vector(unsigned(shl_ln_fu_103_p3) - unsigned(shl_ln731_1_fu_115_p3));
    trunc_ln1_fu_179_p4 <= ret_V_1_fu_174_p2(33 downto 16);
    trunc_ln731_1_fu_111_p1 <= hewindow_pos_V_0_data_reg(10 - 1 downto 0);
    trunc_ln731_2_fu_129_p1 <= slcvec_pos_ref_V_0_data_reg(13 - 1 downto 0);
    trunc_ln731_3_fu_133_p1 <= hewindow_pos_ref_V_0_data_reg(13 - 1 downto 0);
    trunc_ln731_fu_99_p1 <= slcvec_pos_V_0_data_reg(10 - 1 downto 0);
end behav;
