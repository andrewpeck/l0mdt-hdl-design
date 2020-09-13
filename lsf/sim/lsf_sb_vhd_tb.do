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
set MSIM_INI /home/psundara/xilinx/compiled_libraries/v2019.1/modelsim.ini
#set MSIM_INI /DFS-L/DATA/atlas/psundara/xilinx/compiled_libraries/v2019.1/modelsim.ini
if {[file exist [file join $MSIM_INI]]} {
    vmap -c -modelsimini [file join $MSIM_INI]
} else {
    puts "ERROR: Please make sure the modelsim.ini is in the path $MSIM_INI "
    exit -force
}

vlib lsf_lib
vmap work lsf_lib

set CWD /home/psundara/L0MDT/psundara/l0mdt-hdl-design/lsf
#set CWD /DFS-L/DATA/atlas/psundara/CERN/ATLAS/L0MDT/GIT/HLS_MuTrig/
set LOAD_LUTS_HLS_IP "$CWD/src/hls_ip/hls_load_luts/hdl/verilog"
set GET_ROM_ADDR_HLS_IP "$CWD/src/hls_ip/hls_get_rom_addr/hdl/verilog"
set GET_TRIG_VALS_HLS_IP "$CWD/src/hls_ip/hls_get_trig_vals/hdl/verilog"
set COMPUTE_RBINS_HLS_IP "$CWD/src/hls_ip/hls_compute_r_bins/hdl/verilog"
set SPYBUFFER_SRC "$CWD/../IP_repository/SpyBuffer"
set PLL_IP "$CWD/IP/pll_inst"
set FIND_MAX_BIN_HLS_IP "$CWD/src/hls_ip/hls_find_max_bin/hdl/verilog"
set GET_LEGENDRE_SEGMENT_HLS_IP "$CWD/src/hls_ip/hls_get_legendre_segment/hdl/verilog"
set GET_LEGENDRE_SEGMENT_BARREL_HLS_IP "$CWD/src/hls_ip/hls_get_legendre_segment_barrel/hdl/verilog"
set CALC_LE_R_OFFSET_BARREL_HLS_IP "$CWD/src/hls_ip/hls_calc_LE_r_offset_barrel/hdl/verilog"
set HISTMEM_128x4 "$CWD/sim"
set SRC "$CWD/src"
set TB "$CWD/tb"

vlog -sv -work lsf_lib "$CWD/sim/glbl.v"
vlog -sv -work lsf_lib "$GET_ROM_ADDR_HLS_IP/get_rom_addr.v"
vlog -sv -work lsf_lib "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_0.v"
vlog -sv -work lsf_lib "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_1.v"
vlog -sv -work lsf_lib "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_2.v"
vlog -sv -work lsf_lib "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_3.v"
vlog -sv -work lsf_lib "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_4.v"
vlog -sv -work lsf_lib "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_5.v"
vlog -sv -work lsf_lib "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_6.v"
vlog -sv -work lsf_lib "$GET_TRIG_VALS_HLS_IP/get_trig_vals_lut_tables_7.v"  
vlog -sv -work lsf_lib "$GET_TRIG_VALS_HLS_IP/get_trig_vals.v"
vlog -sv -work lsf_lib "$COMPUTE_RBINS_HLS_IP/compute_r_bins.v"
vlog -sv -work lsf_lib "$COMPUTE_RBINS_HLS_IP/compute_r_bins_mul_18s_15s_33_2_1.v"
vlog -sv -work lsf_lib "$HISTMEM_128x4/dist_mem_gen_v8_0.v"
vlog -sv -work lsf_lib "$HISTMEM_128x4/histogram_memory_128x4.v" 
vlog -sv -work lsf_lib "$SRC/update_histogram.sv"
vlog -sv -work lsf_lib "$FIND_MAX_BIN_HLS_IP/find_max_bin.v"
vlog -sv -work lsf_lib "$GET_LEGENDRE_SEGMENT_BARREL_HLS_IP/get_legendre_segment_barrel.v"
vlog -sv -work lsf_lib "$GET_LEGENDRE_SEGMENT_BARREL_HLS_IP/get_legendre_segment_barrel_lut_divider_barrel_V.v"
vlog -sv -work lsf_lib "$GET_LEGENDRE_SEGMENT_BARREL_HLS_IP/get_legendre_segment_barrel_mul_mul_13ns_18s_31_1_1.v"
vlog -sv -work lsf_lib "$GET_LEGENDRE_SEGMENT_BARREL_HLS_IP/get_legendre_segment_barrel_mul_mul_18s_18s_35_1_1.v"
vlog -sv -work lsf_lib "$GET_LEGENDRE_SEGMENT_BARREL_HLS_IP/get_legendre_segment_barrel_mul_mul_26ns_18ns_32_1_1.v"
vlog -sv -work lsf_lib "$CALC_LE_R_OFFSET_BARREL_HLS_IP/calc_LE_r_offset_barrel.v"
vlog -sv -work lsf_lib "$CALC_LE_R_OFFSET_BARREL_HLS_IP/calc_LE_r_offset_barrel_mac_muladd_18s_20s_38s_38_1_1.v"
vlog -sv -work lsf_lib "$CALC_LE_R_OFFSET_BARREL_HLS_IP/calc_LE_r_offset_barrel_mul_mul_18s_21s_38_1_1.v"
vlog -sv -work lsf_lib +incdir+$CWD/../dataformats "$SRC/legendreEngine.sv"
vlog -sv -work lsf_lib "$SPYBUFFER_SRC/aFifo/aFifo.v" 
vlog -sv -work lsf_lib "$SPYBUFFER_SRC/aFifo/fifomem.v" 
vlog -sv -work lsf_lib "$SPYBUFFER_SRC/aFifo/rptr_empty.v" 
vlog -sv -work lsf_lib "$SPYBUFFER_SRC/aFifo/sync_r2w.v" 
vlog -sv -work lsf_lib "$SPYBUFFER_SRC/aFifo/sync_w2r.v" 
vlog -sv -work lsf_lib "$SPYBUFFER_SRC/aFifo/wptr_full.v" 
vlog -sv -work lsf_lib +incdir+$SPYBUFFER_SRC/.. "$SPYBUFFER_SRC/SpyController.v" 
vlog -sv -work lsf_lib "$SPYBUFFER_SRC/SpyMemory.v" 
vlog -sv -work lsf_lib "$SPYBUFFER_SRC/SpyPlayback.v" 
vlog -sv -work lsf_lib "$SPYBUFFER_SRC/SpyBuffer.v"
vlog -sv -work lsf_lib  +incdir+$CWD/../dataformats "$SRC/lsf_spybuffer_wrapper.sv"
vlog -sv -work lsf_lib  +incdir+$CWD/../dataformats "$SRC/legendreEngine_top.sv"
#vlog -sv -work lsf_lib "$CWD/dataformats/l0mdt_buses_constants.svh"
vcom -work shared_lib "$CWD/../shared/types/common_ieee_pkg.vhd"
vcom -work shared_lib "$CWD/../dataformats/l0mdt_constants_pkg.vhd"		     
vcom -work shared_lib "$CWD/../dataformats/l0mdt_dataformats_pkg.vhd"		     
vcom -work lsf_lib  +incdir+$CWD/../dataformats "$SRC/lsf_wrapper.vhd"
#vcom -work lsf_lib  +incdir+$CWD/../dataformats "$SRC/../../Top/lsf/top_lsf.vhd"
vlog -sv -work lsf_lib  +incdir+$CWD/../dataformats "$TB/lsf_sb_vhd_tb.v"


vsim  -debugDB -t 10ps  -voptargs="+acc"  -L lsf_lib -L shared_lib -L unisims_ver apatb_lsf_sb_vhd_tb glbl -suppress 6630 -wlf lsf_sb_vhd_tb.wlf 
#set WildcardFilter "Variable Constant Generic Parameter SpecParam Memory Assertion Cover Endpoint ScVariable CellInternal ImmediateAssert VHDLFile"
set WildcardFilter "Variable Constant Generic Parameter SpecParam Assertion Cover Endpoint ScVariable CellInternal ImmediateAssert VHDLFile"
#set WildcardFilter [lsearch -not -all -inline $WildcardFilter Parameter]
#add wave -r /*
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
run -all
abort
