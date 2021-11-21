create_clock -period 4.166 -name refclk0  [get_ports refclk_i_p[0]]  ; # sl
create_clock -period 4.166 -name refclk1  [get_ports refclk_i_p[1]]  ; # sl
create_clock -period 4.166 -name refclk2  [get_ports refclk_i_p[2]]  ; # sl
create_clock -period 5.000 -name refclk3  [get_ports refclk_i_p[3]]  ; # c2c
create_clock -period 3.125 -name refclk4  [get_ports refclk_i_p[4]]  ; # lpgbt
create_clock -period 3.125 -name refclk5  [get_ports refclk_i_p[5]]  ; # lpgbt
create_clock -period 3.125 -name refclk6  [get_ports refclk_i_p[6]]  ; # lpgbt
create_clock -period 3.125 -name refclk7  [get_ports refclk_i_p[7]]  ; # lpgbt
create_clock -period 3.125 -name refclk8  [get_ports refclk_i_p[8]]  ; # lpgbt
create_clock -period 3.125 -name refclk9  [get_ports refclk_i_p[9]]  ; # lpgbt
create_clock -period 3.125 -name refclk10 [get_ports refclk_i_p[10]] ; # lpgbt
create_clock -period 3.125 -name refclk11 [get_ports refclk_i_p[11]] ; # lpgbt
create_clock -period 3.125 -name refclk12 [get_ports refclk_i_p[12]] ; # lpgbt
create_clock -period 3.125 -name refclk13 [get_ports refclk_i_p[13]] ; # lpgbt
create_clock -period 3.125 -name refclk14 [get_ports refclk_i_p[14]] ; # lpgbt
create_clock -period 3.125 -name refclk15 [get_ports refclk_i_p[15]] ; # lpgbt
create_clock -period 3.125 -name refclk16 [get_ports refclk_i_p[16]] ; # lpgbt
create_clock -period 3.125 -name refclk17 [get_ports refclk_i_p[17]] ; # lpgbt
create_clock -period 3.125 -name refclk18 [get_ports refclk_i_p[18]] ; # lpgbt
create_clock -period 3.125 -name refclk19 [get_ports refclk_i_p[19]] ; # lpgbt
create_clock -period 3.125 -name refclk20 [get_ports refclk_i_p[20]] ; # lpgbt
create_clock -period 3.125 -name refclk21 [get_ports refclk_i_p[21]] ; # lpgbt
create_clock -period 3.125 -name refclk22 [get_ports refclk_i_p[22]] ; # lpgbt
create_clock -period 3.125 -name refclk23 [get_ports refclk_i_p[23]] ; # lpgbt
create_clock -period 3.125 -name refclk24 [get_ports refclk_i_p[24]] ; # lpgbt
create_clock -period 3.125 -name refclk25 [get_ports refclk_i_p[25]] ; # lpgbt
create_clock -period 3.125 -name refclk26 [get_ports refclk_i_p[26]] ; # lpgbt
create_clock -period 3.125 -name refclk27 [get_ports refclk_i_p[27]] ; # lpgbt
create_clock -period 3.125 -name refclk28 [get_ports refclk_i_p[28]] ; # lpgbt
create_clock -period 3.125 -name refclk29 [get_ports refclk_i_p[29]] ; # lpgbt
create_clock -period 3.125 -name refclk30 [get_ports refclk_i_p[30]] ; # lpgbt
create_clock -period 3.125 -name refclk31 [get_ports refclk_i_p[31]] ; # lpgbt

# # LHC REF Inputs
# #set_property -quiet PACKAGE_PIN AT24    [get_ports lhc_clock_in_p] ; # IN: LHC clock ;; SM or SMA or (KUP/ZUP output) --> Si5345 (no ZDM)
# #set_property -quiet PACKAGE_PIN AU24    [get_ports lhc_clock_in_n] ; # IN: LHC clock ;; SM or SMA or (KUP/ZUP output) --> Si5345 (no ZDM)
create_clock -period 25 -name clock_in_lhc [get_ports clock_i_p]

# # CLK_GEN Inputs
# set_property -quiet PACKAGE_PIN AP29    [get_ports clock_i_p] ; # IN: async programmable clock ;; oscillator --> SI5341 (no zdm)
# set_property -quiet PACKAGE_PIN AP30    [get_ports clock_i_n] ; # IN: async programmable clock ;; oscillator --> SI5341 (no zdm)

# # 100M Oscillator
# set_property -quiet PACKAGE_PIN AY16    [get_ports clock_100m_i_p] ; # IN: oscillator clock, 100MHz, always on
# set_property -quiet PACKAGE_PIN AY15    [get_ports clock_100m_i_n] ; # IN: oscillator clock, 100MHz, always on
create_clock -period 10.00 -name clock_100 [get_ports clock_100m_i_p]

# # LHC REF Output
# set_property -quiet PACKAGE_PIN AT23    [get_ports lhc_refclk_o_p] ; # OUT: recovered LHC Clock to synths
# set_property -quiet PACKAGE_PIN AU23    [get_ports lhc_refclk_o_n] ; # OUT: recovered LHC Clock to synths

set_property IOSTANDARD LVDS [get_ports  clock_i*]
set_property IOSTANDARD LVDS [get_ports  clock_100m_i*]
set_property IOSTANDARD LVDS [get_ports  lhc_refclk_o*]

set_property -quiet PACKAGE_PIN AU12   [get_ports sump]
set_property IOSTANDARD LVCMOS18       [get_ports sump]

# set_property IOSTANDARD LVCMOS18 [get_ports sys_mgmt_scl]
# set_property IOSTANDARD LVCMOS18 [get_ports sys_mgmt_sda]
# set_property -quiet PACKAGE_PIN AL24     [get_ports sys_mgmt_scl] ;
# set_property -quiet PACKAGE_PIN AL25     [get_ports sys_mgmt_sda];

set_property PACKAGE_PIN BE50 [get_ports c2c_rxp]
set_property PACKAGE_PIN BE51 [get_ports c2c_rxn]
set_property PACKAGE_PIN BD48 [get_ports c2c_txp]
set_property PACKAGE_PIN BD49 [get_ports c2c_txn]
