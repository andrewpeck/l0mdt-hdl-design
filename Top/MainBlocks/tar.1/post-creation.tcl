# set_property AUTO_INCREMENTAL_CHECKPOINT 1 [get_runs impl_1]
# set_property AUTO_INCREMENTAL_CHECKPOINT 1 [get_runs synth_1]
# set_property -name {riviera.compile.vhdl_relax} -value {true} -objects [get_filesets project_lib_sim]
# set_property -name {riviera.compile.vhdl_syntax} -value {2008} -objects [get_filesets project_lib_sim]
current_fileset -simset [ get_filesets project_lib_sim ]
# set generic_string "g_STATION=32h1"
# set_property generic {g_ST_ENABLE=4'h2} [current_fileset]
# puts "----------------------- HOLA ------------------------"