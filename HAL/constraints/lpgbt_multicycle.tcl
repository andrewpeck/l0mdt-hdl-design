# -*- mode: vivado -*-
# Multicycle constraints: ease the timing constraints
# Uplink constraints: Values depend on the c_multicyleDelay. Shall be the same one for setup time and -1 for the hold time
# retiming changes register names and prevents multicycle path setting on the lpgbt cores

# valid output is high fanout
# force its replication early
set_property -quiet MAX_FANOUT 25 \
    [get_cells -quiet -hierarchical -filter {NAME =~ *lpgbtlatch.uplink_data_o_reg[0][valid]*}]

# Prevent these reset registers from getting merged across different LPGBT instances...
# they are high fanout and it caused timing to fail early on
set cells [get_cells -quiet -hierarchical -filter {NAME =~ *lpgbtfpga*/gearboxSyncReset*}]
set_property -quiet KEEP true $cells
set_property -quiet MAX_FANOUT 100 $cells

set cells [get_cells -quiet -hierarchical -filter {NAME =~ *sta_gbRdy_o_reg*}]
set_property -quiet KEEP true $cells
set_property -quiet MAX_FANOUT 100 $cells

proc set_lpgbt_multicycles {root_path} {


    set link_wrapper_cell [get_cells -quiet "${root_path}"]
    if {[string is space $link_wrapper_cell] == 0} {
        set_property -quiet BLOCK_SYNTH.RETIMING false  $link_wrapper_cell
    }

    puts "Setting LPGBT Uplink Pipeline Multicycle Path"

    set pipeline_s_reg_cells [get_cells -quiet "${root_path}/*uplink*/*frame_pipelined_s_reg[*]"]
    if {[string is space $pipeline_s_reg_cells] == 0} {
        set_property -quiet KEEP true $pipeline_s_reg_cells
    }

    set pipeline_s_reg [get_pins -quiet "${root_path}/*uplink*/frame_pipelined_s_reg[*]/C"]
    if {[string is space $pipeline_s_reg] == 0} {
        set_multicycle_path 4 -from $pipeline_s_reg -setup
        set_multicycle_path 3 -from $pipeline_s_reg -hold
    }

    puts "Setting LPGBT Uplink Descrambler Multicycle Path"
    set descrambled_d_reg_cells [get_cells -quiet "${root_path}/*uplink*/*descrambler*/*descrambler*/descrambledData_reg*"]
    if {[string is space $descrambled_d_reg_cells] == 0} {
        set_property -quiet KEEP true $descrambled_d_reg_cells
    }

    set descrambled_d_reg [get_pins -quiet "${root_path}/*uplink*/*descrambler*/*descrambler*/descrambledData_reg*/C"]
    if {[string is space $descrambled_d_reg] == 0} {
        set_multicycle_path 4 -from $descrambled_d_reg -setup
        set_multicycle_path 3 -from $descrambled_d_reg -hold
    }

    # Downlink constraints: Values depend on the c_multicyleDelay. Shall be the same one for setup time and -1 for the hold time
    puts "Setting LPGBT Downlink Scrambler Multicycle Path"
    set scrambled_d_reg_cells [get_cells -quiet "${root_path}/*downlink_inst*/*_scramble*/scrambledData*"]
    if {[string is space $scrambled_d_reg_cells] == 0} {
        set_property -quiet KEEP true $scrambled_d_reg_cells
    }

    set scrambled_d_reg [get_pins -quiet "${root_path}/*downlink_inst*/*_scramble*/scrambledData*/D"]
    if {[string is space $scrambled_d_reg] == 0} {
        set_multicycle_path 4 -setup -to $scrambled_d_reg
        set_multicycle_path 3 -hold -to $scrambled_d_reg
    }
}

set_lpgbt_multicycles "top_hal/*csm_gen*/lpgbt_links_inst"
set_lpgbt_multicycles "top_hal/felix_decoder_inst"

# constrain asynchronous reset/clear
set_max_delay 3.1 \
    -from [get_pins {top_hal/csm_gen*.csm_ifgen.mgt_tag*.csm_inst/lpgbt_links_inst/uplink_gen*.uplink_inst/rxgearbox_10g_gen.rxGearbox_10g24_inst/gbReset*/C}] \
    -to   [get_pins {top_hal/csm_gen*.csm_ifgen.mgt_tag*.csm_inst/lpgbt_links_inst/uplink_gen*.uplink_inst/rxgearbox_10g_gen.rxGearbox_10g24_inst/reg*/CLR}]

# TODO: remove this once felix is replaced with 8b10b version
# set felix_tx_path [get_pins top_hal/felix_tx_inst/*/*/*/*/scrambledData_reg[*]/C]
# set_multicycle_path 4 -from $felix_tx_path -setup
# set_multicycle_path 3 -from $felix_tx_path -hold
