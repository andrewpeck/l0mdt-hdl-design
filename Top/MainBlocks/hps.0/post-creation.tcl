
set_property -name {riviera.compile.vhdl_relax} -value {true} -objects [get_filesets project_lib_sim]
set_property -name {riviera.compile.vhdl_syntax} -value {2008} -objects [get_filesets project_lib_sim]

set_property generic FLAVOUR=0 [current_fileset]