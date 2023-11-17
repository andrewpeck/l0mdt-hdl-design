quit -sim

file delete output0.txt
file delete output1.txt

set dir [file dirname [file normalize [info script]]]

file mkdir $dir/../proj
file mkdir $dir/../proj/tb_daq_data_path
file mkdir $dir/../proj/tb_daq_data_path/msim
file mkdir $dir/../proj/tb_daq_data_path/msim/xpm

vlib $dir/../proj/tb_daq_data_path/msim
vlib $dir/../proj/tb_daq_data_path/msim/xpm
vmap xpm $dir/../proj/tb_daq_data_path/msim/xpm

vlib $dir/../proj/tb_daq_data_path/work
vmap work $dir/../proj/tb_daq_data_path/work

vlib $dir/../proj/tb_daq_data_path/daq_core
vmap daq_core $dir/../proj/tb_daq_data_path/daq_core

vcom -2008 -work shared_lib $dir/../../../shared/types/common_ieee_pkg.vhd
vcom -2008 -work shared_lib $dir/../../../dataformats/l0mdt_constants_pkg.vhd
vcom -2008 -work shared_lib $dir/../../../dataformats/l0mdt_dataformats_pkg.vhd
vcom -2008 -work shared_lib $dir/../../../shared/types/common_constants_pkg.vhd;
vcom -2008 -work shared_lib $dir/../../../shared/types/common_types_pkg.vhd;     

vcom -2008 -work daq_core $dir/../daq-lxa-core/autogen/yml2hdl.vhd
vcom -2008 -work daq_core $dir/../daq-lxa-core/autogen/daq_v3.vhd
vcom -2008 -work daq_core $dir/../daq-lxa-core/pkg/daq_defs.vhd
vcom -2008 -work daq_core $dir/../daq-lxa-core/pkg/daq_version.vhd

vcom -work xpm /opt/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd
vlog -work xpm /opt/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv
vlog -work xpm /opt/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv

vcom -2008 -work daq_core $dir/../daq-lxa-core/src/daq_xpm_fifo.vhd
vcom -2008 -work daq_core $dir/../daq-lxa-core/src/daq_fifo.vhd
vcom -2008 -work daq_core $dir/../daq-lxa-core/src/daq_head_node.vhd
vcom -2008 -work daq_core $dir/../daq-lxa-core/src/daq_data_node.vhd
vcom -2008 -work daq_core $dir/../daq-lxa-core/src/daq_bus_conv.vhd
vcom -2008 -work daq_core $dir/../daq-lxa-core/src/daq_wme_mux.vhd
vcom -2008 -work daq_core $dir/../daq-lxa-core/src/daq_win_matching.vhd
vcom -2008 -work daq_core $dir/../daq-lxa-core/src/daq_ptr_handler.vhd
vcom -2008 -work daq_core $dir/../daq-lxa-core/src/daq_fifo.vhd
vcom -2008 -work daq_core $dir/../daq-lxa-core/src/daq_packet_builder.vhd
vcom -2008 -work daq_core $dir/../daq-lxa-core/src/daq_algo.vhd
vcom -2008 -work daq_core $dir/../daq-lxa-core/src/daq_req.vhd

vcom -2008 -work daq_lib $dir/../daq_fifo.vhd
vcom -2008 -work daq_lib $dir/../daq_fifo_pipeline.vhd
vcom -2008 -work daq_lib $dir/../daq_station.vhd

# vlog -sv $dir/../tb/tb_daq_station.sv
vcom -2008 $dir/../tb/tb_daq_station.vhd

vsim -t ns -voptargs=+acc tb_daq_station
# vsim -t ns tb

add wave -group top *
add wave -group station sim:/tb_daq_station/u_daq_station/*
add wave -group fifo_pipeline0 sim:/tb_daq_station/u_daq_station/gen_daq_chamber_fifos(0)/G0/u_daq_fifo_pipeline/*
add wave -group fifo_pipeline2 sim:/tb_daq_station/u_daq_station/gen_daq_chamber_fifos(2)/G0/u_daq_fifo_pipeline/*
add wave -group chamber_fifo0 sim:/tb_daq_station/u_daq_station/gen_daq_chamber_fifos(0)/G0/u_daq_fifo_pipeline/u_chamber_fifo/*
add wave -group chamber_fifo1 sim:/tb_daq_station/u_daq_station/gen_daq_chamber_fifos(1)/G0/u_daq_fifo_pipeline/u_chamber_fifo/*
add wave -group chamber_fifo2 sim:/tb_daq_station/u_daq_station/gen_daq_chamber_fifos(2)/G0/u_daq_fifo_pipeline/u_chamber_fifo/*
add wave -group daq_algo sim:/tb_daq_station/u_daq_station/u_daq/*


# run 10us

