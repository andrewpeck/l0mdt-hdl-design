
vcom -work ctrl_lib ../../ctrl/src/axi/types.vhd 
vcom -work ctrl_lib ../../ctrl/src/axi/axiRegPkg.vhd 
vcom -work ctrl_lib ../../ctrl/src/axi/axiReg.vhd 
vcom -work ctrl_lib ../../ctrl/src/axi/axi_bram_ctrl_v4_1_rfs.vhd 
vcom -work ctrl_lib ../../ctrl/src/axi/axi_bram_controller.vhd 

vcom -work ctrl_lib ../../ctrl/src/MTC/MTC_PKG.vhd
vcom -work ctrl_lib ../../ctrl/src/MTC/MTC_map.vhd




vcom -work shared_lib ../../shared/types/types010/common_ieee_pkg.vhd
vcom -work shared_lib ../../shared/types/types010/l0mdt_constants_pkg.vhd
vcom -work shared_lib ../../shared/types/types010/l0mdt_dataformats_pkg.vhd
vcom -work shared_lib ../../shared/types/types010/common_constants_pkg.vhd
vcom -work shared_lib ../../shared/types/types010/common_types_pkg.vhd

vcom -work shared_lib ../../shared/functions/some_functions_pkg.vhd 
vcom -work shared_lib ../../shared/config/config_defaults_pkg.vhd
# vcom -work shared_lib ../../shared/config/detector_param_pkg.vhd 
vcom -work project_lib  ../../Top/mtc_builder/prj_cfg.vhd
vcom -work shared_lib ../../shared/config/config_pkg.vhd 


vcom -work shared_lib ../../shared/src/pipeline.vhd

#vlog -work work ../../dataformats/l0mdt_buses_constants.svh
vlog -work work +incdir+../../dataformats ../src/format_mtc_pkt.sv
vlog -work work +incdir+../../dataformats ../src/mtc_builder_verilog.sv
vcom -work work ../src/ult_mtc.vhd
