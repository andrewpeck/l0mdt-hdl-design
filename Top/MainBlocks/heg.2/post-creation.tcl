set_property AUTO_INCREMENTAL_CHECKPOINT 1 [get_runs impl_1]
set_property AUTO_INCREMENTAL_CHECKPOINT 1 [get_runs synth_1]
set_property -name {riviera.compile.vhdl_relax} -value {true} -objects [get_filesets project_lib_sim]
set_property -name {riviera.compile.vhdl_syntax} -value {2008} -objects [get_filesets project_lib_sim]

set_property generic FLAVOUR=2 [current_fileset]