################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name clk50Mhz -period 20 [get_ports clk50Mhz]
create_clock -name AXI_CLK -period 20 [get_ports AXI_CLK]
create_clock -name clk40 -period 10 [get_ports clk40]
create_clock -name K_C2C_PHY_refclk_clk_p -period 5 [get_ports K_C2C_PHY_refclk_clk_p]

################################################################################