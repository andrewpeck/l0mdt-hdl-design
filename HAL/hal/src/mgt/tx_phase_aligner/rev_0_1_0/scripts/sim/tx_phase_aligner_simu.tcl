restart

# Close if any window is opened
#close_wave_config

# Init simulation with waves to be observed
#open_wave_config {./../tx_phase_aligner_simu.wcfg}

# Force Initial VIO values for simulation
add_force gtwizard_ultrascale_0_example_top_sim/example_top_inst/hb_gtwiz_reset_all_vio_int                 0 0;       # VIO_0
add_force gtwizard_ultrascale_0_example_top_sim/example_top_inst/hb0_gtwiz_reset_tx_pll_and_datapath_int    0 0;       # VIO_1
add_force gtwizard_ultrascale_0_example_top_sim/example_top_inst/hb0_gtwiz_reset_tx_datapath_int            0 0;       # VIO_2
add_force gtwizard_ultrascale_0_example_top_sim/example_top_inst/hb_gtwiz_reset_rx_pll_and_datapath_vio_int 0 0;       # VIO_3
add_force gtwizard_ultrascale_0_example_top_sim/example_top_inst/hb_gtwiz_reset_rx_datapath_vio_int         0 0;       # VIO_4  
add_force gtwizard_ultrascale_0_example_top_sim/example_top_inst/link_down_latched_reset_vio_int            0 0;       # VIO_5    
add_force gtwizard_ultrascale_0_example_top_sim/example_top_inst/rxcdrreset_int                             0 0;       # VIO_6
add_force -radix bin gtwizard_ultrascale_0_example_top_sim/example_top_inst/loopback_int                    000  0;    # VIO_7
add_force -radix bin gtwizard_ultrascale_0_example_top_sim/example_top_inst/txprbssel_vio_async             0000 0;    # VIO_8
add_force -radix bin gtwizard_ultrascale_0_example_top_sim/example_top_inst/rxprbssel_vio_async             0000 0;    # VIO_9
add_force gtwizard_ultrascale_0_example_top_sim/example_top_inst/txprbsforceerr_vio_async                   0 0;       # VIO_10
add_force gtwizard_ultrascale_0_example_top_sim/example_top_inst/rxprbscntreset_vio_async                   0 0;       # VIO_11
add_force gtwizard_ultrascale_0_example_top_sim/example_top_inst/tx_ui_align_calib                          0 0;       # VIO_12
add_force gtwizard_ultrascale_0_example_top_sim/example_top_inst/tx_fine_realign                            0 0;       # VIO_13
add_force -radix bin gtwizard_ultrascale_0_example_top_sim/example_top_inst/tx_pi_phase_calib               0000000 0; # VIO_14
add_force -radix hex gtwizard_ultrascale_0_example_top_sim/example_top_inst/tx_fifo_fill_pd_max             00000400 0 ; # VIO_15
add_force gtwizard_ultrascale_0_example_top_sim/example_top_inst/tx_data_sel_vio_async                      0 0;       # VIO_16

# --------------------------------- Fine alignment ---------------------------------
puts "==> Running iteration 0 (fine alignment)"

# Wait for Tx to be aligned
run 1000 ns
set tx_aligned [get_value -radix bin /gtwizard_ultrascale_0_example_top_sim/example_top_inst/tx_phase_aligner_inst/tx_aligned_o]
while {!$tx_aligned} {
  run 1000 ns
  set tx_aligned [get_value -radix bin /gtwizard_ultrascale_0_example_top_sim/example_top_inst/tx_phase_aligner_inst/tx_aligned_o]
}
puts ">> Tx aligned (fine alignment)"

# Wait for the receiver to be locked
set rx_locked_out 0
while {!$rx_locked_out} {
  run 1000 ns
  set rx_locked_out [get_value -radix bin /gtwizard_ultrascale_0_example_top_sim/example_top_inst/rx_locked_out]
}
puts ">> Link locked (Tx -> Rx)"

# Get Tx PI phase in case and run a UI align
set tx_pi_phase_calib [get_value -radix bin /gtwizard_ultrascale_0_example_top_sim/example_top_inst/tx_phase_aligner_inst/tx_pi_phase_o]

# Run a bit longer just to make it easier to identify simulation
run 10000 ns

# ---------------------- UI alignment config (with enabled reset)  ---------------------- 
add_force gtwizard_ultrascale_0_example_top_sim/example_top_inst/tx_ui_align_calib                          1 0;       # VIO_12
add_force -radix bin gtwizard_ultrascale_0_example_top_sim/example_top_inst/tx_pi_phase_calib               $tx_pi_phase_calib 0; # VIO_14

# Force a reset
add_force hb_gtwiz_reset_all 1 0
run 1000 ns
add_force hb_gtwiz_reset_all 0 0
run 1000 ns

# Wait for Tx to be aligned
run 1000 ns
set tx_aligned [get_value -radix bin /gtwizard_ultrascale_0_example_top_sim/example_top_inst/tx_phase_aligner_inst/tx_aligned_o]
while {!$tx_aligned} {
  run 1000 ns
  set tx_aligned [get_value -radix bin /gtwizard_ultrascale_0_example_top_sim/example_top_inst/tx_phase_aligner_inst/tx_aligned_o]
}
puts ">> Tx aligned (UI alignment)"

# Wait for the receiver to be locked
set rx_locked_out 0
while {!$rx_locked_out} {
  run 1000 ns
  set rx_locked_out [get_value -radix bin /gtwizard_ultrascale_0_example_top_sim/example_top_inst/rx_locked_out]
}
puts ">> Link locked (Tx -> Rx)"

# Run a bit longer just to make it easier to identify simulation
run 10000 ns
