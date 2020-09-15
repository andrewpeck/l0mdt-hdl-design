-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2019.1.1
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity get_rom_addr is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    theta_for_lut_V_ap_vld : IN STD_LOGIC;
    theta_for_lut_V : IN STD_LOGIC_VECTOR (17 downto 0);
    rom_index_V : OUT STD_LOGIC_VECTOR (3 downto 0);
    rom_index_V_ap_vld : OUT STD_LOGIC;
    lut_start_addr_V : OUT STD_LOGIC_VECTOR (13 downto 0);
    lut_start_addr_V_ap_vld : OUT STD_LOGIC );
end;


architecture behav of get_rom_addr is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "get_rom_addr,hls_ip_2019_1_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xcku15p-ffva1760-1LV-i,HLS_INPUT_CLOCK=3.125000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=2.519375,HLS_SYN_LAT=1,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=39,HLS_SYN_LUT=167,HLS_VERSION=2019_1_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv18_0 : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    constant ap_const_lv18_3FFF8 : STD_LOGIC_VECTOR (17 downto 0) := "111111111111111000";
    constant ap_const_lv6_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    constant ap_const_lv25_321800 : STD_LOGIC_VECTOR (24 downto 0) := "0001100100001100000000000";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal theta_for_lut_V_ap_vld_in_sig : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal theta_for_lut_V_preg : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    signal theta_for_lut_V_in_sig : STD_LOGIC_VECTOR (17 downto 0);
    signal theta_for_lut_V_ap_vld_preg : STD_LOGIC := '0';
    signal theta_for_lut_V_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal add_ln703_fu_70_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln703_reg_157 : STD_LOGIC_VECTOR (17 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal r_V_fu_76_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal sext_ln1118_fu_83_p1 : STD_LOGIC_VECTOR (24 downto 0);
    signal add_ln1192_fu_87_p2 : STD_LOGIC_VECTOR (24 downto 0);
    signal tmp_fu_93_p4 : STD_LOGIC_VECTOR (14 downto 0);
    signal trunc_ln851_fu_115_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal sext_ln835_fu_103_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal icmp_ln851_fu_119_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ret_V_fu_125_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_s_fu_107_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln851_fu_131_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal select_ln850_fu_139_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;


begin




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


    theta_for_lut_V_ap_vld_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                theta_for_lut_V_ap_vld_preg <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    theta_for_lut_V_ap_vld_preg <= ap_const_logic_0;
                elsif ((not(((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (theta_for_lut_V_ap_vld = ap_const_logic_1))) then 
                    theta_for_lut_V_ap_vld_preg <= theta_for_lut_V_ap_vld;
                end if; 
            end if;
        end if;
    end process;


    theta_for_lut_V_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                theta_for_lut_V_preg <= ap_const_lv18_0;
            else
                if ((not(((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (theta_for_lut_V_ap_vld = ap_const_logic_1))) then 
                    theta_for_lut_V_preg <= theta_for_lut_V;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                add_ln703_reg_157 <= add_ln703_fu_70_p2;
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
    add_ln1192_fu_87_p2 <= std_logic_vector(unsigned(ap_const_lv25_321800) + unsigned(sext_ln1118_fu_83_p1));
    add_ln703_fu_70_p2 <= std_logic_vector(signed(ap_const_lv18_3FFF8) + signed(theta_for_lut_V_in_sig));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, theta_for_lut_V_ap_vld_in_sig)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_start = ap_const_logic_1) and ((ap_start = ap_const_logic_0) or (theta_for_lut_V_ap_vld_in_sig = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, theta_for_lut_V_ap_vld_in_sig)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_start = ap_const_logic_1) and ((ap_start = ap_const_logic_0) or (theta_for_lut_V_ap_vld_in_sig = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, theta_for_lut_V_ap_vld_in_sig)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_start = ap_const_logic_1) and ((ap_start = ap_const_logic_0) or (theta_for_lut_V_ap_vld_in_sig = ap_const_logic_0)));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ap_start, theta_for_lut_V_ap_vld_in_sig)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_start = ap_const_logic_0) or (theta_for_lut_V_ap_vld_in_sig = ap_const_logic_0));
    end process;

        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_done_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to0_assign_proc : process(ap_enable_reg_pp0_iter0)
    begin
        if ((ap_enable_reg_pp0_iter0 = ap_const_logic_0)) then 
            ap_idle_pp0_0to0 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to0 <= ap_const_logic_0;
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


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to0)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to0 = ap_const_logic_1))) then 
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else 
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln851_fu_119_p2 <= "1" when (trunc_ln851_fu_115_p1 = ap_const_lv10_0) else "0";
    lut_start_addr_V <= select_ln850_fu_139_p3(14 - 1 downto 0);

    lut_start_addr_V_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            lut_start_addr_V_ap_vld <= ap_const_logic_1;
        else 
            lut_start_addr_V_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_Result_s_fu_107_p3 <= add_ln1192_fu_87_p2(24 downto 24);
    r_V_fu_76_p3 <= (add_ln703_reg_157 & ap_const_lv6_0);
    ret_V_fu_125_p2 <= std_logic_vector(unsigned(ap_const_lv16_1) + unsigned(sext_ln835_fu_103_p1));
    rom_index_V <= select_ln850_fu_139_p3(4 - 1 downto 0);

    rom_index_V_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            rom_index_V_ap_vld <= ap_const_logic_1;
        else 
            rom_index_V_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    select_ln850_fu_139_p3 <= 
        select_ln851_fu_131_p3 when (p_Result_s_fu_107_p3(0) = '1') else 
        sext_ln835_fu_103_p1;
    select_ln851_fu_131_p3 <= 
        sext_ln835_fu_103_p1 when (icmp_ln851_fu_119_p2(0) = '1') else 
        ret_V_fu_125_p2;
        sext_ln1118_fu_83_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(r_V_fu_76_p3),25));

        sext_ln835_fu_103_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_fu_93_p4),16));


    theta_for_lut_V_ap_vld_in_sig_assign_proc : process(theta_for_lut_V_ap_vld, theta_for_lut_V_ap_vld_preg)
    begin
        if ((theta_for_lut_V_ap_vld = ap_const_logic_1)) then 
            theta_for_lut_V_ap_vld_in_sig <= theta_for_lut_V_ap_vld;
        else 
            theta_for_lut_V_ap_vld_in_sig <= theta_for_lut_V_ap_vld_preg;
        end if; 
    end process;


    theta_for_lut_V_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, theta_for_lut_V_ap_vld, ap_block_pp0_stage0)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            theta_for_lut_V_blk_n <= theta_for_lut_V_ap_vld;
        else 
            theta_for_lut_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    theta_for_lut_V_in_sig_assign_proc : process(theta_for_lut_V_ap_vld, theta_for_lut_V, theta_for_lut_V_preg)
    begin
        if ((theta_for_lut_V_ap_vld = ap_const_logic_1)) then 
            theta_for_lut_V_in_sig <= theta_for_lut_V;
        else 
            theta_for_lut_V_in_sig <= theta_for_lut_V_preg;
        end if; 
    end process;

    tmp_fu_93_p4 <= add_ln1192_fu_87_p2(24 downto 10);
    trunc_ln851_fu_115_p1 <= add_ln1192_fu_87_p2(10 - 1 downto 0);
end behav;
