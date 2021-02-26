/////////////////////////////////////////////////////////////////////////////
//                                                                         //
// Design Name:    GBT_SCA                                                 //
// Module Name:    JTAG_defines                                            //
// Made by:        Alessandro Caratelli                                    //
//                                                                         //
// Description:    JTAG Master fully configurable Wishbon compatible       //
// Company:        CERN (PH-ESE)                                           //
// Create Date:    11/April/2013-Created                                   //
// Last modif:     1 October 2015 (for GBT-SCA V2.0)                       //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////

	

`ifndef JTAG_DEFINES
`define JTAG_DEFINES

	//Registers address on wisbound 
	`define JTAG_TDI_rx0         6'h00 //0                
	`define JTAG_TDI_rx1         6'h04 //1      
	`define JTAG_TDI_rx2         6'h08 //2           
	`define JTAG_TDI_rx3         6'h0c //3
	`define JTAG_TDO_tx0         6'h00 //0
	`define JTAG_TDO_tx1         6'h04 //1
	`define JTAG_TDO_tx2         6'h08 //2
	`define JTAG_TDO_tx3         6'h0c //3
	`define JTAG_TMS_tx0         6'h10 //4
	`define JTAG_TMS_tx1         6'h14 //5
	`define JTAG_TMS_tx2         6'h18 //6
	`define JTAG_TMS_tx3         6'h1c //7
	`define JTAG_CTRL            6'h20 //8
	`define JTAG_DEVIDE          6'h24 //9
	`define JTAG_GO_AUTO         6'h28 //a
	`define JTAG_GO_MANUAL       6'h2c //b
	`define JTAG_RES             6'h30 //c
	`define JTAG_STATUS          6'h34 //d
	`define SEU_cnt              6'h3c //f

	// Bit Position in the Control register
	
	`define JTAG_CTRL_RES           16
	`define JTAG_CTRL_Inv_IdlSt     14
	`define JTAG_CTRL_Inv_TrDir     11
	`define JTAG_CTRL_Inv_TxEdge    10
	`define JTAG_CTRL_Inv_RxEdge     9
	`define JTAG_CTRL_GO             8
	`define JTAG_CTRL_IE            12
	`define JTAG_CTRL_CHAR_LEN     6:0

	//Parameters
	`define JTAVDivFregLEN          16 // Number of bit in the clock divider register
	`define JTAG_MaxTrLen          128 // Max transaction numbers (please don't change)
	`define JTAG_NBits               7 // log(JTAG_MaxTrLen)|2
	`define JTAG_CTRL_BIT_NB        17 // Number of bits in the control register
		
`endif


