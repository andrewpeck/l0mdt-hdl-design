# asynchronous clock for felix recovery
create_clock -period 3.125 -name refclk_felix_rx [get_ports tc_clk_i_p]; # Bank 120 -- felix rx
set_property PACKAGE_PIN BD39 [get_ports tc_clk_i_p]
set_property PACKAGE_PIN BD40 [get_ports tc_clk_i_n]

# SLR0 Left
create_clock -period 3.125 -name refclk0  [get_ports refclk_i_p[0]]  ; # Bank 120 -- felix tx
create_clock -period 4.166 -name refclk1  [get_ports refclk_i_p[1]]  ; # Bank 121 -- sl
create_clock -period 4.166 -name refclk2  [get_ports refclk_i_p[2]]  ; # Bank 122 -- sl
create_clock -period 4.166 -name refclk3  [get_ports refclk_i_p[3]]  ; # Bank 123 -- sl

# SLR0 Right
create_clock -period 5.000 -name refclk4  [get_ports refclk_i_p[4]]  ; # Bank 220 -- c2c
create_clock -period 3.125 -name refclk5  [get_ports refclk_i_p[5]]  ; # Bank 221
create_clock -period 3.125 -name refclk6  [get_ports refclk_i_p[6]]  ; # Bank 222
create_clock -period 3.125 -name refclk7  [get_ports refclk_i_p[7]]  ; # Bank 223

# SLR1 Left
create_clock -period 3.125 -name refclk8  [get_ports refclk_i_p[8]]  ; # Bank 124
create_clock -period 3.125 -name refclk9  [get_ports refclk_i_p[9]]  ; # Bank 125
create_clock -period 3.125 -name refclk10 [get_ports refclk_i_p[10]] ; # Bank 126
create_clock -period 3.125 -name refclk11 [get_ports refclk_i_p[11]] ; # Bank 127

# SLR1 Right
create_clock -period 3.125 -name refclk12 [get_ports refclk_i_p[12]] ; # Bank 224
create_clock -period 3.125 -name refclk13 [get_ports refclk_i_p[13]] ; # Bank 225
create_clock -period 3.125 -name refclk14 [get_ports refclk_i_p[14]] ; # Bank 226
create_clock -period 3.125 -name refclk15 [get_ports refclk_i_p[15]] ; # Bank 227

# SLR2 Left
create_clock -period 3.125 -name refclk16 [get_ports refclk_i_p[16]] ; # Bank 128
create_clock -period 3.125 -name refclk17 [get_ports refclk_i_p[17]] ; # Bank 129
create_clock -period 3.125 -name refclk18 [get_ports refclk_i_p[18]] ; # Bank 130
create_clock -period 3.125 -name refclk19 [get_ports refclk_i_p[19]] ; # Bank 131

# SLR2 Right
create_clock -period 3.125 -name refclk20 [get_ports refclk_i_p[20]] ; # Bank 228
create_clock -period 3.125 -name refclk21 [get_ports refclk_i_p[21]] ; # Bank 229
create_clock -period 3.125 -name refclk22 [get_ports refclk_i_p[22]] ; # Bank 230
create_clock -period 3.125 -name refclk23 [get_ports refclk_i_p[23]] ; # Bank 231

# SLR3 Left
create_clock -period 3.125 -name refclk24 [get_ports refclk_i_p[24]] ; # Bank 132
create_clock -period 3.125 -name refclk25 [get_ports refclk_i_p[25]] ; # Bank 133
create_clock -period 3.125 -name refclk26 [get_ports refclk_i_p[26]] ; # Bank 134
create_clock -period 3.125 -name refclk27 [get_ports refclk_i_p[27]] ; # Bank 135

# SLR3 Right
create_clock -period 3.125 -name refclk28 [get_ports refclk_i_p[28]] ; # Bank 232
create_clock -period 3.125 -name refclk29 [get_ports refclk_i_p[29]] ; # Bank 233
create_clock -period 3.125 -name refclk30 [get_ports refclk_i_p[30]] ; # Bank 234
create_clock -period 3.125 -name refclk31 [get_ports refclk_i_p[31]] ; # Bank 235

# LHC Clock Inputs
create_clock -period 25 -name clock_in_lhc [get_ports clock_i_p]
set_property -quiet PACKAGE_PIN AR17 [get_ports clock_in_p] ;
set_property -quiet PACKAGE_PIN AR16 [get_ports clock_in_n] ;

# 200M Oscillator
set_property -quiet PACKAGE_PIN AT17 [get_ports clock_async_i_p] ; # IN: oscillator clock
set_property -quiet PACKAGE_PIN AU16 [get_ports clock_async_i_n] ; # IN: oscillator clock
create_clock -period 5.00 -name clock_async [get_ports clock_async_i_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports clock_async_i*]

# LHC REF Output
set_property -quiet PACKAGE_PIN BE26 [get_ports tc_clk_o_p] ; # OUT: recovered LHC Clock to synths
set_property -quiet PACKAGE_PIN BE27 [get_ports tc_clk_o_n] ; # OUT: recovered LHC Clock to synths

# IO standards
set_property IOSTANDARD LVDS [get_ports  clock_i*]
set_property IOSTANDARD LVDS [get_ports  clock_async_i*]
set_property IOSTANDARD LVDS [get_ports  tc_clk_o*]

set_property -quiet PACKAGE_PIN BJ28   [get_ports sump]
set_property IOSTANDARD LVCMOS18       [get_ports sump]

set_property PACKAGE_PIN BG20 [get_ports c2c_rxp]
set_property PACKAGE_PIN BG19 [get_ports c2c_rxn]
set_property PACKAGE_PIN BH13 [get_ports c2c_txp]
set_property PACKAGE_PIN BG12 [get_ports c2c_txn]

# set_property IOSTANDARD LVCMOS18 [get_ports led_o*]
# set_property PACKAGE_PIN BA19 [get_ports led_o[0]]
# set_property PACKAGE_PIN BA18 [get_ports led_o[1]]
# set_property PACKAGE_PIN BC19 [get_ports led_o[2]]
# set_property PACKAGE_PIN BC18 [get_ports led_o[3]]
# set_property PACKAGE_PIN AV19 [get_ports led_o[4]]
# set_property PACKAGE_PIN AW15 [get_ports led_o[5]]
# set_property PACKAGE_PIN AY15 [get_ports led_o[6]]
# set_property PACKAGE_PIN BA15 [get_ports led_o[7]]
# set_property PACKAGE_PIN AU17 [get_ports led_o[8]]
