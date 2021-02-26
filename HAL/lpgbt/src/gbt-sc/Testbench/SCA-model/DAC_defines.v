/////////////////////////////////////////////////////////////////////////////
// Design Name:    GBT_SCA                                                 //
// Module Name:    DAC_wb_interface(TRI Version)                           //
// Description:    whishbone Interface for DAC module                      //
// Company:        CERN (PH-ESE)                                           //
// Made by:        Alessandro Caratelli                                    //
//                                                                         //
// Create Date:    18/July/2013 - Created                                  //
/////////////////////////////////////////////////////////////////////////////

`ifndef DAC_DEFINES
		`define DAC_DEFINES		
		// Registers address ofset on whishbone bus
		`define dac_out1                1
		`define dac_out2                2
		`define dac_out3                3
		`define dac_out4                4
		`define dac_ctrl                0
		`define dac_wb_ofset_bits     4:2
		// #bit used in hich register
		`define dac_conv_nbit           8 //maximum 8
`endif
