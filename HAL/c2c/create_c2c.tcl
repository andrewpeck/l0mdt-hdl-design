set C2C C2C
set C2C_PHY ${C2C}_PHY

set C2CB C2CB
set C2CB_PHY ${C2CB}_PHY


AXI_C2C_MASTER [dict create device_name ${C2C} \
		    axi_control [dict create axi_clk $AXI_MASTER_CLK \
				     axi_rstn $AXI_MASTER_RSTN\
				     axi_freq $AXI_MASTER_CLK_FREQ] \
		    primary_serdes 1 \
		    init_clk $EXT_CLK \
		    refclk_freq 200 \
		    c2c_master false \
		    speed 5 \
		   ]
if { [info exists C2CB] } {
    AXI_C2C_MASTER [dict create device_name ${C2CB} \
			axi_control [dict create axi_clk $AXI_MASTER_CLK \
					 axi_rstn $AXI_MASTER_RSTN\
					 axi_freq $AXI_MASTER_CLK_FREQ] \
			primary_serdes ${C2C}_PHY \
			init_clk $EXT_CLK \
			refclk_freq 200 \
			c2c_master false \
			speed 5 \
		       ]
}





