
vcom -work ctrl_lib ../../../ctrl/src/axi/types.vhd 
vcom -work ctrl_lib ../../../ctrl/src/axi/axiRegPkg.vhd 
vcom -work ctrl_lib ../../../ctrl/src/axi/axiReg.vhd 


vcom -work ctrl_lib ../../../ctrl/src/MTC/MTC_PKG.vhd
vcom -work ctrl_lib ../../../ctrl/src/MTC/MTC_map.vhd




vcom -work shared_lib ../../../shared/types/common_ieee_pkg.vhd
vcom -work shared_lib ../../../shared/types/l0mdt_constants_pkg.vhd
vcom -work shared_lib ../../../shared/types/l0mdt_dataformats_pkg.vhd
vcom -work shared_lib ../../../shared/types/common_constants_pkg.vhd
vcom -work shared_lib ../../../shared/types/common_types_pkg.vhd

vcom -work shared_lib ../../../shared/functions/some_functions_pkg.vhd 
vcom -work shared_lib ../../../shared/config/config_defaults_pkg.vhd
vcom -work shared_lib ../../../shared/config/detector_param_pkg.vhd 
vcom -work project_lib  ../../../Top/mtc_builder/prj_cfg.vhd
vcom -work shared_lib ../../../shared/config/config_pkg.vhd 


vcom -work shared_lib ../../../shared/src/pipeline.vhd



