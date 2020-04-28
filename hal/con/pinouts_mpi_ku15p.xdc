create_clock -period 3.125 -name refclk0  [get_ports refclk_i_p[0]]  ;  # C2C_REF0
create_clock -period 3.125 -name refclk1  [get_ports refclk_i_p[1]]  ;  # CM2CM_REF0
create_clock -period 4.166 -name refclk2  [get_ports refclk_i_p[2]]  ;  # SL_REF0
create_clock -period 4.166 -name refclk3  [get_ports refclk_i_p[3]]  ;  # SL_REF1
create_clock -period 4.166 -name refclk4  [get_ports refclk_i_p[4]]  ;  # SL_REF2
create_clock -period 3.125 -name refclk5  [get_ports refclk_i_p[5]]  ;  # FELIX_REF0
create_clock -period 3.125 -name refclk6  [get_ports refclk_i_p[6]]  ;  # FELIX_REF1
create_clock -period 3.125 -name refclk7  [get_ports refclk_i_p[7]]  ;  # FELIX_REF2
create_clock -period 3.125 -name refclk8  [get_ports refclk_i_p[8]]  ;  # AD_CLK2_KUP , muxed as C2c or Spare
create_clock -period 3.125 -name refclk9  [get_ports refclk_i_p[9]]  ;  # B2B_REF0
create_clock -period 3.125 -name refclk10 [get_ports refclk_i_p[10]] ;  # AD_CLK3_KUP , muxed as sma or spare
create_clock -period 3.125 -name refclk11 [get_ports refclk_i_p[11]] ;  # B2B_REF2
create_clock -period 3.125 -name refclk12 [get_ports refclk_i_p[12]] ;  # FE_REF0
create_clock -period 3.125 -name refclk13 [get_ports refclk_i_p[13]] ;  # FE_REF1
create_clock -period 3.125 -name refclk14 [get_ports refclk_i_p[14]] ;  # FE_REF2
create_clock -period 3.125 -name refclk15 [get_ports refclk_i_p[15]] ;  # SPARE_REF1
create_clock -period 3.125 -name refclk16 [get_ports refclk_i_p[16]] ;  # FE_REF3
create_clock -period 3.125 -name refclk17 [get_ports refclk_i_p[17]] ;  # SPARE_REF2
create_clock -period 3.125 -name refclk18 [get_ports refclk_i_p[18]] ;  # FE_REF4
create_clock -period 3.125 -name refclk19 [get_ports refclk_i_p[19]] ;  # FE_REF5
create_clock -period 3.125 -name refclk20 [get_ports refclk_i_p[20]] ;  # FE_REF6
create_clock -period 3.125 -name refclk21 [get_ports refclk_i_p[21]] ;  # FE_REF7

# GTY
set_property -quiet PACKAGE_PIN AG30    [get_ports refclk_i_p[0]    ] ; # C2C_REF0_P
set_property -quiet PACKAGE_PIN AG31    [get_ports refclk_i_n[0]    ] ; # C2C_REF0_N
set_property -quiet PACKAGE_PIN AD32    [get_ports refclk_i_p[1]    ] ; # CM2CM_REF0_P
set_property -quiet PACKAGE_PIN AD33    [get_ports refclk_i_n[1]    ] ; # CM2CM_REF0_N
set_property -quiet PACKAGE_PIN AB32    [get_ports refclk_i_p[2]    ] ; # SL_REF0_P
set_property -quiet PACKAGE_PIN AB33    [get_ports refclk_i_n[2]    ] ; # SL_REF0_N
set_property -quiet PACKAGE_PIN Y32     [get_ports refclk_i_p[3]    ] ; # SL_REF1_P
set_property -quiet PACKAGE_PIN Y33     [get_ports refclk_i_n[3]    ] ; # SL_REF1_N
set_property -quiet PACKAGE_PIN V32     [get_ports refclk_i_p[4]    ] ; # SL_REF2_P
set_property -quiet PACKAGE_PIN V33     [get_ports refclk_i_n[4]    ] ; # SL_REF2_N
set_property -quiet PACKAGE_PIN T32     [get_ports refclk_i_p[5]    ] ; # FELIX_REF0_P
set_property -quiet PACKAGE_PIN T33     [get_ports refclk_i_n[5]    ] ; # FELIX_REF0_N
set_property -quiet PACKAGE_PIN P32     [get_ports refclk_i_p[6]    ] ; # FELIX_REF1_P
set_property -quiet PACKAGE_PIN P33     [get_ports refclk_i_n[6]    ] ; # FELIX_REF1_N
set_property -quiet PACKAGE_PIN M32     [get_ports refclk_i_p[7]    ] ; # FELIX_REF2_P
set_property -quiet PACKAGE_PIN M33     [get_ports refclk_i_n[7]    ] ; # FELIX_REF2_N

# GTH
set_property -quiet PACKAGE_PIN AL12    [get_ports refclk_i_p[8]    ] ; # AD_CLK2_KUP_P
set_property -quiet PACKAGE_PIN AL11    [get_ports refclk_i_n[8]    ] ; # AD_CLK2_KUP_N
set_property -quiet PACKAGE_PIN AK10    [get_ports refclk_i_p[9]    ] ; # B2B_REF0_P
set_property -quiet PACKAGE_PIN AK9     [get_ports refclk_i_n[9]    ] ; # B2B_REF0_N
set_property -quiet PACKAGE_PIN AJ12    [get_ports refclk_i_p[10]    ] ; # AD_CLK3_KUP_P
set_property -quiet PACKAGE_PIN AJ11    [get_ports refclk_i_n[10]    ] ; # AD_CLK3_KUP_N
set_property -quiet PACKAGE_PIN AH10    [get_ports refclk_i_p[11]    ] ; # B2B_REF2_P
set_property -quiet PACKAGE_PIN AH9     [get_ports refclk_i_n[11]    ] ; # B2B_REF2_N
set_property -quiet PACKAGE_PIN AG12    [get_ports refclk_i_p[12]    ] ; # FE_REF0_P
set_property -quiet PACKAGE_PIN AG11    [get_ports refclk_i_n[12]    ] ; # FE_REF0_N
set_property -quiet PACKAGE_PIN AE12    [get_ports refclk_i_p[13]    ] ; # FE_REF1_P
set_property -quiet PACKAGE_PIN AE11    [get_ports refclk_i_n[13]    ] ; # FE_REF1_N
set_property -quiet PACKAGE_PIN AC12    [get_ports refclk_i_p[14]    ] ; # FE_REF2_P
set_property -quiet PACKAGE_PIN AC11    [get_ports refclk_i_n[14]    ] ; # FE_REF2_N
set_property -quiet PACKAGE_PIN AA12    [get_ports refclk_i_p[15]    ] ; # SPARE_REF1_P
set_property -quiet PACKAGE_PIN AA11    [get_ports refclk_i_n[15]    ] ; # SPARE_REF1_N
set_property -quiet PACKAGE_PIN W12     [get_ports refclk_i_p[16]    ] ; # FE_REF3_P
set_property -quiet PACKAGE_PIN W11     [get_ports refclk_i_n[16]    ] ; # FE_REF3_N
set_property -quiet PACKAGE_PIN V10     [get_ports refclk_i_p[17]    ] ; # SPARE_REF2_P
set_property -quiet PACKAGE_PIN V9      [get_ports refclk_i_n[17]    ] ; # SPARE_REF2_N
set_property -quiet PACKAGE_PIN U12     [get_ports refclk_i_p[18]   ] ; # FE_REF4_P
set_property -quiet PACKAGE_PIN U11     [get_ports refclk_i_n[18]   ] ; # FE_REF4_N
set_property -quiet PACKAGE_PIN R12     [get_ports refclk_i_p[19]   ] ; # FE_REF5_P
set_property -quiet PACKAGE_PIN R11     [get_ports refclk_i_n[19]   ] ; # FE_REF5_N
set_property -quiet PACKAGE_PIN N12     [get_ports refclk_i_p[20]   ] ; # FE_REF6_P
set_property -quiet PACKAGE_PIN N11     [get_ports refclk_i_n[20]   ] ; # FE_REF6_N
set_property -quiet PACKAGE_PIN L12     [get_ports refclk_i_p[21]   ] ; # FE_REF7_P
set_property -quiet PACKAGE_PIN L11     [get_ports refclk_i_n[21]   ] ; # FE_REF7_N

set_property -quiet PACKAGE_PIN AT24    [get_ports clock_in_p]
set_property -quiet PACKAGE_PIN AU24    [get_ports clock_in_n]

set_property -quiet PACKAGE_PIN AU12   [get_ports sump]
set_property IOSTANDARD LVCMOS18 [get_ports sump]
