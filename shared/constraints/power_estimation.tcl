set_load 0 [all_outputs]

# LFM is equivalent to CFM divided by the cross‐sectional area of interest
# Comtel shelf ~188 CFM
set_operating_conditions  \
    -ambient_temp 26.0 \
    -thetaja auto \
    -thetasa auto \
    -thetajb 5.769 \
    -board_temp 27.0 \
    -airflow 500 \
    -board_layers 16+ \
    -board custom \
    -heatsink low \
    -process typical

set_operating_conditions -voltage {vccint     0.85}; # 0.85V
set_operating_conditions -voltage {vccint_io  0.85}; # 0.85V
set_operating_conditions -voltage {vccbram    0.85}; # 0.85V
set_operating_conditions -voltage {vccaux     1.80}; # 1.80V
set_operating_conditions -voltage {vccaux_io  1.80}; # 1.80V
set_operating_conditions -voltage {vcco33     3.30}
set_operating_conditions -voltage {vcco25     2.50}
set_operating_conditions -voltage {vcco18     1.80}
set_operating_conditions -voltage {vcco15     1.50}
set_operating_conditions -voltage {vcco135    1.35}
set_operating_conditions -voltage {vcco12     1.20}
set_operating_conditions -voltage {vcco10     1.00}
set_operating_conditions -voltage {vccadc     1.80}; # 1.80V
set_operating_conditions -voltage {mgtavcc    0.90}; # 0.90V
set_operating_conditions -voltage {mgtavtt    1.20}; # 1.20V
set_operating_conditions -voltage {mgtvccaux  1.80}; # 1.80V
set_operating_conditions -voltage {mgtyavcc   0.90}; # 1.80V
set_operating_conditions -voltage {mgtyavtt   1.20}
set_operating_conditions -voltage {mgtyvccaux 1.80}

# set a default switching rate for signals
set_switching_activity -default_toggle_rate 25

# keep some resets low and enables high, results from Tools --> Power Constraints Advisor

# ult resets
set_switching_activity -toggle_rate 0.000000 -static_probability 0.000000 [get_nets -hierarchical -filter "NAME =~ ult_inst/*rst*"]
set_switching_activity -toggle_rate 0.000000 -static_probability 0.000000 [get_nets -hierarchical -filter "NAME =~ ult_inst/*reset*"]

# ult
set_switching_activity -toggle_rate 0.000000 -static_probability 1.000000 [get_nets -hierarchical -filter "NAME =~ ult_inst/*_en_reg*"]

set_switching_activity -toggle_rate 0.000000 -static_probability 0.000000 [get_nets "top_hal/csm_gen[*].csm_ifgen.mgt_tag[*].csm_inst/lpgbt_links_inst/uplink_gen[*].uplink_inst/rxgearbox_10g_gen.rxGearbox_10g24_inst/gbReset_s"]
set_switching_activity -toggle_rate 0.000000 -static_probability 0.000000 [get_nets "top_hal/felix_decoder_inst/felix_10_gbps_rx_inst/rxgearbox_10g_gen.rxGearbox_10g24_inst/gbReset_s"]
set_switching_activity -toggle_rate 0.000000 -static_probability 0.000000 [get_nets "top_hal/top_clocking_inst/hal_ctrl_reg[CSM][CSM][*][SC][MASTER][RX_RESET][*]"]
set_switching_activity -toggle_rate 0.000000 -static_probability 1.000000 [get_nets "top_hal/csm_gen[*].csm_ifgen.mgt_tag[*].csm_inst/lpgbt_links_inst/uplink_data_o[*][valid]"]
set_switching_activity -toggle_rate 0.000000 -static_probability 1.000000 [get_nets "top_hal/csm_gen[*].csm_ifgen.mgt_tag[*].csm_inst/lpgbt_links_inst/uplink_gen[*].uplink_inst/rxgearbox_10g_gen.rxGearbox_10g24_inst/clk_dataFlag_o"]
set_switching_activity -toggle_rate 0.000000 -static_probability 1.000000 [get_nets "top_hal/csm_gen[*].csm_ifgen.mgt_tag[*].csm_inst/lpgbt_links_inst/uplink_gen[*].uplink_inst/rxgearbox_10g_gen.rxGearbox_10g24_inst/sta_gbRdy_s"]
set_switching_activity -toggle_rate 0.000000 -static_probability 1.000000 [get_nets "top_hal/csm_gen[*].csm_ifgen.mgt_tag[*].csm_inst/lpgbt_links_inst/uplink_gen[*].uplink_inst/uplinkClkOutEn_o"]
