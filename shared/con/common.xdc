# =============================================================================
#  IMPORTANT: Pro Design Confidential (Internal Use Only)
#  COPYRIGHT (C) 2015, Pro Design Electronic GmbH
#
#  THIS FILE MAY NOT BE MODIFIED, DISCLOSED, COPIED OR DISTRIBUTED WITHOUT THE
#  EXPRESSED WRITTEN CONSENT OF PRO DESIGN.
#
#  Pro Design Electronic GmbH           http://www.prodesign-europe.com
#  Albert-Mayer-Strasse 14-16           info@prodesign-europe.com
#  83052 Bruckmuehl                     +49 (0)8062 / 808 - 0
#  Germany
# =============================================================================
#  Project       : proFPGA
#  Module        : common.xdc
#  Author        : Martin Langner
#  Contact       : profpga-service@prodesign-europe.com,
#  Description   :
#                  Common constraints file for reset Demo Design.
# =============================================================================
# Revision history :
# Version  Date        Description
# -------  ----------  --------------------------------------------------------
# 1.0      2015-04-20  File created
# =============================================================================

######################################################################################
# define clocks
######################################################################################

# constrain clock inputs
create_clock  -name CLK_P_0 -period 10. [get_ports CLK_P_0 ]  ; # 100 MHz master clock[0]

# input delay for sync pins relative to clock pins, needed for profpga_clocksync (see UD006)
set_input_delay  -clock CLK_P_0 0 [get_ports SYNC_P_0 ]

# define IO standards for the used ports
set_property IOSTANDARD LVDS     [get_ports CLK_*  ]
set_property IOSTANDARD LVDS     [get_ports SYNC_* ]
set_property IOSTANDARD LVCMOS18 [get_ports LED_*  ]
set_property IOSTANDARD LVCMOS18 [get_ports DMBI_* ]
