# ==============================================================
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1.1 (64-bit)
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
# ==============================================================
onElabError {
    set fl [open ".exit.err" w]
    puts $fl "Elaboration errors in executing modelsim simulator"
    close $fl
    quit
}
onerror {
    set fl [open ".exit.err" w]
    puts $fl "Errors in executing modelsim simulator"
    close $fl
    quit
}
onbreak {
    quit
}

if 0 {
    vdel -all
}
set MSIM_INI /DFS-L/DATA/atlas/psundara/xilinx/compiled_libraries/v2020.2/modelsim.ini
#set MSIM_INI /home/psundara/xilinx/compiled_libraries/v2019.1/modelsim.ini
if {[file exist [file join $MSIM_INI]]} {
    vmap -c -modelsimini [file join $MSIM_INI]
} else {
    puts "ERROR: Please make sure the modelsim.ini is in the path $MSIM_INI "
    exit -force
}

vlib lsf_lib
vmap work lsf_lib
set CWD ./..
set IP_REPO ../../../l0mdt-hls/IPs/vu13p
set LOAD_LE_REFPOS "$IP_REPO/hls_load_LE_refPos/hdl/verilog/"
set FIND_MAX_BIN_HLS_IP "$IP_REPO/hls_find_max_bin/hdl/verilog/"
set FIND_MAX_BIN_64_HLS_IP "$IP_REPO/hls_find_max_bin_64/hdl/verilog/"
#set GET_ROM_ADDR_HLS_IP "$IP_REPO/hls_get_rom_addr/hdl/verilog/"
set GET_TRIG_VALS_HLS_IP "$IP_REPO/hls_get_trig_vals/hdl/verilog/"
#set COMPUTE_RBINS_HLS_IP "$IP_REPO/hls_compute_r_bins/hdl/verilog/"
set COMPUTE_RBINS_64_HLS_IP "$IP_REPO/hls_compute_r_bins_64/hdl/verilog/"
set GET_LEGENDRE_SEGMENT_BARREL_HLS_IP "$IP_REPO/hls_get_legendre_segment_barrel/hdl/verilog/"
set CALC_LE_R_OFFSET_BARREL_HLS_IP "$IP_REPO/hls_calc_LE_r_offset_barrel/hdl/verilog/"
set CALC_LE_R_OFFSET_BARREL_64_HLS_IP "$IP_REPO/hls_calc_LE_r_offset_barrel_64/hdl/verilog/"



#THETA_BINS=64
#set FIND_MAX_BIN_HLS_IP "$CWD/../l0mdt-hls/LSF/Proj/proj_find_max_bin/solution_find_max_bin/impl/ip/hdl/verilog/"
#set GET_ROM_ADDR_HLS_IP "$CWD/../l0mdt-hls/LSF/Proj/proj_get_rom_addr/solution_get_rom_addr/impl/ip/hdl/verilog/"
#set GET_TRIG_VALS_HLS_IP "$CWD/../l0mdt-hls/LSF/Proj/proj_get_trig_vals/solution_get_trig_vals/impl/ip/hdl/verilog/"
#set COMPUTE_RBINS_HLS_IP "$CWD/../l0mdt-hls/LSF/Proj/proj_compute_r_bins/solution_compute_r_bins/impl/ip/hdl/verilog/"
#set GET_LEGENDRE_SEGMENT_BARREL_HLS_IP "$CWD/../l0mdt-hls/LSF/Proj/proj_get_legendre_segment_barrel/solution_get_legendre_segment_barrel/impl/ip/hdl/verilog/"
#set CALC_LE_R_OFFSET_BARREL_HLS_IP "$CWD/../l0mdt-hls/LSF/Proj/proj_calc_LE_r_offset_barrel/solution_calc_LE_r_offset_barrel/impl/ip/hdl/verilog/"


#THETA_BINS=128
#set FIND_MAX_BIN_HLS_IP "$CWD/src/hls_ip/hls_find_max_bin/hdl/verilog"
#set GET_ROM_ADDR_HLS_IP "$CWD/src/hls_ip/hls_get_rom_addr/hdl/verilog"
#set GET_TRIG_VALS_HLS_IP "$CWD/src/hls_ip/hls_get_trig_vals/hdl/verilog"
#set COMPUTE_RBINS_HLS_IP "$CWD/src/hls_ip/hls_compute_r_bins/hdl/verilog"
#set GET_LEGENDRE_SEGMENT_BARREL_HLS_IP "$CWD/src/hls_ip/hls_get_legendre_segment_barrel/hdl/verilog"
#set CALC_LE_R_OFFSET_BARREL_HLS_IP "$CWD/src/hls_ip/hls_calc_LE_r_offset_barrel/hdl/verilog"


set SPYBUFFER_SRC "$CWD/../../shared/SpyBuffer/src"
set PLL_IP "$CWD/xilinx_ip/v2019.1/pll_inst"

set HISTMEM_128x4 "$CWD/sim"
set SRC "$CWD/src"
set TB "$CWD/tb"

vlog -sv -work work "glbl.v"
#vlog -sv -work work "$CWD/../../dataformats/l0mdt_buses_constants.svh"
#vlog -sv -work lsf_lib +incdir+$SRC +incdir+$CWD/../../dataformats "$SRC/compute_r_bins.sv"
#vlog -sv -work lsf_lib +incdir+$SRC +incdir+$CWD/../../dataformats "$SRC/get_rom_addr.sv"

#vlog -sv -work work "$GET_ROM_ADDR_HLS_IP/get_rom_addr.v"
vlog -sv -work work "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_0.v"
vlog -sv -work work "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_1.v"
vlog -sv -work work "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_2.v"
vlog -sv -work work "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_3.v"
vlog -sv -work work "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_4.v"
vlog -sv -work work "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_5.v"
vlog -sv -work work "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_6.v"
vlog -sv -work work "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_7.v"
vlog -sv -work work "$GET_TRIG_VALS_HLS_IP/get_trig_vals.v"
#vlog -sv -work work "$COMPUTE_RBINS_HLS_IP/compute_r_bins_regslice_both.v"
#vlog -sv -work work "$COMPUTE_RBINS_HLS_IP/compute_r_bins_mul_mul_18s_15s_33_4_1.v"
#vlog -sv -work work "$COMPUTE_RBINS_HLS_IP/compute_r_bins.v"
#vlog -sv -work work "$COMPUTE_RBINS_64_HLS_IP/compute_r_bins_64bkb.v"
#vlog -sv -work work "$COMPUTE_RBINS_64_HLS_IP/compute_r_bins_64.v"

vlog -sv -work work "./dist_mem_gen_v8_0.v"
vlog -sv -work work "./histogram_memory_128x4.v"
vlog -sv -work work "$SRC/update_histogram_reg.sv"
vlog -sv -work work "$SRC/update_histogram_reg_2clk.sv"
vlog -sv -work work "$SRC/update_histogram_dmem.sv"
vlog -sv -work work "$FIND_MAX_BIN_HLS_IP/find_max_bin.v"
vlog -sv -work work "$FIND_MAX_BIN_64_HLS_IP/find_max_bin_64.v"
vlog -sv -work work "$GET_LEGENDRE_SEGMENT_BARREL_HLS_IP/get_legendre_segment_barrel_mul_mul_18s_15ns_33_4_1.v"
vlog -sv -work work "$GET_LEGENDRE_SEGMENT_BARREL_HLS_IP/get_legendre_segment_barrel_mul_mul_26ns_18ns_32_4_1.v"
vlog -sv -work work "$GET_LEGENDRE_SEGMENT_BARREL_HLS_IP/get_legendre_segment_barrel_lut_divider_barrel_V.v"
vlog -sv -work work "$GET_LEGENDRE_SEGMENT_BARREL_HLS_IP/get_legendre_segment_barrel_mul_mul_18s_18s_35_4_1.v"
vlog -sv -work work "$GET_LEGENDRE_SEGMENT_BARREL_HLS_IP/get_legendre_segment_barrel.v"
vlog -sv -work work "$CALC_LE_R_OFFSET_BARREL_HLS_IP/calc_LE_r_offset_barrel_mul_mul_18s_15s_33_4_1.v"
vlog -sv -work work "$CALC_LE_R_OFFSET_BARREL_HLS_IP/calc_LE_r_offset_barrel_mac_muladd_18s_15s_33s_34_4_1.v"
vlog -sv -work work "$CALC_LE_R_OFFSET_BARREL_HLS_IP/calc_LE_r_offset_barrel.v"
vlog -sv -work work "$CALC_LE_R_OFFSET_BARREL_64_HLS_IP/calc_LE_r_offset_bkb.v"
vlog -sv -work work "$CALC_LE_R_OFFSET_BARREL_64_HLS_IP/calc_LE_r_offset_cud.v"
vlog -sv -work work "$CALC_LE_R_OFFSET_BARREL_64_HLS_IP/calc_LE_r_offset_barrel_64.v"
vlog -sv -work work "$LOAD_LE_REFPOS/load_LE_refPos_lut_mdt_ref_pos_V.v"
vlog -sv -work work "$LOAD_LE_REFPOS/load_LE_refPos.v"
vlog -sv -work work +define+RUN_SIM +incdir+$CWD/../../dataformats/ "$SRC/legendreEngine.sv"
vlog -sv -work work +define+RUN_SIM +incdir+$CWD/../../dataformats/ "$SRC/legendreEngine_2clk.sv"
vlog -sv -work work "$SPYBUFFER_SRC/aFifo/aFifo.v"
vlog -sv -work work "$SPYBUFFER_SRC/aFifo/fifomem.v"
vlog -sv -work work "$SPYBUFFER_SRC/aFifo/rptr_empty.v"
vlog -sv -work work "$SPYBUFFER_SRC/aFifo/sync_r2w.v"
vlog -sv -work work "$SPYBUFFER_SRC/aFifo/sync_w2r.v"
vlog -sv -work work "$SPYBUFFER_SRC/aFifo/wptr_full.v"
vlog -sv -work work +incdir+$SPYBUFFER_SRC/ "$SPYBUFFER_SRC/SpyPlayback.v"
vlog -sv -work work +incdir+$SPYBUFFER_SRC/ "$SPYBUFFER_SRC/SpyController.v"
vlog -sv -work work +incdir+$SPYBUFFER_SRC/ "$SPYBUFFER_SRC/SpyMemory.v"
vlog -sv -work work +incdir+$SPYBUFFER_SRC/ "$SPYBUFFER_SRC/asym_ram_tdp_read_first.v"
vlog -sv -work work +incdir+$SPYBUFFER_SRC/ "$SPYBUFFER_SRC/SpyBuffer.v"
vlog -sv -work work +incdir+$CWD/../../dataformats/ "$SRC/lsf_spybuffer_wrapper.sv"
vlib shared_lib
vcom -work shared_lib $CWD/../../shared/types/types010/common_ieee_pkg.vhd
vcom -work shared_lib $CWD/../../shared/types/types010/l0mdt_constants_pkg.vhd
vcom -work shared_lib $CWD/../../shared/types/types010/l0mdt_dataformats_pkg.vhd
vcom -work lsf_lib "$SRC/lsf_wrapper.vhd"
vlog -sv -work lsf_lib +incdir+$SRC +incdir+$CWD/../../dataformats "$SRC/compute_r_bins.sv"
vlog -sv -work lsf_lib +incdir+$SRC +incdir+$CWD/../../dataformats "$SRC/get_rom_addr.sv"
vlog -sv -work lsf_lib +incdir+$CWD/../../dataformats/ "$TB/lsf_sb_vhd_tb.v"


vsim -debugDB -t 10ps  -voptargs="+acc" -L lsf_lib -L shared_lib -L unisims_ver -L work apatb_lsf_sb_vhd_tb glbl -suppress 6630 -wlf lsf_sb_vhd_tb.wlf

#set WildcardFilter "Variable Constant Generic Parameter SpecParam Memory Assertion Cover Endpoint ScVariable CellInternal ImmediateAssert VHDLFile"
set WildcardFilter "Variable Constant Generic Parameter SpecParam Assertion Cover Endpoint ScVariable CellInternal ImmediateAssert VHDLFile"
#set WildcardFilter [lsearch -not -all -inline $WildcardFilter Parameter]
add wave -r /*
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
run -all
abort
