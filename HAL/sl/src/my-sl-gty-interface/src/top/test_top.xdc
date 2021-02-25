set_property PACKAGE_PIN K23         [get_ports "SYSCLK_300_N"] ;# Bank  66 VCCO - VCC1V2   - IO_L11N_T1U_N9_GC_66
set_property IOSTANDARD  DIFF_SSTL12 [get_ports "SYSCLK_300_N"] ;# Bank  66 VCCO - VCC1V2   - IO_L11N_T1U_N9_GC_66
set_property PACKAGE_PIN K22         [get_ports "SYSCLK_300_P"] ;# Bank  66 VCCO - VCC1V2   - IO_L11P_T1U_N8_GC_66
set_property IOSTANDARD  DIFF_SSTL12 [get_ports "SYSCLK_300_P"] ;# Bank  66 VCCO - VCC1V2   - IO_L11P_T1U_N8_GC_66

set_property PACKAGE_PIN F12       [get_ports "CLK_125_N"] ;# Bank  87 VCCO - VCC3V3   - IO_L5N_HDGC_87
set_property IOSTANDARD  LVDS_25   [get_ports "CLK_125_N"] ;# Bank  87 VCCO - VCC3V3   - IO_L5N_HDGC_87
set_property PACKAGE_PIN G12       [get_ports "CLK_125_P"] ;# Bank  87 VCCO - VCC3V3   - IO_L5P_HDGC_87
set_property IOSTANDARD  LVDS_25   [get_ports "CLK_125_P"] ;# Bank  87 VCCO - VCC3V3   - IO_L5P_HDGC_87

set_property PACKAGE_PIN R23       [get_ports "SFP_REC_CLOCK_N"] ;# Bank  65 VCCO - VCC1V8   - IO_L19N_T3L_N1_DBC_AD9N_D11_65
set_property IOSTANDARD  LVDS      [get_ports "SFP_REC_CLOCK_N"] ;# Bank  65 VCCO - VCC1V8   - IO_L19N_T3L_N1_DBC_AD9N_D11_65
set_property PACKAGE_PIN R22       [get_ports "SFP_REC_CLOCK_P"] ;# Bank  65 VCCO - VCC1V8   - IO_L19P_T3L_N0_DBC_AD9P_D10_65
set_property IOSTANDARD  LVDS      [get_ports "SFP_REC_CLOCK_P"] ;# Bank  65 VCCO - VCC1V8   - IO_L19P_T3L_N0_DBC_AD9P_D10_65

set_property PACKAGE_PIN C9        [get_ports "GPIO_LED_0"] ;# Bank  86 VCCO - VCC3V3   - IO_L9N_AD3N_86
set_property IOSTANDARD  LVCMOS33  [get_ports "GPIO_LED_0"] ;# Bank  86 VCCO - VCC3V3   - IO_L9N_AD3N_86
set_property PACKAGE_PIN D9        [get_ports "GPIO_LED_1"] ;# Bank  86 VCCO - VCC3V3   - IO_L9P_AD3P_86
set_property IOSTANDARD  LVCMOS33  [get_ports "GPIO_LED_1"] ;# Bank  86 VCCO - VCC3V3   - IO_L9P_AD3P_86
set_property PACKAGE_PIN E10       [get_ports "GPIO_LED_2"] ;# Bank  86 VCCO - VCC3V3   - IO_L7N_HDGC_AD5N_86
set_property IOSTANDARD  LVCMOS33  [get_ports "GPIO_LED_2"] ;# Bank  86 VCCO - VCC3V3   - IO_L7N_HDGC_AD5N_86
set_property PACKAGE_PIN E11       [get_ports "GPIO_LED_3"] ;# Bank  86 VCCO - VCC3V3   - IO_L7P_HDGC_AD5P_86
set_property IOSTANDARD  LVCMOS33  [get_ports "GPIO_LED_3"] ;# Bank  86 VCCO - VCC3V3   - IO_L7P_HDGC_AD5P_86
set_property PACKAGE_PIN F9        [get_ports "GPIO_LED_4"] ;# Bank  86 VCCO - VCC3V3   - IO_L6N_HDGC_AD6N_86
set_property IOSTANDARD  LVCMOS33  [get_ports "GPIO_LED_4"] ;# Bank  86 VCCO - VCC3V3   - IO_L6N_HDGC_AD6N_86
set_property PACKAGE_PIN F10       [get_ports "GPIO_LED_5"] ;# Bank  86 VCCO - VCC3V3   - IO_L6P_HDGC_AD6P_86
set_property IOSTANDARD  LVCMOS33  [get_ports "GPIO_LED_5"] ;# Bank  86 VCCO - VCC3V3   - IO_L6P_HDGC_AD6P_86
set_property PACKAGE_PIN G9        [get_ports "GPIO_LED_6"] ;# Bank  86 VCCO - VCC3V3   - IO_L5N_HDGC_AD7N_86
set_property IOSTANDARD  LVCMOS33  [get_ports "GPIO_LED_6"] ;# Bank  86 VCCO - VCC3V3   - IO_L5N_HDGC_AD7N_86
set_property PACKAGE_PIN G10       [get_ports "GPIO_LED_7"] ;# Bank  86 VCCO - VCC3V3   - IO_L5P_HDGC_AD7P_86
set_property IOSTANDARD  LVCMOS33  [get_ports "GPIO_LED_7"] ;# Bank  86 VCCO - VCC3V3   - IO_L5P_HDGC_AD7P_86

set_property PACKAGE_PIN C11       [get_ports "GPIO_SW_S"] ;# Bank  86 VCCO - VCC3V3   - IO_L12P_AD0P_86
set_property IOSTANDARD  LVCMOS33  [get_ports "GPIO_SW_S"] ;# Bank  86 VCCO - VCC3V3   - IO_L12P_AD0P_86
set_property PACKAGE_PIN A10       [get_ports "GPIO_SW_N"] ;# Bank  86 VCCO - VCC3V3   - IO_L11N_AD1N_86
set_property IOSTANDARD  LVCMOS33  [get_ports "GPIO_SW_N"] ;# Bank  86 VCCO - VCC3V3   - IO_L11N_AD1N_86



# Location constraints for differential reference clock buffers
# Note: the IP core-level XDC constrains the transceiver channel data pin locations
# ----------------------------------------------------------------------------------------------------------------------
set_property package_pin P6 [get_ports mgtrefclk0_x0y2_n]
set_property package_pin P7 [get_ports mgtrefclk0_x0y2_p]


# Channel primitive location constraint
set_property LOC GTYE4_CHANNEL_X0Y8 [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[2].*gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST}]

# Channel primitive serial data pin location constraints
# (Provided as comments for your reference. The channel primitive location constraint is sufficient.)
#set_property package_pin M1 [get_ports gtyrxn_in[0]]
#set_property package_pin M2 [get_ports gtyrxp_in[0]]
#set_property package_pin N4 [get_ports gtytxn_out[0]]
#set_property package_pin N5 [get_ports gtytxp_out[0]]
set_false_path -through [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[0].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet
set_case_analysis 1     [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[0].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet

# Commands for enabled transceiver GTYE4_CHANNEL_X0Y9
# ----------------------------------------------------------------------------------------------------------------------

# Channel primitive location constraint
set_property LOC GTYE4_CHANNEL_X0Y9 [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[2].*gen_gtye4_channel_inst[1].GTYE4_CHANNEL_PRIM_INST}]

# Channel primitive serial data pin location constraints
# (Provided as comments for your reference. The channel primitive location constraint is sufficient.)
#set_property package_pin K1 [get_ports gtyrxn_in[1]]
#set_property package_pin K2 [get_ports gtyrxp_in[1]]
#set_property package_pin L4 [get_ports gtytxn_out[1]]
#set_property package_pin L5 [get_ports gtytxp_out[1]]
set_false_path -through [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[1].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet
set_case_analysis 1     [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[1].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet

# Commands for enabled transceiver GTYE4_CHANNEL_X0Y10
# ----------------------------------------------------------------------------------------------------------------------

# Channel primitive location constraint
set_property LOC GTYE4_CHANNEL_X0Y10 [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[2].*gen_gtye4_channel_inst[2].GTYE4_CHANNEL_PRIM_INST}]

# Channel primitive serial data pin location constraints
# (Provided as comments for your reference. The channel primitive location constraint is sufficient.)
#set_property package_pin H1 [get_ports gtyrxn_in[2]]
#set_property package_pin H2 [get_ports gtyrxp_in[2]]
#set_property package_pin J4 [get_ports gtytxn_out[2]]
#set_property package_pin J5 [get_ports gtytxp_out[2]]
set_false_path -through [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[2].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet
set_case_analysis 1     [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[2].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet

# Commands for enabled transceiver GTYE4_CHANNEL_X0Y11
# ----------------------------------------------------------------------------------------------------------------------

# Channel primitive location constraint
set_property LOC GTYE4_CHANNEL_X0Y11 [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[2].*gen_gtye4_channel_inst[3].GTYE4_CHANNEL_PRIM_INST}]

# Channel primitive serial data pin location constraints
# (Provided as comments for your reference. The channel primitive location constraint is sufficient.)
#set_property package_pin F1 [get_ports gtyrxn_in[3]]
#set_property package_pin F2 [get_ports gtyrxp_in[3]]
#set_property package_pin G4 [get_ports gtytxn_out[3]]
#set_property package_pin G5 [get_ports gtytxp_out[3]]
set_false_path -through [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[3].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet
set_case_analysis 1     [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[3].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet

# Clock constraints for clocks provided as inputs to the core
# Note: the IP core-level XDC constrains clocks produced by the core, which drive user clocks via helper blocks
# ----------------------------------------------------------------------------------------------------------------------
create_clock -name clk_125 -period 8.0 [get_ports CLK_125_P]
create_clock -name clk_mgtrefclk0_x0y2_p -period 6.25 [get_ports mgtrefclk0_x0y2_p]
create_clock -name clk_300 -period 3.333 [get_ports SYSCLK_300_P]

# False path constraints
# ----------------------------------------------------------------------------------------------------------------------
set_false_path -to [get_cells -hierarchical -filter {NAME =~ *bit_synchronizer*inst/i_in_meta_reg}]
##set_false_path -to [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_*_reg}]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*D} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_meta*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_meta*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync1*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync2*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync3*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_out*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_meta*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync1*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync2*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync3*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_out*}]]


set_false_path -to [get_cells -hierarchical -filter {NAME =~ *gtwiz_userclk_tx_inst/*gtwiz_userclk_tx_active_*_reg}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ *gtwiz_userclk_rx_inst/*gtwiz_userclk_rx_active_*_reg}]
