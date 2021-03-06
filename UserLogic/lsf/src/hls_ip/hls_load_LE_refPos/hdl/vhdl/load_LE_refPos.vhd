-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2019.2.1
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity load_LE_refPos is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    mdtid_V : IN STD_LOGIC_VECTOR (8 downto 0);
    slcvec_pos_ref_V : OUT STD_LOGIC_VECTOR (17 downto 0);
    hewindow_pos_ref_V : OUT STD_LOGIC_VECTOR (17 downto 0) );
end;


architecture behav of load_LE_refPos is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "load_LE_refPos,hls_ip_2019_2_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xcku15p-ffva1760-2-e,HLS_INPUT_CLOCK=3.125000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=2.024000,HLS_SYN_LAT=2,HLS_SYN_TPT=1,HLS_SYN_MEM=1,HLS_SYN_DSP=0,HLS_SYN_FF=37,HLS_SYN_LUT=41,HLS_VERSION=2019_2_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv10_3FF : STD_LOGIC_VECTOR (9 downto 0) := "1111111111";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv11_7FF : STD_LOGIC_VECTOR (10 downto 0) := "11111111111";

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
    signal slcvec_pos_ref_V_1_ack_in : STD_LOGIC;
    signal hewindow_pos_ref_V_1_ack_in : STD_LOGIC;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal slcvec_pos_ref_V_1_data_reg : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    signal slcvec_pos_ref_V_1_vld_reg : STD_LOGIC := '0';
    signal slcvec_pos_ref_V_1_vld_in : STD_LOGIC;
    signal hewindow_pos_ref_V_1_data_reg : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    signal hewindow_pos_ref_V_1_vld_reg : STD_LOGIC := '0';
    signal hewindow_pos_ref_V_1_vld_in : STD_LOGIC;
    signal lut_mdt_ref_pos_V_address0 : STD_LOGIC_VECTOR (9 downto 0);
    signal lut_mdt_ref_pos_V_ce0 : STD_LOGIC;
    signal lut_mdt_ref_pos_V_q0 : STD_LOGIC_VECTOR (16 downto 0);
    signal lut_mdt_ref_pos_V_address1 : STD_LOGIC_VECTOR (9 downto 0);
    signal lut_mdt_ref_pos_V_ce1 : STD_LOGIC;
    signal lut_mdt_ref_pos_V_q1 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln356_fu_129_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal zext_ln356_1_fu_134_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal sext_ln559_fu_101_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal sext_ln559_1_fu_124_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal zext_ln703_fu_91_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal ret_V_fu_95_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal ret_V_4_fu_106_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal zext_ln703_1_fu_114_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal ret_V_3_fu_118_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to1 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;

    component load_LE_refPos_lubkb IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (9 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (16 downto 0);
        address1 : IN STD_LOGIC_VECTOR (9 downto 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR (16 downto 0) );
    end component;



begin
    lut_mdt_ref_pos_V_U : component load_LE_refPos_lubkb
    generic map (
        DataWidth => 17,
        AddressRange => 1024,
        AddressWidth => 10)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => lut_mdt_ref_pos_V_address0,
        ce0 => lut_mdt_ref_pos_V_ce0,
        q0 => lut_mdt_ref_pos_V_q0,
        address1 => lut_mdt_ref_pos_V_address1,
        ce1 => lut_mdt_ref_pos_V_ce1,
        q1 => lut_mdt_ref_pos_V_q1);





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
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
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


    hewindow_pos_ref_V_1_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;

    slcvec_pos_ref_V_1_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (hewindow_pos_ref_V_1_vld_reg = ap_const_logic_0) and (hewindow_pos_ref_V_1_vld_in = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (ap_const_logic_1 = ap_const_logic_1) and (hewindow_pos_ref_V_1_vld_in = ap_const_logic_1) and (hewindow_pos_ref_V_1_vld_reg = ap_const_logic_1)))) then
                    hewindow_pos_ref_V_1_data_reg(16 downto 0) <= zext_ln356_1_fu_134_p1(16 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (slcvec_pos_ref_V_1_vld_reg = ap_const_logic_0) and (slcvec_pos_ref_V_1_vld_in = ap_const_logic_1)) or (not(((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (ap_const_logic_1 = ap_const_logic_1) and (slcvec_pos_ref_V_1_vld_in = ap_const_logic_1) and (slcvec_pos_ref_V_1_vld_reg = ap_const_logic_1)))) then
                    slcvec_pos_ref_V_1_data_reg(16 downto 0) <= zext_ln356_fu_129_p1(16 downto 0);
            end if;
        end if;
    end process;
    slcvec_pos_ref_V_1_data_reg(17) <= '0';
    hewindow_pos_ref_V_1_data_reg(17) <= '0';

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

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter2, slcvec_pos_ref_V_1_ack_in, hewindow_pos_ref_V_1_ack_in)
    begin
                ap_block_pp0_stage0_01001 <= (((ap_start = ap_const_logic_0) and (ap_start = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((hewindow_pos_ref_V_1_ack_in = ap_const_logic_0) or (slcvec_pos_ref_V_1_ack_in = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter2, slcvec_pos_ref_V_1_ack_in, hewindow_pos_ref_V_1_ack_in)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_start = ap_const_logic_0) and (ap_start = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((hewindow_pos_ref_V_1_ack_in = ap_const_logic_0) or (slcvec_pos_ref_V_1_ack_in = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter2, slcvec_pos_ref_V_1_ack_in, hewindow_pos_ref_V_1_ack_in)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_start = ap_const_logic_0) and (ap_start = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((hewindow_pos_ref_V_1_ack_in = ap_const_logic_0) or (slcvec_pos_ref_V_1_ack_in = ap_const_logic_0))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ap_start)
    begin
                ap_block_state1_pp0_stage0_iter0 <= (ap_start = ap_const_logic_0);
    end process;

        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state3_pp0_stage0_iter2_assign_proc : process(slcvec_pos_ref_V_1_ack_in, hewindow_pos_ref_V_1_ack_in)
    begin
                ap_block_state3_pp0_stage0_iter2 <= ((hewindow_pos_ref_V_1_ack_in = ap_const_logic_0) or (slcvec_pos_ref_V_1_ack_in = ap_const_logic_0));
    end process;


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

    hewindow_pos_ref_V <= hewindow_pos_ref_V_1_data_reg;

    hewindow_pos_ref_V_1_ack_in_assign_proc : process(hewindow_pos_ref_V_1_vld_reg)
    begin
        if (((hewindow_pos_ref_V_1_vld_reg = ap_const_logic_0) or ((ap_const_logic_1 = ap_const_logic_1) and (hewindow_pos_ref_V_1_vld_reg = ap_const_logic_1)))) then 
            hewindow_pos_ref_V_1_ack_in <= ap_const_logic_1;
        else 
            hewindow_pos_ref_V_1_ack_in <= ap_const_logic_0;
        end if; 
    end process;


    hewindow_pos_ref_V_1_vld_in_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            hewindow_pos_ref_V_1_vld_in <= ap_const_logic_1;
        else 
            hewindow_pos_ref_V_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;

    lut_mdt_ref_pos_V_address0 <= sext_ln559_fu_101_p1(10 - 1 downto 0);
    lut_mdt_ref_pos_V_address1 <= sext_ln559_1_fu_124_p1(10 - 1 downto 0);

    lut_mdt_ref_pos_V_ce0_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            lut_mdt_ref_pos_V_ce0 <= ap_const_logic_1;
        else 
            lut_mdt_ref_pos_V_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    lut_mdt_ref_pos_V_ce1_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            lut_mdt_ref_pos_V_ce1 <= ap_const_logic_1;
        else 
            lut_mdt_ref_pos_V_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    ret_V_3_fu_118_p2 <= std_logic_vector(unsigned(zext_ln703_1_fu_114_p1) + unsigned(ap_const_lv11_7FF));
    ret_V_4_fu_106_p3 <= (ap_const_lv1_1 & mdtid_V);
    ret_V_fu_95_p2 <= std_logic_vector(unsigned(zext_ln703_fu_91_p1) + unsigned(ap_const_lv10_3FF));
        sext_ln559_1_fu_124_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ret_V_3_fu_118_p2),64));

        sext_ln559_fu_101_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ret_V_fu_95_p2),64));

    slcvec_pos_ref_V <= slcvec_pos_ref_V_1_data_reg;

    slcvec_pos_ref_V_1_ack_in_assign_proc : process(slcvec_pos_ref_V_1_vld_reg)
    begin
        if (((slcvec_pos_ref_V_1_vld_reg = ap_const_logic_0) or ((ap_const_logic_1 = ap_const_logic_1) and (slcvec_pos_ref_V_1_vld_reg = ap_const_logic_1)))) then 
            slcvec_pos_ref_V_1_ack_in <= ap_const_logic_1;
        else 
            slcvec_pos_ref_V_1_ack_in <= ap_const_logic_0;
        end if; 
    end process;


    slcvec_pos_ref_V_1_vld_in_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            slcvec_pos_ref_V_1_vld_in <= ap_const_logic_1;
        else 
            slcvec_pos_ref_V_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln356_1_fu_134_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lut_mdt_ref_pos_V_q1),18));
    zext_ln356_fu_129_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lut_mdt_ref_pos_V_q0),18));
    zext_ln703_1_fu_114_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ret_V_4_fu_106_p3),11));
    zext_ln703_fu_91_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(mdtid_V),10));
end behav;
