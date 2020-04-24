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

vlib lsf
vmap lsf lsf
set CWD /home/psundara/L0MDT/psundara/l0mdt-hdl-design/lsf
#set CWD /DFS-L/DATA/atlas/psundara/CERN/ATLAS/L0MDT/GIT/HLS_MuTrig/
set LOAD_LUTS_HLS_IP "$CWD/src/hls_ip/hls_load_luts/hdl/verilog"
set GET_ROM_ADDR_HLS_IP "$CWD/src/hls_ip/hls_get_rom_addr/hdl/verilog"
set GET_TRIG_VALS_HLS_IP "$CWD/src/hls_ip/hls_get_trig_vals/hdl/verilog"
set COMPUTE_RBINS_HLS_IP "$CWD/src/hls_ip/hls_compute_r_bins/hdl/verilog"
set SPYBUFFER_SRC "$CWD/../IP_repository/SpyBuffer/src"
set PLL_IP "$CWD/IP/pll_inst"
set FIND_MAX_BIN_HLS_IP "$CWD/src/hls_ip/hls_find_max_bin/hdl/verilog"
set GET_LEGENDRE_SEGMENT_HLS_IP "$CWD/src/hls_ip/hls_get_legendre_segment/hdl/verilog"
set IP "$CWD/../IP"
set SRC "$CWD/src"
set TB "$CWD/tb"

vlog -sv -work lsf "$CWD/sim/glbl.v"
vlog -sv -work lsf "$GET_ROM_ADDR_HLS_IP/get_rom_addr.v"
vlog -sv -work lsf "$GET_ROM_ADDR_HLS_IP/get_rom_addr_mul_mul_15ns_22s_37_2_1.v"
vlog -sv -work lsf "$GET_ROM_ADDR_HLS_IP/get_rom_addr_mux_164_14_1_1.v"
vlog -sv -work lsf "$GET_ROM_ADDR_HLS_IP/get_rom_addr_mux_164_4_1_1.v"
vlog -sv -work lsf "$GET_ROM_ADDR_HLS_IP/get_rom_addr_mux_164_1_1_1.v"  
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_high_V_0.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_high_V_1.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_high_V_2.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_high_V_3.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_high_V_4.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_high_V_5.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_high_V_6.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_high_V_7.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_0.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_10.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_11.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_12.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_13.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_14.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_15.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_1.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_2.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_3.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_4.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_5.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_6.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_7.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_8.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_cos_tables_low_V_9.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_mux_164_8_1_1.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_high_V_0.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_high_V_1.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_high_V_2.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_high_V_3.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_high_V_4.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_high_V_5.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_high_V_6.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_high_V_7.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_0.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_10.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_11.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_12.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_13.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_14.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_15.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_1.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_2.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_3.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_4.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_5.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_6.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_7.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_8.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals_sin_tables_low_V_9.v"
vlog -sv -work lsf "$GET_TRIG_VALS_HLS_IP/get_trig_vals.v"


vlog -sv -work lsf "$COMPUTE_RBINS_HLS_IP/compute_r_bins.v"
vlog -sv -work lsf "$COMPUTE_RBINS_HLS_IP/compute_r_bins_0_s.v"
vlog -sv -work lsf "$COMPUTE_RBINS_HLS_IP/compute_r_bins_mul_mul_15s_22s_35_2_1.v"
vlog -sv -work lsf "$IP/histogram_memory_128x4/simulation/dist_mem_gen_v8_0.v"
vlog -sv -work lsf "$IP/histogram_memory_128x4/sim/histogram_memory_128x4.v" 
vlog -sv -work lsf "$SRC/update_histogram.sv"
vlog -sv -work lsf "$FIND_MAX_BIN_HLS_IP/find_max_bin.v"
vlog -sv -work lsf "$GET_LEGENDRE_SEGMENT_HLS_IP/get_legendre_segment.v"
vlog -sv -work lsf "$GET_LEGENDRE_SEGMENT_HLS_IP/get_legendre_segment_mul_mul_24s_19s_39_2_1.v"
vlog -sv -work lsf "$GET_LEGENDRE_SEGMENT_HLS_IP/get_legendre_segment_sdiv_39ns_24s_19_43_1.v"
vlog -sv -work lsf "$SRC/legendreEngine.sv"
vlog -sv -work lsf "$SPYBUFFER_SRC/aFifo/aFifo.v" 
vlog -sv -work lsf "$SPYBUFFER_SRC/aFifo/fifomem.v" 
vlog -sv -work lsf "$SPYBUFFER_SRC/aFifo/rptr_empty.v" 
vlog -sv -work lsf "$SPYBUFFER_SRC/aFifo/sync_r2w.v" 
vlog -sv -work lsf "$SPYBUFFER_SRC/aFifo/sync_w2r.v" 
vlog -sv -work lsf "$SPYBUFFER_SRC/aFifo/wptr_full.v" 
vlog -sv -work lsf +incdir+$SPYBUFFER_SRC/.. "$SPYBUFFER_SRC/SpyController.v" 
vlog -sv -work lsf "$SPYBUFFER_SRC/SpyMemory.v" 
vlog -sv -work lsf "$SPYBUFFER_SRC/SpyBuffer.v"
vlog -sv -work lsf "$SRC/lsf_spybuffer_wrapper.sv"
vlog -sv -work lsf "$SRC/legendreEngine_top.sv"
vlog -sv -work lsf "$SRC/../sim/l0mdt_buses_constants.svh"
vcom -work lsf "$SRC/../sim/l0mdt_buses_constants_pkg.vhd"		     
#vcom -work lsf "$SRC/lsf_wrapper.vhd"
vcom -work lsf "$SRC/../../Top/lsf/top_lsf.vhd"
vlog -sv -work lsf "$TB/lsf_sb_vhd_tb.v"


vsim -debugDB -t 10ps  -voptargs="+acc" -L lsf -L unisims_ver apatb_lsf_sb_vhd_tb glbl -suppress 6630 -wlf lsf_sb_vhd_tb.wlf 

#set WildcardFilter "Variable Constant Generic Parameter SpecParam Memory Assertion Cover Endpoint ScVariable CellInternal ImmediateAssert VHDLFile"
set WildcardFilter "Variable Constant Generic Parameter SpecParam Assertion Cover Endpoint ScVariable CellInternal ImmediateAssert VHDLFile"
#set WildcardFilter [lsearch -not -all -inline $WildcardFilter Parameter]
add wave -r /*
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
run -all
abort
