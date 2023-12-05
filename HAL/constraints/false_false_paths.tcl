# -*- mode: vivado -*-

#-------------------------------------------------------------------------------
# These are false false paths for known bad issues in the timing
#
# they need to be removed eventually but for now collect them here as a list of
# issues with timing in the design
#-------------------------------------------------------------------------------

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

# this is bc of SLR crossings
set_max_delay 8.0 \
    -from [get_pins {ult_inst/logic_gen.UCM_GEN.ULT_UCM/UCM/SLC_VP_A[*].SLC_VP/ucm2hps_ar*/C}]

# fm needs to be split, it is crossing slrs
#set_max_delay 8.0 \
#    -from [get_pins {ult_inst/logic_gen.FM_GEN.ult_fm_data*/C}]

# asynchronous relationship between TXOUTCLKPCS and TX/RXOUTCLK
foreach clock_b \
    [concat \
         [get_clocks *TXOUTCLKPCS*]] {
             foreach clock_a [concat \
                                  [get_clocks *RXOUTCLK\[*] \
                                  [get_clocks *TXOUTCLK\[*]] {
                 set_clock_groups \
                     -group [get_clocks $clock_a] \
                     -group [get_clocks $clock_b] \
                     -asynchronous}}

# this damn reset is the source of endless problems.. its fanout is way too high
# and set_max_fanout doesn't placate it... I could try putting it on a BUFG or
# just try to reduce the fanout through some more pipeline stages
set_max_delay 8.0 \
    -from [get_pins -hierarchical -filter "NAME =~ *int_rst_reg/C"]

#
set_max_delay 8.0 \
    -from [get_pins "ult_inst/logic_gen.H2S_GEN.ULT_H2S/*_reset_reg/C"]

# this is a bram control signal that has a huge fanout
set_max_delay 8.0 \
    -from [get_pins -hierarchical -filter "NAME =~ */apb_mem_interface/MEM_TYPE.o_wr_addr_reg*/C"]

# I think there might be a multicycle path or something that is appropriate here but need to look into it more
set_max_delay 5.0 \
    -from [get_pins "top_hal/felix_tx*/felix_tx_gen*.felix_tx_inst/txdatapath_inst/UPS/*/scrambledData_reg*/C"]

# the spybuffers need to be split up into different slrs etc, coming from different axi slaves
set_max_delay 8.0 \
    -from [get_pins {ult_inst/logic_gen.FM_GEN.ULT_FM/fm_inst/fm_data_inst/l0mdt_spybuffers*/CLKARDCLK}]

set_max_delay 8.0 \
    -from [get_pins {ult_inst/logic_gen.FM_GEN.ULT_FM/fm_inst/*/*/C}]

set_max_delay 8.0 \
    -from [get_pins {top_control_inst/fm_mon_r_reg*/C}]

set_max_delay 8.0 \
    -to [get_pins {top_control_inst/fm_mon_r_reg*/D}]

################################################################################
# Ctrl & Mon
################################################################################

# the apb is clocked by 320MHz clock but controlled by 40MHz control signals so
# some propagation delay is allowed? need to be careful about this.. probably
# need to make sure data is only transferred on the strobe

set_max_delay 12.5 \
    -from [get_pins -hierarchical -filter "NAME =~ ult_inst/*apb_mem_interface*/C"]

set_max_delay 12.5 \
    -to [get_pins -hierarchical -filter "NAME =~ ult_inst/*apb_mem_interface*/D"]

################################################################################
# DAQ
################################################################################

# the daq delay blocks have HUGE paths, 12 logic levels with high fanout and create
# > 3ns negative slack

set_max_delay 8.0 \
    -from [get_pins -hier -filter "NAME =~ ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/DAQ_GEN.gen_daq_*.gen_daq_conn_*.u_daq_*_delay/RING_GEN.ring_mem/TOPOLOGY.rd_index_reg[*]/C"] \
    -to   [get_pins -hier -filter "NAME =~ ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/DAQ_GEN.gen_daq_*.gen_daq_conn_*.u_daq_*_delay/RING_GEN.ring_mem/TOPOLOGY.mem_reg*/EN*WREN"]

set_max_delay 8.0 \
    -from [get_pins -hier -filter "NAME =~ ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/DAQ_GEN.gen_daq_*.gen_daq_conn_*.u_daq_*_delay/RING_GEN.ring_mem/TOPOLOGY.rd_index_reg[*]/C"] \
    -to   [get_pins -hier -filter "NAME =~ ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/DAQ_GEN.gen_daq_*.gen_daq_conn_*.u_daq_*_delay/RING_GEN.ring_mem/TOPOLOGY.mem_reg*/RSTRAM*"]

set_max_delay 8.0 \
    -from [get_pins {ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/DAQ_GEN.gen_daq_*.u_daq_*/gen_daq_algo_mask[*].gen_daq_algo_map.u_daq_algo/gen_data_rows[*].u_data_row/data_nodes[*].u_data_node/data_fifo_u/xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_fwft.empty_fwft_i_reg/C}] \
    -to   [get_pins {ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/DAQ_GEN.gen_daq_*.u_daq_*/gen_daq_algo_mask[*].gen_daq_algo_map.u_daq_algo/u_daq_mngt/col_en_v_reg*/D}]

set_max_delay 8.0 \
    -to   [get_pins {ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/DAQ_GEN.gen_daq_*.u_daq_*/gen_daq_algo_mask[*].gen_daq_algo_map.u_daq_algo/u_daq_mngt/col_en_v_reg*/D}]
