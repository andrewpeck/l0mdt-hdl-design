# TO CHECK!
# create_clock -period 3.125 -name refclk_felix_rx [get_ports tc_clk_i_p]; # Bank 120 -- felix rx
# set_property PACKAGE_PIN BD39 [get_ports tc_clk_i_p]
# set_property PACKAGE_PIN BD40 [get_ports tc_clk_i_n]

set_property PACKAGE_PIN BF18 [get_ports c2cb_rxp]
set_property PACKAGE_PIN BF17 [get_ports c2cb_rxn]
set_property PACKAGE_PIN BF13 [get_ports c2cb_txp]
set_property PACKAGE_PIN BF12 [get_ports c2cb_txn]

set_property PACKAGE_PIN BG20 [get_ports c2c_rxp]
set_property PACKAGE_PIN BG19 [get_ports c2c_rxn]
set_property PACKAGE_PIN BH13 [get_ports c2c_txp]
set_property PACKAGE_PIN BH12 [get_ports c2c_txn]


# SLR0 Left
# Bank 120; tclink
set_property PACKAGE_PIN BD40 [get_ports {refclk_i_n[0]}]
set_property PACKAGE_PIN BD39 [get_ports {refclk_i_p[0]}]
create_clock -period 3.125 -name refclk0 [get_ports {refclk_i_p[0]}]
# Bank 121: SL
set_property PACKAGE_PIN BB40 [get_ports {refclk_i_n[1]}]
set_property PACKAGE_PIN BB39 [get_ports {refclk_i_p[1]}]
create_clock -period 4.166 -name refclk1 [get_ports {refclk_i_p[1]}]
# Bank 122: SL
set_property PACKAGE_PIN AY40 [get_ports {refclk_i_n[2]}]
set_property PACKAGE_PIN AY39 [get_ports {refclk_i_p[2]}]
create_clock -period 4.166 -name refclk2 [get_ports {refclk_i_p[2]}]
# Bank 123: SL
set_property PACKAGE_PIN AV40 [get_ports {refclk_i_n[3]}]
set_property PACKAGE_PIN AV39 [get_ports {refclk_i_p[3]}]
create_clock -period 4.166 -name refclk3 [get_ports {refclk_i_p[3]}]

# SLR0 Right
# Bank 220 - C2C
set_property PACKAGE_PIN BD12 [get_ports {refclk_i_n[4]}]
set_property PACKAGE_PIN BD13 [get_ports {refclk_i_p[4]}]
create_clock -period 5.000 -name refclk4 [get_ports {refclk_i_p[4]}]
# Bank 221
set_property PACKAGE_PIN BB12 [get_ports {refclk_i_n[5]}]
set_property PACKAGE_PIN BB13 [get_ports {refclk_i_p[5]}]
create_clock -period 3.125 -name refclk5 [get_ports {refclk_i_p[5]}]
# Bank 222
set_property PACKAGE_PIN AY12 [get_ports {refclk_i_n[6]}]
set_property PACKAGE_PIN AY13 [get_ports {refclk_i_p[6]}]
create_clock -period 3.125 -name refclk6 [get_ports {refclk_i_p[6]}]
# Bank 223
set_property PACKAGE_PIN AV12 [get_ports {refclk_i_n[7]}]
set_property PACKAGE_PIN AV13 [get_ports {refclk_i_p[7]}]
create_clock -period 3.125 -name refclk7 [get_ports {refclk_i_p[7]}]

# SLR1 Left
# Bank 124
set_property PACKAGE_PIN AT40 [get_ports {refclk_i_n[8]}]
set_property PACKAGE_PIN AT39 [get_ports {refclk_i_p[8]}]
create_clock -period 3.125 -name refclk8 [get_ports {refclk_i_p[8]}]
# Bank 125
set_property PACKAGE_PIN AP40 [get_ports {refclk_i_n[9]}]
set_property PACKAGE_PIN AP39 [get_ports {refclk_i_p[9]}]
create_clock -period 3.125 -name refclk9 [get_ports {refclk_i_p[9]}]
# Bank 126
set_property PACKAGE_PIN AM40 [get_ports {refclk_i_n[10]}]
set_property PACKAGE_PIN AM39 [get_ports {refclk_i_p[10]}]
create_clock -period 3.125 -name refclk10 [get_ports {refclk_i_p[10]}]
# Bank 127
set_property PACKAGE_PIN AJ42 [get_ports {refclk_i_n[11]}]
set_property PACKAGE_PIN AJ41 [get_ports {refclk_i_p[11]}]
create_clock -period 3.125 -name refclk11 [get_ports {refclk_i_p[11]}]

# SLR1 Right
# Bank 224
set_property PACKAGE_PIN AT12 [get_ports {refclk_i_n[12]}]
set_property PACKAGE_PIN AT13 [get_ports {refclk_i_p[12]}]
create_clock -period 3.125 -name refclk12 [get_ports {refclk_i_p[12]}]
# Bank 225
set_property PACKAGE_PIN AP12 [get_ports {refclk_i_n[13]}]
set_property PACKAGE_PIN AP13 [get_ports {refclk_i_p[13]}]
create_clock -period 3.125 -name refclk13 [get_ports {refclk_i_p[13]}]
# Bank 226
set_property PACKAGE_PIN AM12 [get_ports {refclk_i_n[14]}]
set_property PACKAGE_PIN AM13 [get_ports {refclk_i_p[14]}]
create_clock -period 3.125 -name refclk14 [get_ports {refclk_i_p[14]}]
# Bank 227
set_property PACKAGE_PIN AJ10 [get_ports {refclk_i_n[15]}]
set_property PACKAGE_PIN AJ11 [get_ports {refclk_i_p[15]}]
create_clock -period 3.125 -name refclk15 [get_ports {refclk_i_p[15]}]

# SLR2 Left
# Bank 128
set_property PACKAGE_PIN AE42 [get_ports {refclk_i_n[16]}]
set_property PACKAGE_PIN AE41 [get_ports {refclk_i_p[16]}]
create_clock -period 3.125 -name refclk16 [get_ports {refclk_i_p[16]}]
# Bank 129
set_property PACKAGE_PIN AA42 [get_ports {refclk_i_n[17]}]
set_property PACKAGE_PIN AA41 [get_ports {refclk_i_p[17]}]
create_clock -period 3.125 -name refclk17 [get_ports {refclk_i_p[17]}]
# Bank 130
set_property PACKAGE_PIN W42 [get_ports {refclk_i_n[18]}]
set_property PACKAGE_PIN W41 [get_ports {refclk_i_p[18]}]
create_clock -period 3.125 -name refclk18 [get_ports {refclk_i_p[18]}]
# Bank 131
set_property PACKAGE_PIN U42 [get_ports {refclk_i_n[19]}]
set_property PACKAGE_PIN U41 [get_ports {refclk_i_p[19]}]
create_clock -period 3.125 -name refclk19 [get_ports {refclk_i_p[19]}]

# SLR2 Right
# Bank 228
set_property PACKAGE_PIN AE10 [get_ports {refclk_i_n[20]}]
set_property PACKAGE_PIN AE11 [get_ports {refclk_i_p[20]}]
create_clock -period 3.125 -name refclk20 [get_ports {refclk_i_p[20]}]
# Bank 229
set_property PACKAGE_PIN AA10 [get_ports {refclk_i_n[21]}]
set_property PACKAGE_PIN AA11 [get_ports {refclk_i_p[21]}]
create_clock -period 3.125 -name refclk21 [get_ports {refclk_i_p[21]}]
# Bank 230
set_property PACKAGE_PIN W10 [get_ports {refclk_i_n[22]}]
set_property PACKAGE_PIN W11 [get_ports {refclk_i_p[22]}]
create_clock -period 3.125 -name refclk22 [get_ports {refclk_i_p[22]}]
# Bank 231
set_property PACKAGE_PIN U10 [get_ports {refclk_i_n[23]}]
set_property PACKAGE_PIN U11 [get_ports {refclk_i_p[23]}]
create_clock -period 3.125 -name refclk23 [get_ports {refclk_i_p[23]}]

# SLR3 Left
# Bank 132
set_property PACKAGE_PIN R42 [get_ports {refclk_i_n[24]}]
set_property PACKAGE_PIN R41 [get_ports {refclk_i_p[24]}]
create_clock -period 3.125 -name refclk24 [get_ports {refclk_i_p[24]}]
# Bank 133
set_property PACKAGE_PIN N42 [get_ports {refclk_i_n[25]}]
set_property PACKAGE_PIN N41 [get_ports {refclk_i_p[25]}]
create_clock -period 3.125 -name refclk25 [get_ports {refclk_i_p[25]}]
# Bank 134
set_property PACKAGE_PIN L42 [get_ports {refclk_i_n[26]}]
set_property PACKAGE_PIN L41 [get_ports {refclk_i_p[26]}]
create_clock -period 3.125 -name refclk26 [get_ports {refclk_i_p[26]}]
# Bank 135
set_property PACKAGE_PIN J42 [get_ports {refclk_i_n[27]}]
set_property PACKAGE_PIN J41 [get_ports {refclk_i_p[27]}]
create_clock -period 3.125 -name refclk27 [get_ports {refclk_i_p[27]}]

# SLR3 Right
# Bank 232
set_property PACKAGE_PIN R10 [get_ports {refclk_i_n[28]}]
set_property PACKAGE_PIN R11 [get_ports {refclk_i_p[28]}]
create_clock -period 3.125 -name refclk28 [get_ports {refclk_i_p[28]}]
# Bank 233
set_property PACKAGE_PIN N10 [get_ports {refclk_i_n[29]}]
set_property PACKAGE_PIN N11 [get_ports {refclk_i_p[29]}]
create_clock -period 3.125 -name refclk29 [get_ports {refclk_i_p[29]}]
# Bank 234
set_property PACKAGE_PIN L10 [get_ports {refclk_i_n[30]}]
set_property PACKAGE_PIN L11 [get_ports {refclk_i_p[30]}]
create_clock -period 3.125 -name refclk30 [get_ports {refclk_i_p[30]}]
# Bank 235
set_property PACKAGE_PIN J10 [get_ports {refclk_i_n[31]}]
set_property PACKAGE_PIN J11 [get_ports {refclk_i_p[31]}]
create_clock -period 3.125 -name refclk31 [get_ports {refclk_i_p[31]}]

create_clock -period 10.000 -name clk100 -waveform {0.000 5.000} -add [get_pins top_hal/top_clocking_inst/pll_clk50_inst/clk_100MHz]
#create_clock -period 20.000 -name clk50 -waveform {0.000 10.000} [get_pins top_hal/top_clocking_inst/pll_clk50_inst/clk_50MHz]

# LHC Clock Inputs
set_property PACKAGE_PIN AR17 [get_ports clock_i_p]
set_property PACKAGE_PIN AR16 [get_ports clock_i_n]
#create_clock -period 25.000 -name clock_in_lhc [get_ports clock_i_p]
set_property IOSTANDARD LVDS [get_ports clock_i*]

# 200M Oscillator
set_property PACKAGE_PIN AT17 [get_ports clock_async_i_p]
set_property PACKAGE_PIN AU16 [get_ports clock_async_i_n]
set_property IOSTANDARD LVDS [get_ports clock_async_i*]
# create_clock -period 5.000 -name clock_async [get_ports clock_async_i_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports clock_async_i*]

# LHC REF Output
set_property PACKAGE_PIN BE26 [get_ports tc_clk_o_p]
set_property PACKAGE_PIN BE27 [get_ports tc_clk_o_n]
set_property IOSTANDARD LVDS [get_ports tc_clk_*]

# IO standards

set_property PACKAGE_PIN BJ28 [get_ports sump]
set_property IOSTANDARD LVCMOS18 [get_ports sump]


set_property BITSTREAM.CONFIG.USERID 32'h00000000 [current_design]
set_property BITSTREAM.CONFIG.USR_ACCESS 0000000 [current_design]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets top_hal/top_clocking_inst/pll_clk50_inst/inst/clk_in1_onboardclk]
