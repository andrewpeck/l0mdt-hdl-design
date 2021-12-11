################################################################################
# These are false false paths for known bad issues in the timing
################################################################################

set_false_path \
    -from [get_pins {ult_inst/logic_gen.UCM_GEN.ULT_UCM/UCM/SLC_VP_A*/BARREL.SLOPE_CALC/b_div_ent/IN_PL_GEN.mul_in_pipe*/C}]

set_false_path \
    -from [get_pins {ult_inst/logic_gen.UCM_GEN.ULT_UCM/UCM/SLC_VP_A*/BARREL.Z_CALC_LOOP*.Z_CALC_IF.Z_CALC/div/IN_PL_GEN.mul_in_pipe*/C}]

set_false_path \
    -from [get_pins {ult_inst/logic_gen.UCM_GEN.ULT_UCM/UCM/SLC_VP_A*/BARREL.SLOPE_CALC/e_y_ent/IN_PL_GEN.mul_in_pipe*/C}]

set_false_path \
    -from [get_pins {ult_inst/logic_gen.UCM_GEN.ULT_UCM/UCM/SLC_VP_A*/BARREL.SLOPE_CALC/e_z_ent/IN_PL_GEN.mul_in_pipe*/C}]

set_false_path \
    -from [get_pins {ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_*.HPS/heg_gen*.HEG/Heg_buffer_mux/next_read_reg*/C}] \

set_false_path \
    -to   [get_pins {ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_*.HPS/heg_gen*.HEG/Heg_buffer_mux/next_read_reg*/D}]

set_false_path \
    -from [get_pins {ult_inst/logic_gen.UCM_GEN.ULT_UCM/UCM/SLC_VP_A*.SLC_VP/BARREL.SLOPE_CALC/PL_slope/SHIFT_GEN.data_pl*/C}] \
    -to   [get_pins {ult_inst/logic_gen.UCM_GEN.ULT_UCM/UCM/SLC_VP_A*.SLC_VP/ATAN/o_mbar*/D}]

set_false_path \
    -from [get_pins {ult_inst/logic_gen.PT_GEN.ULT_PTCALC/PT_EN.PT_TYPE.mpt_loop*.mpt/ARG/DSP_A_B_DATA_INST/CLK}] \
    -to   [get_pins {ult_inst/logic_gen.PT_GEN.ULT_PTCALC/PT_EN.PT_TYPE.mpt_loop*.mpt/p_1_out/DSP_A_B_DATA_INST/A*}]

set_false_path \
    -from [get_pins {ult_inst/logic_gen.UCM_GEN.ULT_UCM/UCM/SLC_VP_A*.SLC_VP/BARREL.SLOPE_CALC/PL_slope/SHIFT_GEN.data_pl*/C}] \
    -to   [get_pins {ult_inst/logic_gen.UCM_GEN.ULT_UCM/UCM/SLC_VP_A*.SLC_VP/ATAN/o_mbar*/D}]

set_false_path \
    -from [get_pins {ult_inst/logic_gen.PT_GEN.ULT_PTCALC/PT_EN.PT_TYPE.mpt_loop*.mpt/p_1_out__1/DSP_A_B_DATA_INST/CLK}] \
    -to   [get_pins {ult_inst/logic_gen.PT_GEN.ULT_PTCALC/PT_EN.PT_TYPE.mpt_loop*.mpt/e1_eta_reg/DSP_PREADD_DATA_INST/AD*}]

set_false_path \
    -from [get_pins {ult_inst/logic_gen.PT_GEN.ULT_PTCALC/PT_EN.PT_TYPE.mpt_loop*.mpt/ARG/DSP_A_B_DATA_INST/CLK}] \
    -to   [get_pins {ult_inst/logic_gen.PT_GEN.ULT_PTCALC/PT_EN.PT_TYPE.mpt_loop*.mpt/p_1_out/DSP_A_B_DATA_INST/A*}]

set_false_path \
    -from [get_pins {ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_INN.HPS/heg_gen*.SF/EN_SF.SF_BP.SF_TYPE.CSF/b_e_generate.fitters*.fitter0/dsp_SumXY1/DSP_A_B_DATA_INST/CLK}] \
    -to   [get_pins {ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_INN.HPS/heg_gen*.SF/EN_SF.SF_BP.SF_TYPE.CSF/b_e_generate.fitters*.fitter0/dsp_SumXY0/DSP_OUTPUT_INST/ALU_OUT*}]

# this path is a little bit tight, could use a FF stage. no combinatorial logic
set_max_delay \
    -from [get_pins {ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_*/PC/*PC*/VC/apb_mem_interface/*wr_addr_reg*/C}] \
    -to   [get_pins {ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_*/PC/*PC*/VC/mem*/RAM*/WADR5}] 6.0

set_max_delay \
    -from [get_clocks -of_objects [get_pins top_hal/top_clocking_inst/framework_mmcm_inst/inst/mmcme4_adv_inst/CLKOUT1]] \
    -to   [get_clocks -of_objects [get_pins top_hal/top_clocking_inst/framework_mmcm_inst/inst/mmcme4_adv_inst/CLKOUT0]] 10.0

set_max_delay \
    -to   [get_clocks -of_objects [get_pins top_hal/top_clocking_inst/framework_mmcm_inst/inst/mmcme4_adv_inst/CLKOUT1]] \
    -from [get_clocks -of_objects [get_pins top_hal/top_clocking_inst/framework_mmcm_inst/inst/mmcme4_adv_inst/CLKOUT0]] 10.0

set_false_path \
    -from [get_pins {top_hal/pipeline_rst_bit_synchronizer/syncstages_ff_reg[4]/C}]
