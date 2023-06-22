# Schematic:
# https://mdttp-files.web.cern.ch/mdttp-files/L0MDT/Demonstrator/CM/Version_1/doc/Board/Schematic/mpip001_apollo_command_module_s1v00_b1v01.pdf
#
# turn off on over-temperature
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design]
#-------------------------------------------------
# Set internal reference voltages to 0.90 on banks with I/O signals.
# This is required for the HSTL and DIFF_HSTL I/O standards
set_property INTERNAL_VREF 0.9 [get_iobanks 66]
set_property INTERNAL_VREF 0.9 [get_iobanks 67]
set_property INTERNAL_VREF 0.9 [get_iobanks 72]
#-------------------------------------------------



create_clock -period 3.125 -name refclk0 [get_ports {refclk_i_p[0]}]
create_clock -period 3.125 -name refclk1 [get_ports {refclk_i_p[1]}]
create_clock -period 4.166 -name refclk2 [get_ports {refclk_i_p[2]}]
create_clock -period 4.166 -name refclk3 [get_ports {refclk_i_p[3]}]
create_clock -period 4.166 -name refclk4 [get_ports {refclk_i_p[4]}]
create_clock -period 3.125 -name refclk5 [get_ports {refclk_i_p[5]}]
create_clock -period 3.125 -name refclk6 [get_ports {refclk_i_p[6]}]
create_clock -period 3.125 -name refclk7 [get_ports {refclk_i_p[7]}]
create_clock -period 3.125 -name refclk8 [get_ports {refclk_i_p[8]}]
create_clock -period 3.125 -name refclk9 [get_ports {refclk_i_p[9]}]
create_clock -period 3.125 -name refclk10 [get_ports {refclk_i_p[10]}]
create_clock -period 3.125 -name refclk11 [get_ports {refclk_i_p[11]}]
create_clock -period 3.125 -name refclk12 [get_ports {refclk_i_p[12]}]
create_clock -period 3.125 -name refclk13 [get_ports {refclk_i_p[13]}]
create_clock -period 3.125 -name refclk14 [get_ports {refclk_i_p[14]}]
create_clock -period 3.125 -name refclk15 [get_ports {refclk_i_p[15]}]
create_clock -period 3.125 -name refclk16 [get_ports {refclk_i_p[16]}]
create_clock -period 3.125 -name refclk17 [get_ports {refclk_i_p[17]}]
create_clock -period 3.125 -name refclk18 [get_ports {refclk_i_p[18]}]
create_clock -period 3.125 -name refclk19 [get_ports {refclk_i_p[19]}]
create_clock -period 3.125 -name refclk20 [get_ports {refclk_i_p[20]}]
create_clock -period 3.125 -name refclk21 [get_ports {refclk_i_p[21]}]
create_clock -period 10.000 -name clk100 -waveform {0.000 5.000} -add [get_pins top_hal/top_clocking_inst/pll_clk50_inst/clk_100MHz]
create_clock -period 20.000 -name clk50 -waveform {0.000 10.000} [get_pins top_hal/top_clocking_inst/pll_clk50_inst/clk_50MHz]


# GTY
set_property PACKAGE_PIN AG30 [get_ports {refclk_i_p[0]}]
set_property PACKAGE_PIN AG31 [get_ports {refclk_i_n[0]}]
set_property PACKAGE_PIN AD32 [get_ports {refclk_i_p[1]}]
set_property PACKAGE_PIN AD33 [get_ports {refclk_i_n[1]}]
set_property PACKAGE_PIN AB33 [get_ports {refclk_i_n[2]}]
set_property PACKAGE_PIN AB32 [get_ports {refclk_i_p[2]}]
set_property PACKAGE_PIN Y32 [get_ports {refclk_i_p[3]}]
set_property PACKAGE_PIN Y33 [get_ports {refclk_i_n[3]}]
set_property PACKAGE_PIN V32 [get_ports {refclk_i_p[4]}]
set_property PACKAGE_PIN V33 [get_ports {refclk_i_n[4]}]
set_property PACKAGE_PIN T33 [get_ports {refclk_i_n[5]}]
set_property PACKAGE_PIN T32 [get_ports {refclk_i_p[5]}]
set_property PACKAGE_PIN P33 [get_ports {refclk_i_n[6]}]
set_property PACKAGE_PIN P32 [get_ports {refclk_i_p[6]}]
set_property PACKAGE_PIN M33 [get_ports {refclk_i_n[7]}]
set_property PACKAGE_PIN M32 [get_ports {refclk_i_p[7]}]

# GTH
set_property PACKAGE_PIN AL12 [get_ports {refclk_i_p[8]}]
set_property PACKAGE_PIN AL11 [get_ports {refclk_i_n[8]}]

#200MHz Clk for C2C Aurora IP
set_property PACKAGE_PIN AK9 [get_ports {refclk_i_n[9]}]
set_property PACKAGE_PIN AK10 [get_ports {refclk_i_p[9]}]

set_property PACKAGE_PIN AJ12 [get_ports {refclk_i_p[10]}]
set_property PACKAGE_PIN AJ11 [get_ports {refclk_i_n[10]}]
set_property PACKAGE_PIN AH10 [get_ports {refclk_i_p[11]}]
set_property PACKAGE_PIN AH9 [get_ports {refclk_i_n[11]}]
set_property PACKAGE_PIN AG12 [get_ports {refclk_i_p[12]}]
set_property PACKAGE_PIN AG11 [get_ports {refclk_i_n[12]}]
set_property PACKAGE_PIN AE12 [get_ports {refclk_i_p[13]}]
set_property PACKAGE_PIN AE11 [get_ports {refclk_i_n[13]}]
set_property PACKAGE_PIN AC11 [get_ports {refclk_i_n[14]}]
set_property PACKAGE_PIN AC12 [get_ports {refclk_i_p[14]}]
set_property PACKAGE_PIN AA12 [get_ports {refclk_i_p[15]}]
set_property PACKAGE_PIN AA11 [get_ports {refclk_i_n[15]}]
set_property PACKAGE_PIN W12 [get_ports {refclk_i_p[16]}]
set_property PACKAGE_PIN W11 [get_ports {refclk_i_n[16]}]
set_property PACKAGE_PIN V10 [get_ports {refclk_i_p[17]}]
set_property PACKAGE_PIN V9 [get_ports {refclk_i_n[17]}]
set_property PACKAGE_PIN U12 [get_ports {refclk_i_p[18]}]
set_property PACKAGE_PIN U11 [get_ports {refclk_i_n[18]}]
set_property PACKAGE_PIN R12 [get_ports {refclk_i_p[19]}]
set_property PACKAGE_PIN R11 [get_ports {refclk_i_n[19]}]
set_property PACKAGE_PIN N12 [get_ports {refclk_i_p[20]}]
set_property PACKAGE_PIN N11 [get_ports {refclk_i_n[20]}]
set_property PACKAGE_PIN L12 [get_ports {refclk_i_p[21]}]
set_property PACKAGE_PIN L11 [get_ports {refclk_i_n[21]}]

# LHC REF Inputs
#set_property PACKAGE_PIN AT24 [get_ports clock_i_p] #Input 320MHz clock
#set_property PACKAGE_PIN AU24 [get_ports clock_i_n]
#Input 40MHz clock
set_property PACKAGE_PIN AP29 [get_ports clock_i_p] 
set_property PACKAGE_PIN AP30 [get_ports clock_i_n]
create_clock -period 25.000 -name clock_in_lhc [get_ports clock_i_p]
set_property IOSTANDARD LVDS [get_ports clock_i*]

# ASYNC Oscillator
set_property PACKAGE_PIN AY16 [get_ports clock_async_i_p]
set_property PACKAGE_PIN AY15 [get_ports clock_async_i_n]
#create_clock -period 10.000 -name clock_100 [get_ports p_clk_100]
set_property IOSTANDARD LVDS [get_ports clock_async_i_*]
set_property DIFF_TERM_ADV TERM_100 [get_ports clock_async_i_*]

# LHC REF Output


set_property PACKAGE_PIN AU12 [get_ports sump]
set_property IOSTANDARD LVCMOS18 [get_ports sump]







set_property PACKAGE_PIN BA4 [get_ports c2cb_rxp]
set_property PACKAGE_PIN BA3 [get_ports c2cb_rxn]
set_property PACKAGE_PIN AV10 [get_ports c2cb_txp]
set_property PACKAGE_PIN AV9 [get_ports c2cb_txn]

set_property PACKAGE_PIN BB6 [get_ports c2c_rxp]
set_property PACKAGE_PIN BB5 [get_ports c2c_rxn]
set_property PACKAGE_PIN AW8 [get_ports c2c_txp]
set_property PACKAGE_PIN AW7 [get_ports c2c_txn]

set_property PACKAGE_PIN AK9 [get_ports c2c_refclkn]
set_property PACKAGE_PIN AK10 [get_ports c2c_refclkp]

# LHC REF Output
set_property PACKAGE_PIN AT23 [get_ports tc_clk_o_p]
set_property PACKAGE_PIN AU23 [get_ports tc_clk_o_n]
set_property IOSTANDARD LVDS [get_ports tc_clk_*]


set_property BITSTREAM.CONFIG.USERID 32'h00000000 [current_design]
set_property BITSTREAM.CONFIG.USR_ACCESS 0000000 [current_design]



