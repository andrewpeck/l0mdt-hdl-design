//////////////////////////////////////////////////////////////////
//                                                              //
//  Top module name:.......TOP_core_sca_tri.v                   //
//  Description:...........SCA top digital core (TMR)           //
//                                                              //
//  Authors:...............Alessandro Caratelli CERN PH-ESE-ME  //
//  .......................Christian Paillard CERN PH-ESE-ME    //
//                                                              //
//  Version 1.0:                                                //
//    Creation date:.......01 JULY 2013                         //
//    Last modification:...09 JAN 2014                          //
//                                                              //
//  Version 2.0:                                                //
//    Creation date:.......25 SEPT 2015                         //
//    Last modification:...28 SEPT 2015                         //
//                                                              //
//////////////////////////////////////////////////////////////////

`define WithSEUcounter
`define ClkGate_channels 
        
         
module TOP_core_sca_tri ( 
        `ifdef WithScanPath
		 input         SCAN_MODE,         SCAN_ENABLE,
         input         SCAN_IN1,          SCAN_IN2,          SCAN_IN3,
        `endif
         // Elink HDLC 
         input         link_clk_1,    
         input         link_clk_aux_1,
         input         disable_aux_1, 
         output        tx_sd_1,       
         output        tx_sd_aux_1,   
         input         rx_sd_1,       
         input         rx_sd_aux_1,   
         input  [7:0]  tx_adr_1,      
         output [7:0]  CRE_1,         
         output        active_aux_1,  
		 
         // JTAG 
         output        JTAG_TCK_pad_o_1,
         output        JTAG_TMS_pad_o_1,
         output        JTAG_TDO_pad_o_1,
         input         JTAG_TDI_pad_i_1,
         output        JTAG_RST_pad_o_1,
		 
         // SPI 
         output        SPI_sclk_pad_o_1,
         output [7:0]  SPI_ss_pad_o_1,  
         input         SPI_miso_pad_i_1,
         output        SPI_mosi_pad_o_1,
		 
         // GPIO 
         output [31:0] GPIO_ext_pad_o_1,  
         output [31:0] GPIO_ext_padOE_o_1,
         input         GPIO_clk_pad_i_1,  
         input  [31:0] GPIO_ext_pad_i_1,  
		 
         // I2C 
         output [15:0] SCL_1,        
		 output [15:0] SCLEN_1,      
         input  [15:0] SDA_in_1,     
         output [15:0] SDA_out_inv_1,
		 
         // ADC  
         output        ADC_wb_RES_1, 
         output        ADC_wb_CLK_1, 
         output        ADC_wb_SEL_1, 
         output        ADC_wb_WE_1,  
         output        ADC_wb_STB_1, 
         output        ADC_wb_CYC_1, 
         output [3:0]  ADC_wb_ADR_1, 
         output [31:0] ADC_wb_DATi_1,
         input  [31:0] ADC_wb_DATo_1,
         input         ADC_wb_ACK_1, 
         input         ADC_wb_INT_1, 

         // DAC 
         output [7:0]  anaDAC_A_1,
         output [7:0]  anaDAC_B_1,
         output [7:0]  anaDAC_C_1,
         output [7:0]  anaDAC_D_1,
		 
         // Reset Logic //
         input         PowerUpReset_1,
         input         PromtReset_1,  
         output        Reset_BG_1,    
		 
         // Auxiliary Port I2C //
         input         auxPort_TestEn_1,
         input         auxPort_SCL_1,   
         input         auxPort_SDA_in_1,
         output        auxPort_SDA_out_1,
         output        auxPort_SDA_oEn_1
	);
	
	`include "Table_Commande.v"
		
		
         wire         	link_clk_2;
         wire         	link_clk_aux_2;
         wire         	disable_aux_2;
         wire        	tx_sd_2;
         wire        	tx_sd_aux_2;
         wire         	rx_sd_2;
         wire         	rx_sd_aux_2;
         wire [7:0]  	tx_adr_2;
         wire [7:0]  	CRE_2;
         wire        	active_aux_2;
         wire         	link_clk_3;
         wire         	link_clk_aux_3;
         wire         	disable_aux_3;
         wire        	tx_sd_3;
         wire        	tx_sd_aux_3;
         wire         	rx_sd_3;
         wire         	rx_sd_aux_3;
         wire [7:0]  	tx_adr_3;
         wire [7:0]  	CRE_3;
         wire        	active_aux_3;
		 
		 wire 			JTAG_TCK_pad_o_2;
		 wire 			JTAG_TMS_pad_o_2;
		 wire 			JTAG_TDO_pad_o_2;
		 wire 			JTAG_TDI_pad_i_2;
		 wire 			JTAG_RST_pad_o_2;
		 wire 			JTAG_TCK_pad_o_3;
		 wire 			JTAG_TMS_pad_o_3;
		 wire 			JTAG_TDO_pad_o_3;
		 wire 			JTAG_TDI_pad_i_3;
		 wire 			JTAG_RST_pad_o_3;
		 
		 wire			SPI_sclk_pad_o_2;
		 wire [7:0]		SPI_ss_pad_o_2;
		 wire			SPI_miso_pad_i_2;
		 wire			SPI_mosi_pad_o_2;
		 wire			SPI_sclk_pad_o_3;
		 wire [7:0]		SPI_ss_pad_o_3;
		 wire			SPI_miso_pad_i_3;
		 wire			SPI_mosi_pad_o_3;
		 
		 wire [31:0]	GPIO_ext_pad_o_2;
		 wire [31:0]	GPIO_ext_padOE_o_2;
		 wire			GPIO_clk_pad_i_2;
		 wire [31:0]	GPIO_ext_pad_i_2;
		 wire [31:0]	GPIO_ext_pad_o_3;
		 wire [31:0]	GPIO_ext_padOE_o_3;
		 wire			GPIO_clk_pad_i_3;
		 wire [31:0]	GPIO_ext_pad_i_3;
		 
		 wire [15:0]	SCL_2;
		 wire [15:0]	SCLEN_2;
		 wire [15:0]	SDA_in_2;
		 wire [15:0]	SDA_out_inv_2;
		 wire [15:0]	SCL_3;
		 wire [15:0]	SCLEN_3;
		 wire [15:0]	SDA_in_3;
		 wire [15:0]	SDA_out_inv_3;
		 
		 
		 wire        	ADC_wb_RES_2;
		 wire        	ADC_wb_CLK_2;
		 wire        	ADC_wb_SEL_2;
		 wire        	ADC_wb_WE_2;
		 wire        	ADC_wb_STB_2;
		 wire        	ADC_wb_CYC_2;
		 wire [3:0]  	ADC_wb_ADR_2;
		 wire [31:0] 	ADC_wb_DATi_2;
		 wire [31:0] 	ADC_wb_DATo_2;
		 wire        	ADC_wb_ACK_2;
		 wire        	ADC_wb_INT_2;
		 wire        	ADC_wb_RES_3;
		 wire        	ADC_wb_CLK_3;
		 wire        	ADC_wb_SEL_3;
		 wire        	ADC_wb_WE_3;
		 wire        	ADC_wb_STB_3;
		 wire        	ADC_wb_CYC_3;
		 wire [3:0]  	ADC_wb_ADR_3;
		 wire [31:0] 	ADC_wb_DATi_3;
		 wire [31:0] 	ADC_wb_DATo_3;
		 wire        	ADC_wb_ACK_3;
		 wire        	ADC_wb_INT_3;
		 
		 wire [7:0]  	anaDAC_A_2;
		 wire [7:0]  	anaDAC_B_2;
		 wire [7:0]  	anaDAC_C_2;
		 wire [7:0]  	anaDAC_D_2;
		 wire [7:0]  	anaDAC_A_3;
		 wire [7:0]  	anaDAC_B_3;
		 wire [7:0]  	anaDAC_C_3;
		 wire [7:0]  	anaDAC_D_3;
		 
		 wire        	PowerUpReset_2;
		 wire        	PromtReset_2;  
		 wire        	Reset_BG_2;  
		 wire        	PowerUpReset_3;
		 wire        	PromtReset_3;  
		 wire        	Reset_BG_3;  
		 
		 wire	        auxPort_TestEn_2;
		 wire	        auxPort_SCL_2;  
		 wire	        auxPort_SDA_in_2;
		 wire	        auxPort_SDA_out_2;
		 wire	        auxPort_SDA_oEn_2;
		 wire	        auxPort_TestEn_3;
		 wire	        auxPort_SCL_3;  
		 wire	        auxPort_SDA_in_3;
		 wire	        auxPort_SDA_out_3;
		 wire	        auxPort_SDA_oEn_3;
		 
		 
         assign link_clk_2 = link_clk_1;
         assign link_clk_aux_2 = link_clk_aux_1;
         assign disable_aux_2 = disable_aux_1;
         assign rx_sd_2 = rx_sd_1;
         assign rx_sd_aux_2 = rx_sd_aux_1;
         assign tx_adr_2 = tx_adr_1;
         assign link_clk_3 = link_clk_1;
         assign link_clk_aux_3 = link_clk_aux_1;
         assign disable_aux_3 = disable_aux_1;
         assign rx_sd_3 = rx_sd_1;
         assign rx_sd_aux_3 = rx_sd_aux_1;
         assign tx_adr_3 = tx_adr_1;
		 
		 assign JTAG_TDI_pad_i_2 = JTAG_TDI_pad_i_1;
		 assign JTAG_TDI_pad_i_3 = JTAG_TDI_pad_i_1;
		 
		 assign SPI_miso_pad_i_2 = SPI_miso_pad_i_1;
		 assign SPI_miso_pad_i_3 = SPI_miso_pad_i_1;
		 
		 assign GPIO_clk_pad_i_2 = GPIO_clk_pad_i_1;
		 assign GPIO_ext_pad_i_2 = GPIO_ext_pad_i_1;
		 assign GPIO_clk_pad_i_3 = GPIO_clk_pad_i_1;
		 assign GPIO_ext_pad_i_3 = GPIO_ext_pad_i_1;
		 
		 assign SDA_in_2 = SDA_in_1;
		 assign SDA_in_3 = SDA_in_1;
		 
		 assign ADC_wb_DATo_2 = ADC_wb_DATo_1;
		 assign ADC_wb_ACK_2 = ADC_wb_ACK_1;
		 assign ADC_wb_INT_2 = ADC_wb_INT_1;
		 assign ADC_wb_DATo_3 = ADC_wb_DATo_1;
		 assign ADC_wb_ACK_3 = ADC_wb_ACK_1;
		 assign ADC_wb_INT_3 = ADC_wb_INT_1;
		 		 
		 assign PowerUpReset_2 = PowerUpReset_1;
		 assign PromtReset_2 = PromtReset_1;  
		 assign PowerUpReset_3 = PowerUpReset_1;
		 assign PromtReset_3 = PromtReset_1;
		 
		 assign auxPort_TestEn_2 = auxPort_TestEn_1;
		 assign auxPort_SCL_2 = auxPort_SCL_1;  
		 assign auxPort_SDA_in_2 = auxPort_SDA_in_1;
		 assign auxPort_TestEn_3 = auxPort_TestEn_1;
		 assign auxPort_SCL_3 = auxPort_SCL_1;  
		 assign auxPort_SDA_in_3 = auxPort_SDA_in_1;	 
		 
	 wire	[31:0]  wb_dat_o10_1;
	 wire	[31:0]  wb_dat_o10_2;
	 wire	[31:0]  wb_dat_o10_3;
	 wire	[31:0]  wb_dat_o11_1;
	 wire	[31:0]  wb_dat_o11_2;
	 wire	[31:0]  wb_dat_o11_3;
	 wire	[31:0]  wb_dat_o12_1;
	 wire	[31:0]  wb_dat_o12_2;
	 wire	[31:0]  wb_dat_o12_3;
	 wire	[31:0]  wb_dat_o13_1;
	 wire	[31:0]  wb_dat_o13_2;
	 wire	[31:0]  wb_dat_o13_3;
	 wire	[31:0]  wb_dat_o14_1;
	 wire	[31:0]  wb_dat_o14_2;
	 wire	[31:0]  wb_dat_o14_3;
	 wire	[31:0]  wb_dat_o15_1;
	 wire	[31:0]  wb_dat_o15_2;
	 wire	[31:0]  wb_dat_o15_3;
	 wire	[31:0]  wb_con_data_o_1;
	 wire	[31:0]  wb_con_data_o_2;
	 wire	[31:0]  wb_con_data_o_3;
	 wire	[15:0]  rx_dat_1;
	 wire	[15:0]  rx_dat_2;
	 wire	[15:0]  rx_dat_3;
	 wire		wb_we_o_1;
	 wire		wb_we_o_2;
	 wire		wb_we_o_3;
	 wire		rx_dav_1;
	 wire		rx_dav_2;
	 wire		rx_dav_3;
	 wire		wb_stb_o_1;
	 wire		wb_stb_o_2;
	 wire		wb_stb_o_3;
	 wire		clock_1;
	 wire		clock_2;
	 wire		clock_3;
	 wire	[31:0]  wb_dat_spi_1;
	 wire	[31:0]  wb_dat_spi_2;
	 wire	[31:0]  wb_dat_spi_3;
	 wire		rx_ena_1;
	 wire		rx_ena_2;
	 wire		rx_ena_3;
	 wire		tx_dav_1;
	 wire		tx_dav_2;
	 wire		tx_dav_3;
	 wire		wb_err_out_1;
	 wire		wb_err_out_2;
	 wire		wb_err_out_3;
	 wire	[15:0]  dataw_out_1;
	 wire	[15:0]  dataw_out_2;
	 wire	[15:0]  dataw_out_3;
	 wire		tx_ena_1;
	 wire		tx_ena_2;
	 wire		tx_ena_3;
	 wire		wb_err_o_1;
	 wire		wb_err_o_2;
	 wire		wb_err_o_3;
	 wire	[31:0]  wb_dat_o0_1;
	 wire	[31:0]  wb_dat_o0_2;
	 wire	[31:0]  wb_dat_o0_3;
	 wire	[31:0]  wb_dat_o1_1;
	 wire	[31:0]  wb_dat_o1_2;
	 wire	[31:0]  wb_dat_o1_3;
	 wire	[31:0]  wb_dat_o2_1;
	 wire	[31:0]  wb_dat_o2_2;
	 wire	[31:0]  wb_dat_o2_3;
	 wire	[31:0]  wb_dat_o3_1;
	 wire	[31:0]  wb_dat_o3_2;
	 wire	[31:0]  wb_dat_o3_3;
	 wire	[31:0]  wb_dat_o4_1;
	 wire	[31:0]  wb_dat_o4_2;
	 wire	[31:0]  wb_dat_o4_3;
	 wire	[31:0]  wb_addr_o_1;
	 wire	[31:0]  wb_addr_o_2;
	 wire	[31:0]  wb_addr_o_3;
	 wire	[31:0]  wb_dat_o5_1;
	 wire	[31:0]  wb_dat_o5_2;
	 wire	[31:0]  wb_dat_o5_3;
	 wire	[31:0]  wb_dat_o6_1;
	 wire	[31:0]  wb_dat_o6_2;
	 wire	[31:0]  wb_dat_o6_3;
	 wire	[31:0]  wb_data_1;
	 wire	[31:0]  wb_data_2;
	 wire	[31:0]  wb_data_3;
	 wire	[31:0]  wb_dat_o7_1;
	 wire	[31:0]  wb_dat_o7_2;
	 wire	[31:0]  wb_dat_o7_3;
	 wire	[31:0]  wb_dat_o8_1;
	 wire	[31:0]  wb_dat_o8_2;
	 wire	[31:0]  wb_dat_o8_3;
	 wire	[31:0]  wb_dat_o9_1;
	 wire	[31:0]  wb_dat_o9_2;
	 wire	[31:0]  wb_dat_o9_3;
	 wire	[5:0]	CH_int_1;
	 wire	[5:0]	CH_int_2;
	 wire	[5:0]	CH_int_3;
	 wire	[31:0]  wb_dat_gpio_1;
	 wire	[31:0]  wb_dat_gpio_2;
	 wire	[31:0]  wb_dat_gpio_3;
	 wire	[3:0]	SN_1;
	 wire	[3:0]	SN_2;
	 wire	[3:0]	SN_3;
	 wire		CONV_STEP_1;
	 wire		CONV_STEP_2;
	 wire		CONV_STEP_3;
	 wire	[31:0]  wb_con_19_1;
	 wire	[31:0]  wb_con_19_2;
	 wire	[31:0]  wb_con_19_3;
	 wire	[31:0]  wb_stb_slave_1;
	 wire	[31:0]  wb_stb_slave_2;
	 wire	[31:0]  wb_stb_slave_3;
	 wire	[20:0]  IE_CH_1;
	 wire	[20:0]  IE_CH_2;
	 wire	[20:0]  IE_CH_3;
	 reg	[31:0]  wb_con_20_1, wb_con_20_2, wb_con_20_3;
	 reg            ADC_ack_1,   ADC_ack_2,   ADC_ack_3;
	 reg            ADC_int_1,   ADC_int_2,   ADC_int_3;
	 wire	[5:0]	ack_in_1;
	 wire	[5:0]	ack_in_2;
	 wire	[5:0]	ack_in_3;
	 wire		ack_out_1;
	 wire		ack_out_2;
	 wire		ack_out_3;
	 wire	[3:0]	wb_sel_o_1;
	 wire	[3:0]	wb_sel_o_2;
	 wire	[3:0]	wb_sel_o_3;
	 wire		rst_el_s_1;
	 wire		rst_el_s_2;
	 wire		rst_el_s_3;
	 wire	[31:0]  wb_dat_o_1;
	 wire	[31:0]  wb_dat_o_2;
	 wire	[31:0]  wb_dat_o_3;
	 wire		wb_cyc_o_1;
	 wire		wb_cyc_o_2;
	 wire		wb_cyc_o_3;
	 wire		FCLRN_1;
	 wire		FCLRN_2;
	 wire		FCLRN_3;
	 wire		FSETP_1;
	 wire	        FSETP_2;
	 wire	        FSETP_3;
	 wire   [15:0]  SDA_OUT_1;
	 wire   [15:0]  SDA_OUT_2;
	 wire   [15:0]  SDA_OUT_3;
	 wire	        ElinkReset_1;
	 wire	        ElinkReset_2;
	 wire	        ElinkReset_3;	    
	 wire	        reset_1;
	 wire	        reset_2;
	 wire	        reset_3;
	 wire	        nctrl_tx_dav_1,     nctrl_tx_dav_2,     nctrl_tx_dav_3;
	 wire	[15:0]  nctrl_tx_dat_1,     nctrl_tx_dat_2,     nctrl_tx_dat_3;  
	 wire	        nctrl_rx_ena_1,     nctrl_rx_ena_2,     nctrl_rx_ena_3;
	 wire	        nctrl_rx_dav_1,     nctrl_rx_dav_2,     nctrl_rx_dav_3;
	 wire	[15:0]  nctrl_rx_dat_1,     nctrl_rx_dat_2,     nctrl_rx_dat_3;
	 wire	        nctrl_tx_ena_1,     nctrl_tx_ena_2,     nctrl_tx_ena_3; 
	 wire   [15:0]  SCL_inv_1,          SCL_inv_2,          SCL_inv_3;         
	 wire	        anaEXT_CLK; 

	`ifdef WithSEUcounter
	 wire  SEU_NCTRLflag;						  
	 wire  SEUclear_1,SEUclear_2,SEUclear_3;
	 wire  [15:0] SEU_cnt_1, SEU_cnt_2, SEU_cnt_3;
	`endif 
	`ifdef ClkGate_channels
	 wire  [31:0] EN_ch_reg_1, EN_ch_reg_2, EN_ch_reg_3;
	 wire  [21:0] ch_clk_g_1,  ch_clk_g_2,  ch_clk_g_3;
	 wire  [21:0] ch_res_1,    ch_res_2,    ch_res_3;
	`endif 



	// RESET LOGIC ///////////////////////////////////////////////
	// cadence dc::set_dont_touch ResetLogicV

	ResetLogicVoted ResetLogicV(
		.ElinkReset_1(ElinkReset_1),	  .ElinkReset_2(ElinkReset_2),     .ElinkReset_3(ElinkReset_3),
		.PowerUpReset_1(PowerUpReset_1),  .PowerUpReset_2(PowerUpReset_2), .PowerUpReset_3(PowerUpReset_3),
		.PromtReset_1(PromtReset_1),	  .PromtReset_2(PromtReset_2),        
		.SystemReset_1(reset_1),	  .SystemReset_2(reset_2),	   .SystemReset_3(reset_3),
		.clk_1(clock_1),		  .clk_2(clock_2),		   .clk_3(clock_3)
	);

	// SEU COUNTER ///////////////////////////////////////////////
	`ifdef WithSEUcounter	
	SEU_counter SEU_cnt(
		.clk_1(clock_1),		  .clk_2(clock_2),		   .clk_3(clock_3),
		.res_1(reset_1),		  .res_2(reset_2),		   .res_3(reset_3),
		.clear_1(SEUclear_1),		  .clear_2(SEUclear_2),            .clear_3(SEUclear_3),
		.err_1(SEU_NCTRLflag1), 	  .err_2(SEU_NCTRLflag2),	   .err_3(SEU_NCTRLflag3), 
		.SEU_count_1(SEU_cnt_1),	  .SEU_count_2(SEU_cnt_2),	   .SEU_count_3(SEU_cnt_3)
	); 
	`endif

	// CLOCK CONTROL ///////////////////////////////////////////////   
	`ifdef ClkGate_channels
	ClkGate_Reset_channels_tri # (
		.n_ch(22)
	)ch_clk_gating(
		.clk_1(clock_1),		  .clk_2(clock_2),		   .clk_3(clock_3),	  
		.reset_1(reset_1),		  .reset_2(reset_2),		   .reset_3(reset_3),	
		.ch_enable_1(EN_ch_reg_1[21:0]),  .ch_enable_2(EN_ch_reg_2[21:0]), .ch_enable_3(EN_ch_reg_3[21:0]),  
		.ch_clk_1(ch_clk_g_1[21:0]),	  .ch_clk_2(ch_clk_g_2[21:0]),     .ch_clk_3(ch_clk_g_3[21:0]),  
		.ch_res_1(ch_res_1),		  .ch_res_2(ch_res_2),  	   .ch_res_3(ch_res_3)
	);
	`endif 

	// SWITCH INPUT PORT ///////////////////////////////////////////////	 
	SwitchPort_tri SwitchPort(
		.clk_1(clock_1),		       .clk_2(clock_2),  		      .clk_3(clock_3),
		.resetB_1(~PowerUpReset_1),	       .resetB_2(~PowerUpReset_2),	      .resetB_3(~PowerUpReset_3),
		.auxPort_TestEn_1(auxPort_TestEn_1),   .auxPort_TestEn_2(auxPort_TestEn_2),   .auxPort_TestEn_3(auxPort_TestEn_3),
		.auxPort_SCL_1(auxPort_SCL_1),         .auxPort_SCL_2(auxPort_SCL_2),	      .auxPort_SCL_3(auxPort_SCL_3),
		.auxPort_SDA_in_1(auxPort_SDA_in_1),   .auxPort_SDA_in_2(auxPort_SDA_in_2),   .auxPort_SDA_in_3(auxPort_SDA_in_3),      
		.auxPort_SDA_out_1(auxPort_SDA_out_1), .auxPort_SDA_out_2(auxPort_SDA_out_2), .auxPort_SDA_out_3(auxPort_SDA_out_3),
		.auxPort_SDA_oEn_1(auxPort_SDA_oEn_1), .auxPort_SDA_oEn_2(auxPort_SDA_oEn_2), .auxPort_SDA_oEn_3(auxPort_SDA_oEn_3),
		.nctrl_tx_dav_1(nctrl_tx_dav_1),       .nctrl_tx_dav_2(nctrl_tx_dav_2),       .nctrl_tx_dav_3(nctrl_tx_dav_3),
		.nctrl_tx_dat_1(nctrl_tx_dat_1),       .nctrl_tx_dat_2(nctrl_tx_dat_2),       .nctrl_tx_dat_3(nctrl_tx_dat_3),  
		.nctrl_rx_ena_1(nctrl_rx_ena_1),       .nctrl_rx_ena_2(nctrl_rx_ena_2),       .nctrl_rx_ena_3(nctrl_rx_ena_3),
		.nctrl_rx_dav_1(nctrl_rx_dav_1),       .nctrl_rx_dav_2(nctrl_rx_dav_2),       .nctrl_rx_dav_3(nctrl_rx_dav_3),
		.nctrl_rx_dat_1(nctrl_rx_dat_1),       .nctrl_rx_dat_2(nctrl_rx_dat_2),       .nctrl_rx_dat_3(nctrl_rx_dat_3),
		.nctrl_tx_ena_1(nctrl_tx_ena_1),       .nctrl_tx_ena_2(nctrl_tx_ena_2),       .nctrl_tx_ena_3(nctrl_tx_ena_3),
		.elink_tx_dav_1(tx_dav_1),	       .elink_tx_dav_2(tx_dav_2),	      .elink_tx_dav_3(tx_dav_3),
		.elink_tx_dat_1(dataw_out_1),	       .elink_tx_dat_2(dataw_out_2),	      .elink_tx_dat_3(dataw_out_3),
		.elink_rx_ena_1(rx_ena_1),	       .elink_rx_ena_2(rx_ena_2),	      .elink_rx_ena_3(rx_ena_3),
		.elink_rx_dav_1(rx_dav_1),	       .elink_rx_dav_2(rx_dav_2),	      .elink_rx_dav_3(rx_dav_3),
		.elink_rx_dat_1(rx_dat_1),	       .elink_rx_dat_2(rx_dat_2),	      .elink_rx_dat_3(rx_dat_3),
		.elink_tx_ena_1(tx_ena_1),	       .elink_tx_ena_2(tx_ena_2),	      .elink_tx_ena_3(tx_ena_3)
	);

	// ARBITER ///////////////////////////////////////////////   
	ARBITER_tri  arbiter (                
		.clock_1(clock_1),            .clock_2(clock_2),	  .clock_3(clock_3),
		.reset_1(reset_1),            .reset_2(reset_2),	  .reset_3(reset_3),
		.CH_int_1(CH_int_1[5:0]),     .CH_int_2(CH_int_2[5:0]),   .CH_int_3(CH_int_3[5:0]),
		.IE_CH_1(IE_CH_1[20:0]),      .IE_CH_2(IE_CH_2[20:0]),    .IE_CH_3(IE_CH_3[20:0])
	);

	// NODE CONTROLLER  ///////////////////////////////////////////////

	sca_node_ctrl_tri  node_ctrl (
		`ifdef WithSEUcounter
		.SEU_NCTRLflag1(SEU_NCTRLflag1),    .SEU_NCTRLflag2(SEU_NCTRLflag2),    .SEU_NCTRLflag3(SEU_NCTRLflag3),
		`endif
		`ifdef ClkGate_channels
		.EN_ch_reg_1(EN_ch_reg_1),          .EN_ch_reg_2(EN_ch_reg_2),          .EN_ch_reg_3(EN_ch_reg_3),
		`endif 
		.tx_dav_1(nctrl_tx_dav_1),          .tx_dav_2(nctrl_tx_dav_2),          .tx_dav_3(nctrl_tx_dav_3),
		.rx_dav_1(nctrl_rx_dav_1),          .rx_dav_2(nctrl_rx_dav_2),          .rx_dav_3(nctrl_rx_dav_3), 
		.dataw_in_1(nctrl_rx_dat_1),        .dataw_in_2(nctrl_rx_dat_2),        .dataw_in_3(nctrl_rx_dat_3),
		.dataw_out_1(nctrl_tx_dat_1),       .dataw_out_2(nctrl_tx_dat_2),       .dataw_out_3(nctrl_tx_dat_3),
		.tx_ena_1(nctrl_tx_ena_1),          .tx_ena_2(nctrl_tx_ena_2),          .tx_ena_3(nctrl_tx_ena_3),
		.rx_ena_1(nctrl_rx_ena_1),          .rx_ena_2(nctrl_rx_ena_2),          .rx_ena_3(nctrl_rx_ena_3),
		                                                                      
		.wb_cyc_o_1(wb_cyc_o_1),            .wb_cyc_o_2(wb_cyc_o_2),            .wb_cyc_o_3(wb_cyc_o_3),
		.clock_1(clock_1),                  .clock_2(clock_2),                  .clock_3(clock_3),
		.wb_stb_o_1(wb_stb_o_1),            .wb_stb_o_2(wb_stb_o_2),            .wb_stb_o_3(wb_stb_o_3),
		.wb_addr_o_1(wb_addr_o_1[31:0]),    .wb_addr_o_2(wb_addr_o_2[31:0]),    .wb_addr_o_3(wb_addr_o_3[31:0]),
		.wb_ack_i_1(ack_out_1),             .wb_ack_i_2(ack_out_2),             .wb_ack_i_3(ack_out_3),
		.wb_err_in_1(wb_err_o_1),           .wb_err_in_2(wb_err_o_2),           .wb_err_in_3(wb_err_o_3),
		.Int_arb_in_1(CH_int_1[5:0]),       .Int_arb_in_2(CH_int_2[5:0]),       .Int_arb_in_3(CH_int_3[5:0]),
		.CRE_1(CRE_1[7:0]),                 .CRE_2(CRE_2[7:0]),                 .CRE_3(CRE_3[7:0]),
		.wb_dat_i_1(wb_con_data_o_1[31:0]), .wb_dat_i_2(wb_con_data_o_2[31:0]), .wb_dat_i_3(wb_con_data_o_3[31:0]),
		.wb_dat_o_1(wb_data_1[31:0]),       .wb_dat_o_2(wb_data_2[31:0]),       .wb_dat_o_3(wb_data_3[31:0]),
		.wb_sel_o_1(wb_sel_o_1[3:0]),       .wb_sel_o_2(wb_sel_o_2[3:0]),       .wb_sel_o_3(wb_sel_o_3[3:0]),
		.wb_we_o_1(wb_we_o_1),              .wb_we_o_2(wb_we_o_2),              .wb_we_o_3(wb_we_o_3),
		.reset_1(reset_1),                  .reset_2(reset_2),                  .reset_3(reset_3)    
	);


	// WHISHBONE CONNECT FABRIC ///////////////////////////////////////////////
	ack_and_tri  C54_ack_and(
		.ack_in_1(ack_in_1[5:0]), .ack_in_2(ack_in_2[5:0]),  .ack_in_3(ack_in_3[5:0]),
		.ack_out_1(ack_out_1),    .ack_out_2(ack_out_2),     .ack_out_3(ack_out_3) 
	);

	wb_addr_decod_tri  WB_intercon(
		.wb_addr_1(wb_addr_o_1[11:7]),		  .wb_addr_2(wb_addr_o_2[11:7]),	   .wb_addr_3(wb_addr_o_3[11:7]),
		.wb_stb_slave_1(wb_stb_slave_1[31:0]),	  .wb_stb_slave_2(wb_stb_slave_2[31:0]),   .wb_stb_slave_3(wb_stb_slave_3[31:0]),
		.wb_stb_1(wb_stb_o_1),			  .wb_stb_2(wb_stb_o_2),		   .wb_stb_3(wb_stb_o_3),
		.wb_con_in_1_1(wb_dat_spi_1[31:0]),	  .wb_con_in_1_2(wb_dat_spi_2[31:0]),	   .wb_con_in_1_3(wb_dat_spi_3[31:0]),
		.wb_con_in_3_1(wb_dat_o0_1[31:0]),	  .wb_con_in_3_2(wb_dat_o0_2[31:0]),	   .wb_con_in_3_3(wb_dat_o0_3[31:0]),
		.wb_con_in_2_1(wb_dat_gpio_1[31:0]),	  .wb_con_in_2_2(wb_dat_gpio_2[31:0]),	   .wb_con_in_2_3(wb_dat_gpio_3[31:0]),
		.wb_con_in_4_1(wb_dat_o1_1[31:0]),	  .wb_con_in_4_2(wb_dat_o1_2[31:0]),	   .wb_con_in_4_3(wb_dat_o1_3[31:0]),
		.wb_con_in_5_1(wb_dat_o2_1[31:0]),	  .wb_con_in_5_2(wb_dat_o2_2[31:0]),	   .wb_con_in_5_3(wb_dat_o2_3[31:0]),
		.wb_con_in_6_1(wb_dat_o3_1[31:0]),	  .wb_con_in_6_2(wb_dat_o3_2[31:0]),	   .wb_con_in_6_3(wb_dat_o3_3[31:0]),
		.wb_con_in_7_1(wb_dat_o4_1[31:0]),	  .wb_con_in_7_2(wb_dat_o4_2[31:0]),	   .wb_con_in_7_3(wb_dat_o4_3[31:0]),
		.wb_con_in_8_1(wb_dat_o5_1[31:0]),	  .wb_con_in_8_2(wb_dat_o5_2[31:0]),	   .wb_con_in_8_3(wb_dat_o5_3[31:0]),
		.wb_con_in_9_1(wb_dat_o6_1[31:0]),	  .wb_con_in_9_2(wb_dat_o6_2[31:0]),	   .wb_con_in_9_3(wb_dat_o6_3[31:0]),
		.wb_con_in_10_1(wb_dat_o7_1[31:0]),	  .wb_con_in_10_2(wb_dat_o7_2[31:0]),	   .wb_con_in_10_3(wb_dat_o7_3[31:0]),
		.wb_con_in_11_1(wb_dat_o8_1[31:0]),	  .wb_con_in_11_2(wb_dat_o8_2[31:0]),	   .wb_con_in_11_3(wb_dat_o8_3[31:0]),
		.wb_con_in_12_1(wb_dat_o9_1[31:0]),	  .wb_con_in_12_2(wb_dat_o9_2[31:0]),	   .wb_con_in_12_3(wb_dat_o9_3[31:0]),
		.wb_con_in_13_1(wb_dat_o10_1[31:0]),	  .wb_con_in_13_2(wb_dat_o10_2[31:0]),	   .wb_con_in_13_3(wb_dat_o10_3[31:0]),
		.wb_con_in_14_1(wb_dat_o11_1[31:0]),	  .wb_con_in_14_2(wb_dat_o11_2[31:0]),	   .wb_con_in_14_3(wb_dat_o11_3[31:0]),
		.wb_con_in_15_1(wb_dat_o12_1[31:0]),	  .wb_con_in_15_2(wb_dat_o12_2[31:0]),	   .wb_con_in_15_3(wb_dat_o12_3[31:0]),
		.wb_con_in_16_1(wb_dat_o13_1[31:0]),	  .wb_con_in_16_2(wb_dat_o13_2[31:0]),	   .wb_con_in_16_3(wb_dat_o13_3[31:0]),
		.wb_con_in_17_1(wb_dat_o14_1[31:0]),	  .wb_con_in_17_2(wb_dat_o14_2[31:0]),	   .wb_con_in_17_3(wb_dat_o14_3[31:0]),
		.wb_con_in_18_1(wb_dat_o15_1[31:0]),	  .wb_con_in_18_2(wb_dat_o15_2[31:0]),	   .wb_con_in_18_3(wb_dat_o15_3[31:0]),
		.wb_con_in_19_1(wb_con_19_1[31:0]),	  .wb_con_in_19_2(wb_con_19_2[31:0]),	   .wb_con_in_19_3(wb_con_19_3[31:0]),
		.wb_con_in_20_1(wb_con_20_1[31:0]),	  .wb_con_in_20_2(wb_con_20_2[31:0]),	   .wb_con_in_20_3(wb_con_20_3[31:0]),
		.wb_con_in_21_1(wb_dat_o_1[31:0]),	  .wb_con_in_21_2(wb_dat_o_2[31:0]),	   .wb_con_in_21_3(wb_dat_o_3[31:0]),
		.wb_con_data_o_1(wb_con_data_o_1[31:0]),  .wb_con_data_o_2(wb_con_data_o_2[31:0]), .wb_con_data_o_3(wb_con_data_o_3[31:0])	
	);



	// ELINK PORT  ///////////////////////////////////////////////
	elink_tri #(0, 1)  elink_slave(
		.tx_dat_1(dataw_out_1[15:0]),	  .tx_dat_2(dataw_out_2[15:0]),     .tx_dat_3(dataw_out_3[15:0]),
		.rx_dat_1(rx_dat_1[15:0]),	  .rx_dat_2(rx_dat_2[15:0]),	    .rx_dat_3(rx_dat_3[15:0]),
		.tx_sd_1(tx_sd_1),		  .tx_sd_2(tx_sd_2),		    .tx_sd_3(tx_sd_3),
		.tx_sd_aux_1(tx_sd_aux_1),	  .tx_sd_aux_2(tx_sd_aux_2),	    .tx_sd_aux_3(tx_sd_aux_3),
		.tx_ena_1(tx_ena_1),		  .tx_ena_2(tx_ena_2),		    .tx_ena_3(tx_ena_3),
		.rx_sd_1(rx_sd_1),		  .rx_sd_2(rx_sd_2),		    .rx_sd_3(rx_sd_3),
		.rx_sd_aux_1(rx_sd_aux_1),	  .rx_sd_aux_2(rx_sd_aux_2),	    .rx_sd_aux_3(rx_sd_aux_3),
		.link_clk_1(link_clk_1),	  .link_clk_2(link_clk_2),	    .link_clk_3(link_clk_3),
		.link_clk_aux_1(link_clk_aux_1),  .link_clk_aux_2(link_clk_aux_2),  .link_clk_aux_3(link_clk_aux_3),
		.user_clk_1(clock_1),		  .user_clk_2(clock_2), 	    .user_clk_3(clock_3),
		.rx_ena_1(rx_ena_1),		  .rx_ena_2(rx_ena_2),		    .rx_ena_3(rx_ena_3),
		.rx_dav_1(rx_dav_1),		  .rx_dav_2(rx_dav_2),		    .rx_dav_3(rx_dav_3),
		.resetb_1(rst_el_s_1),		  .resetb_2(rst_el_s_2),	    .resetb_3(rst_el_s_3),
		.rx_eop_1(),			  .rx_eop_2(),			    .rx_eop_3(),
		.rx_err_1(),			  .rx_err_2(),			    .rx_err_3(),
		.tx_dav_1(tx_dav_1),		  .tx_dav_2(tx_dav_2),		    .tx_dav_3(tx_dav_3),
		.rx_sop_1(),			  .rx_sop_2(),			    .rx_sop_3(),
		.tx_adr_1(tx_adr_1[7:0]),	  .tx_adr_2(tx_adr_2[7:0]),	    .tx_adr_3(tx_adr_3[7:0]),
		.rx_adr_1(),			  .rx_adr_2(),			    .rx_adr_3(),
		.tx_cmd_reset_1(1'b0),		  .tx_cmd_reset_2(1'b0),	    .tx_cmd_reset_3(1'b0),
		.rx_cmd_reset_1(ElinkReset_1),	  .rx_cmd_reset_2(ElinkReset_2),    .rx_cmd_reset_3(ElinkReset_3),
		.tx_cmd_test_1(1'b0),		  .tx_cmd_test_2(1'b0), 	    .tx_cmd_test_3(1'b0),
		.rx_cmd_test_1(),		  .rx_cmd_test_2(),		    .rx_cmd_test_3(),
		.tx_cset_1(CRE_1[3:0]), 	  .tx_cset_2(CRE_2[3:0]),	    .tx_cset_3(CRE_3[3:0]),
		.tx_ns_1(),			  .tx_ns_2(),			    .tx_ns_3(),
		.rx_nr_1(),			  .rx_nr_2(),			    .rx_nr_3(),
		.rx_cmd_srej_1(),		  .rx_cmd_srej_2(),		    .rx_cmd_srej_3(),
		.cmd_busy_1(),			  .cmd_busy_2(),		    .cmd_busy_3(),
		.tx_cmd_sabm_1(1'b0),		  .tx_cmd_sabm_2(1'b0), 	    .tx_cmd_sabm_3(1'b0),
		.rx_cmd_ua_1(), 		  .rx_cmd_ua_2(),		    .rx_cmd_ua_3(),
		.rx_ns_1(),			  .rx_ns_2(),			    .rx_ns_3(),
		.active_aux_1(active_aux_1),	  .active_aux_2(active_aux_2),	    .active_aux_3(active_aux_3),
		.disable_aux_1(disable_aux_1),	  .disable_aux_2(disable_aux_2),    .disable_aux_3(disable_aux_3)		
	);


	// ADC ///////////////////////////////////////////////
	assign  ADC_wb_RES_1      = ch_res_1[CH_ADC];
	assign  ADC_wb_RES_2      = ch_res_2[CH_ADC];
	assign  ADC_wb_RES_3      = ch_res_3[CH_ADC];
	assign  ADC_wb_RES_1      = ch_res_1[CH_ADC];
	assign  ADC_wb_RES_2      = ch_res_2[CH_ADC];
	assign  ADC_wb_RES_3      = ch_res_3[CH_ADC];
	assign  ADC_wb_CLK_1      = clock_1;
	assign  ADC_wb_CLK_2      = clock_2;
	assign  ADC_wb_CLK_3      = clock_3;
	assign  ADC_wb_SEL_1      = wb_sel_o_1[3:0];
	assign  ADC_wb_SEL_2      = wb_sel_o_2[3:0];
	assign  ADC_wb_SEL_3      = wb_sel_o_3[3:0];
	assign  ADC_wb_WE_1       = wb_we_o_1;
	assign  ADC_wb_WE_2       = wb_we_o_2;
	assign  ADC_wb_WE_3       = wb_we_o_3;
	assign  ADC_wb_STB_1      = wb_stb_slave_1[19];
	assign  ADC_wb_STB_2      = wb_stb_slave_2[19];
	assign  ADC_wb_STB_3      = wb_stb_slave_3[19];
	assign  ADC_wb_CYC_1      = wb_cyc_o_1;
	assign  ADC_wb_CYC_2      = wb_cyc_o_2;
	assign  ADC_wb_CYC_3      = wb_cyc_o_3;
	assign  ADC_wb_ADR_1[3:0] = wb_addr_o_1[5:2];
	assign  ADC_wb_ADR_2[3:0] = wb_addr_o_2[5:2];
	assign  ADC_wb_ADR_3[3:0] = wb_addr_o_3[5:2];
	assign  ADC_wb_DATi_1     = wb_data_1[31:0];
	assign  ADC_wb_DATi_2     = wb_data_2[31:0];
	assign  ADC_wb_DATi_3     = wb_data_3[31:0];
	assign  ack_in_1[5]       = ADC_ack_1;
	assign  ack_in_2[5]       = ADC_ack_2;
	assign  ack_in_3[5]       = ADC_ack_3;
	assign  IE_CH_1[20]	  = ADC_int_1;
	assign  IE_CH_2[20]	  = ADC_int_2;
	assign  IE_CH_3[20]	  = ADC_int_3;  
	
	always @(posedge clock_1 or posedge ch_res_1[CH_ADC]) begin
		if (ch_res_1[CH_ADC]) begin
			ADC_ack_1    <= 1'b0;
			ADC_ack_2    <= 1'b0;
			ADC_ack_3    <= 1'b0;
			ADC_int_1    <= 1'b0;
			ADC_int_2    <= 1'b0;
			ADC_int_3    <= 1'b0;
			wb_con_20_1  <= 32'h0;
			wb_con_20_2  <= 32'h0;
			wb_con_20_3  <= 32'h0;
		end 
		else begin
			ADC_ack_1    <= ADC_wb_ACK_1;
			ADC_ack_2    <= ADC_wb_ACK_2;
			ADC_ack_3    <= ADC_wb_ACK_3;
			ADC_int_1    <= ADC_wb_INT_1;
			ADC_int_2    <= ADC_wb_INT_2;
			ADC_int_3    <= ADC_wb_INT_3;
			wb_con_20_1  <= ADC_wb_DATo_1;
			wb_con_20_2  <= ADC_wb_DATo_2;
			wb_con_20_3  <= ADC_wb_DATo_3;
		end
	end

	// I2C 0 TO 15  ///////////////////////////////////////////////
	i2c_gener_tri  I2C_16x(
		.reset_1(ch_res_1[CH_I2C15:CH_I2C0]),
		.clock_1(ch_clk_g_1[CH_I2C15:CH_I2C0]),
		.wb_stb_i_1(wb_stb_slave_1[31:0]),
		.wb_dat_i_1(wb_data_1[31:0]),
		.wb_adr_i_1(wb_addr_o_1[4:0]),
		.wb_dat_o0_1(wb_dat_o0_1[31:0]),
		.wb_dat_o1_1(wb_dat_o1_1[31:0]),
		.wb_dat_o2_1(wb_dat_o2_1[31:0]),
		.wb_dat_o3_1(wb_dat_o3_1[31:0]),
		.wb_dat_o4_1(wb_dat_o4_1[31:0]),
		.wb_dat_o5_1(wb_dat_o5_1[31:0]),
		.wb_dat_o6_1(wb_dat_o6_1[31:0]),
		.wb_dat_o7_1(wb_dat_o7_1[31:0]),
		.wb_dat_o8_1(wb_dat_o8_1[31:0]),
		.wb_dat_o9_1(wb_dat_o9_1[31:0]),
		.wb_dat_o10_1(wb_dat_o10_1[31:0]),
		.wb_dat_o11_1(wb_dat_o11_1[31:0]),
		.wb_dat_o12_1(wb_dat_o12_1[31:0]),
		.wb_dat_o13_1(wb_dat_o13_1[31:0]),
		.wb_dat_o14_1(wb_dat_o14_1[31:0]),
		.wb_dat_o15_1(wb_dat_o15_1[31:0]),
		.wb_ack_out_1(ack_in_1[2]),
		.wb_we_1(wb_we_o_1),
		.wb_sel_1(wb_sel_o_1[3:0]),
		.SCL_1(SCL_inv_1[15:0]),
		.SDA_in_1(SDA_in_1[15:0]),
		.SDA_OUT_1(SDA_OUT_1[15:0]),
		.wb_i2c_int_1(IE_CH_1[18:3]),
		.wb_cyc_1(wb_cyc_o_1),
		.SCLEN_1(SCLEN_1),
		       .reset_2(ch_res_2[CH_I2C15:CH_I2C0]),
		.clock_2(ch_clk_g_2[CH_I2C15:CH_I2C0]),
		.wb_stb_i_2(wb_stb_slave_2[31:0]),
		.wb_dat_i_2(wb_data_2[31:0]),
		.wb_adr_i_2(wb_addr_o_2[4:0]),
		.wb_dat_o0_2(wb_dat_o0_2[31:0]),
		.wb_dat_o1_2(wb_dat_o1_2[31:0]),
		.wb_dat_o2_2(wb_dat_o2_2[31:0]),
		.wb_dat_o3_2(wb_dat_o3_2[31:0]),
		.wb_dat_o4_2(wb_dat_o4_2[31:0]),
		.wb_dat_o5_2(wb_dat_o5_2[31:0]),
		.wb_dat_o6_2(wb_dat_o6_2[31:0]),
		.wb_dat_o7_2(wb_dat_o7_2[31:0]),
		.wb_dat_o8_2(wb_dat_o8_2[31:0]),
		.wb_dat_o9_2(wb_dat_o9_2[31:0]),
		.wb_dat_o10_2(wb_dat_o10_2[31:0]),
		.wb_dat_o11_2(wb_dat_o11_2[31:0]),
		.wb_dat_o12_2(wb_dat_o12_2[31:0]),
		.wb_dat_o13_2(wb_dat_o13_2[31:0]),
		.wb_dat_o14_2(wb_dat_o14_2[31:0]),
		.wb_dat_o15_2(wb_dat_o15_2[31:0]),
		.wb_ack_out_2(ack_in_2[2]),
		.wb_we_2(wb_we_o_2),
		.wb_sel_2(wb_sel_o_2[3:0]),
		.SCL_2(SCL_inv_2[15:0]),
		.SDA_in_2(SDA_in_2[15:0]),
		.SDA_OUT_2(SDA_OUT_2[15:0]),
		.wb_i2c_int_2(IE_CH_2[18:3]),
		.wb_cyc_2(wb_cyc_o_2),
		.SCLEN_2(SCLEN_2),
		       .reset_3(ch_res_3[CH_I2C15:CH_I2C0]),
		.clock_3(ch_clk_g_3[CH_I2C15:CH_I2C0]),
		.wb_stb_i_3(wb_stb_slave_3[31:0]),
		.wb_dat_i_3(wb_data_3[31:0]),
		.wb_adr_i_3(wb_addr_o_3[4:0]),
		.wb_dat_o0_3(wb_dat_o0_3[31:0]),
		.wb_dat_o1_3(wb_dat_o1_3[31:0]),
		.wb_dat_o2_3(wb_dat_o2_3[31:0]),
		.wb_dat_o3_3(wb_dat_o3_3[31:0]),
		.wb_dat_o4_3(wb_dat_o4_3[31:0]),
		.wb_dat_o5_3(wb_dat_o5_3[31:0]),
		.wb_dat_o6_3(wb_dat_o6_3[31:0]),
		.wb_dat_o7_3(wb_dat_o7_3[31:0]),
		.wb_dat_o8_3(wb_dat_o8_3[31:0]),
		.wb_dat_o9_3(wb_dat_o9_3[31:0]),
		.wb_dat_o10_3(wb_dat_o10_3[31:0]),
		.wb_dat_o11_3(wb_dat_o11_3[31:0]),
		.wb_dat_o12_3(wb_dat_o12_3[31:0]),
		.wb_dat_o13_3(wb_dat_o13_3[31:0]),
		.wb_dat_o14_3(wb_dat_o14_3[31:0]),
		.wb_dat_o15_3(wb_dat_o15_3[31:0]),
		.wb_ack_out_3(ack_in_3[2]),
		.wb_we_3(wb_we_o_3),
		.wb_sel_3(wb_sel_o_3[3:0]),
		.SCL_3(SCL_inv_3[15:0]),
		.SDA_in_3(SDA_in_3[15:0]),
		.SDA_OUT_3(SDA_OUT_3[15:0]),
		.wb_i2c_int_3(IE_CH_3[18:3]),
		.wb_cyc_3(wb_cyc_o_3),
		.SCLEN_3(SCLEN_3)
	);


	// SPI  ///////////////////////////////////////////////
	spi_top_tri  SPI_mast(
		.wb_clk_i_1(ch_clk_g_1[CH_SPI]),
		.wb_rst_i_1(ch_res_1[CH_SPI]),
		.wb_adr_i_1(wb_addr_o_1[4:0]),
		.wb_dat_i_1(wb_data_1[31:0]),
		.wb_dat_o_1(wb_dat_spi_1[31:0]),
		.wb_sel_i_1(wb_sel_o_1[3:0]),
		.wb_we_i_1(wb_we_o_1),
		.wb_stb_i_1(wb_stb_slave_1[0]),
		.wb_cyc_i_1(wb_cyc_o_1),
		.wb_ack_o_1(ack_in_1[0]),
		.wb_err_o_1(),
		.wb_int_o_1(IE_CH_1[1]),
		.ss_pad_o_1(SPI_ss_pad_o_1[7:0]),
		.sclk_pad_o_1(SPI_sclk_pad_o_1),
		.mosi_pad_o_1(SPI_mosi_pad_o_1),
		.miso_pad_i_1(SPI_miso_pad_i_1),
		       .wb_clk_i_2(ch_clk_g_2[CH_SPI]),
		.wb_rst_i_2(ch_res_2[CH_SPI]),
		.wb_adr_i_2(wb_addr_o_2[4:0]),
		.wb_dat_i_2(wb_data_2[31:0]),
		.wb_dat_o_2(wb_dat_spi_2[31:0]),
		.wb_sel_i_2(wb_sel_o_2[3:0]),
		.wb_we_i_2(wb_we_o_2),
		.wb_stb_i_2(wb_stb_slave_2[0]),
		.wb_cyc_i_2(wb_cyc_o_2),
		.wb_ack_o_2(ack_in_2[0]),
		.wb_err_o_2(),
		.wb_int_o_2(IE_CH_2[1]),
		.ss_pad_o_2(SPI_ss_pad_o_2[7:0]),
		.sclk_pad_o_2(SPI_sclk_pad_o_2),
		.mosi_pad_o_2(SPI_mosi_pad_o_2),
		.miso_pad_i_2(SPI_miso_pad_i_2),
		       .wb_clk_i_3(ch_clk_g_3[CH_SPI]),
		.wb_rst_i_3(ch_res_3[CH_SPI]),
		.wb_adr_i_3(wb_addr_o_3[4:0]),
		.wb_dat_i_3(wb_data_3[31:0]),
		.wb_dat_o_3(wb_dat_spi_3[31:0]),
		.wb_sel_i_3(wb_sel_o_3[3:0]),
		.wb_we_i_3(wb_we_o_3),
		.wb_stb_i_3(wb_stb_slave_3[0]),
		.wb_cyc_i_3(wb_cyc_o_3),
		.wb_ack_o_3(ack_in_3[0]),
		.wb_err_o_3(),
		.wb_int_o_3(IE_CH_3[1]),
		.ss_pad_o_3(SPI_ss_pad_o_3[7:0]),
		.sclk_pad_o_3(SPI_sclk_pad_o_3),
		.mosi_pad_o_3(SPI_mosi_pad_o_3),
		.miso_pad_i_3(SPI_miso_pad_i_3)
	);

	// DAC  ///////////////////////////////////////////////
	DAC_wb_interf_tri  DAC_CH(
		.wb_clk_in_1(ch_clk_g_1[CH_DAC]),
		.wb_rst_in_1(ch_res_1[CH_DAC]),
		.wb_adr_in_1(wb_addr_o_1[4:0]),
		.wb_dat_in_1(wb_data_1[31:0]),
		.wb_sel_in_1(wb_sel_o_1[3:0]),
		.wb_we_in_1(wb_we_o_1),
		.wb_stb_in_1(wb_stb_slave_1[20]),
		.wb_cyc_in_1(wb_cyc_o_1),
		.wb_dat_out_1(wb_dat_o_1[31:0]),
		.wb_ack_out_1(ack_in_1[3]),
		.wb_err_out_1(),
		.wb_int_out_1(),
		.dac_out_1_1(anaDAC_A_1[7:0]),
		.dac_out_2_1(anaDAC_B_1[7:0]),
		.dac_out_3_1(anaDAC_C_1[7:0]),
		.dac_out_4_1(anaDAC_D_1[7:0]),
		 
		.wb_clk_in_2(ch_clk_g_2[CH_DAC]),
		.wb_rst_in_2(ch_res_2[CH_DAC]),
		.wb_adr_in_2(wb_addr_o_2[4:0]),
		.wb_dat_in_2(wb_data_2[31:0]),
		.wb_sel_in_2(wb_sel_o_2[3:0]),
		.wb_we_in_2(wb_we_o_2),
		.wb_stb_in_2(wb_stb_slave_2[20]),
		.wb_cyc_in_2(wb_cyc_o_2),
		.wb_dat_out_2(wb_dat_o_2[31:0]),
		.wb_ack_out_2(ack_in_2[3]),
		.wb_err_out_2(),
		.wb_int_out_2(),
		.dac_out_1_2(anaDAC_A_2[7:0]),
		.dac_out_2_2(anaDAC_B_2[7:0]),
		.dac_out_3_2(anaDAC_C_2[7:0]),
		.dac_out_4_2(anaDAC_D_2[7:0]),

		.wb_clk_in_3(ch_clk_g_3[CH_DAC]),
		.wb_rst_in_3(ch_res_3[CH_DAC]),
		.wb_adr_in_3(wb_addr_o_3[4:0]),
		.wb_dat_in_3(wb_data_3[31:0]),
		.wb_sel_in_3(wb_sel_o_3[3:0]),
		.wb_we_in_3(wb_we_o_3),
		.wb_stb_in_3(wb_stb_slave_3[20]),
		.wb_cyc_in_3(wb_cyc_o_3),
		.wb_dat_out_3(wb_dat_o_3[31:0]),
		.wb_ack_out_3(ack_in_3[3]),
		.wb_err_out_3(),
		.wb_int_out_3(),
		.dac_out_1_3(anaDAC_A_3[7:0]),
		.dac_out_2_3(anaDAC_B_3[7:0]),
		.dac_out_3_3(anaDAC_C_3[7:0]),
		.dac_out_4_3(anaDAC_D_3[7:0])
	);

	// JTAG  ///////////////////////////////////////////////     
	JTAG_Master_Top_tri  C67_JTAG(
		`ifdef WithSEUcounter
		.SEUclear_1(SEUclear_1),
		.SEUclear_2(SEUclear_2),
		.SEUclear_3(SEUclear_3),
		.SEU_cnt_1(SEU_cnt_1), 
		.SEU_cnt_2(SEU_cnt_2), 
		.SEU_cnt_3(SEU_cnt_3),
		`endif
		.TCK_pad_o_1(JTAG_TCK_pad_o_1),
		.TDI_pad_i_1(JTAG_TDI_pad_i_1),
		.TDO_pad_o_1(JTAG_TDO_pad_o_1),
		.TMS_pad_o_1(JTAG_TMS_pad_o_1),
		.RST_pad_o_1(JTAG_RST_pad_o_1),
		.wb_clk_i_1(ch_clk_g_1[CH_JTAG]),
		.wb_rst_i_1(ch_res_1[CH_JTAG]),
		.wb_adr_i_1(wb_addr_o_1[5:0]),
		.wb_dat_i_1(wb_data_1[31:0]),
		.wb_dat_o_1(wb_con_19_1[31:0]),
		.wb_sel_i_1(wb_sel_o_1[3:0]),
		.wb_we_i_1(wb_we_o_1),
		.wb_stb_i_1(wb_stb_slave_1[18]),
		.wb_cyc_i_1(wb_cyc_o_1),
		.wb_ack_o_1(ack_in_1[4]),
		.wb_err_o_1(),
		.wb_int_o_1(IE_CH_1[19]),

		.TCK_pad_o_2(JTAG_TCK_pad_o_2),
		.TDI_pad_i_2(JTAG_TDI_pad_i_2),
		.TDO_pad_o_2(JTAG_TDO_pad_o_2),
		.TMS_pad_o_2(JTAG_TMS_pad_o_2),
		.RST_pad_o_2(JTAG_RST_pad_o_2),
		.wb_clk_i_2(ch_clk_g_2[CH_JTAG]),
		.wb_rst_i_2(ch_res_2[CH_JTAG]),
		.wb_adr_i_2(wb_addr_o_2[5:0]),
		.wb_dat_i_2(wb_data_2[31:0]),
		.wb_dat_o_2(wb_con_19_2[31:0]),
		.wb_sel_i_2(wb_sel_o_2[3:0]),
		.wb_we_i_2(wb_we_o_2),
		.wb_stb_i_2(wb_stb_slave_2[18]),
		.wb_cyc_i_2(wb_cyc_o_2),
		.wb_ack_o_2(ack_in_2[4]),
		.wb_err_o_2(),
		.wb_int_o_2(IE_CH_2[19]),

		.TCK_pad_o_3(JTAG_TCK_pad_o_3),
		.TDI_pad_i_3(JTAG_TDI_pad_i_3),
		.TDO_pad_o_3(JTAG_TDO_pad_o_3),
		.TMS_pad_o_3(JTAG_TMS_pad_o_3),
		.RST_pad_o_3(JTAG_RST_pad_o_3),
		.wb_clk_i_3(ch_clk_g_3[CH_JTAG]),
		.wb_rst_i_3(ch_res_3[CH_JTAG]),
		.wb_adr_i_3(wb_addr_o_3[5:0]),
		.wb_dat_i_3(wb_data_3[31:0]),
		.wb_dat_o_3(wb_con_19_3[31:0]),
		.wb_sel_i_3(wb_sel_o_3[3:0]),
		.wb_we_i_3(wb_we_o_3),
		.wb_stb_i_3(wb_stb_slave_3[18]),
		.wb_cyc_i_3(wb_cyc_o_3),
		.wb_ack_o_3(ack_in_3[4]),
		.wb_err_o_3(),
		.wb_int_o_3(IE_CH_3[19])
	 );
			 
	 // GPIO  ///////////////////////////////////////////////     
	 gpio_top_tri  GPIO(
		.wb_clk_i_1(ch_clk_g_1[CH_GPIO]),
		.wb_rst_i_1(ch_res_1[CH_GPIO]),
		.wb_cyc_i_1(wb_cyc_o_1),
		.wb_adr_i_1(wb_addr_o_1[7:0]),
		.wb_dat_i_1(wb_data_1[31:0]),
		.wb_sel_i_1(wb_sel_o_1[3:0]),
		.wb_we_i_1(wb_we_o_1),
		.wb_stb_i_1(wb_stb_slave_1[1]),
		.wb_dat_o_1(wb_dat_gpio_1[31:0]),
		.wb_ack_o_1(ack_in_1[1]),
		.wb_err_o_1(),
		.wb_inta_o_1(IE_CH_1[2]),
		.GPIO_ext_pad_i_1(GPIO_ext_pad_i_1[31:0]),
		.GPIO_ext_pad_o_1(GPIO_ext_pad_o_1[31:0]),
		.GPIO_ext_padOE_o_1(GPIO_ext_padOE_o_1[31:0]),
		.GPIO_clk_pad_i_1(GPIO_clk_pad_i_1),

		.wb_clk_i_2(ch_clk_g_2[CH_GPIO]),
		.wb_rst_i_2(ch_res_2[CH_GPIO]),
		.wb_cyc_i_2(wb_cyc_o_2),
		.wb_adr_i_2(wb_addr_o_2[7:0]),
		.wb_dat_i_2(wb_data_2[31:0]),
		.wb_sel_i_2(wb_sel_o_2[3:0]),
		.wb_we_i_2(wb_we_o_2),
		.wb_stb_i_2(wb_stb_slave_2[1]),
		.wb_dat_o_2(wb_dat_gpio_2[31:0]),
		.wb_ack_o_2(ack_in_2[1]),
		.wb_err_o_2(),
		.wb_inta_o_2(IE_CH_2[2]),
		.GPIO_ext_pad_i_2(GPIO_ext_pad_i_2[31:0]),
		.GPIO_ext_pad_o_2(GPIO_ext_pad_o_2[31:0]),
		.GPIO_ext_padOE_o_2(GPIO_ext_padOE_o_2[31:0]),
		.GPIO_clk_pad_i_2(GPIO_clk_pad_i_2),

		.wb_clk_i_3(ch_clk_g_3[CH_GPIO]),
		.wb_rst_i_3(ch_res_3[CH_GPIO]),
		.wb_cyc_i_3(wb_cyc_o_3),
		.wb_adr_i_3(wb_addr_o_3[7:0]),
		.wb_dat_i_3(wb_data_3[31:0]),
		.wb_sel_i_3(wb_sel_o_3[3:0]),
		.wb_we_i_3(wb_we_o_3),
		.wb_stb_i_3(wb_stb_slave_3[1]),
		.wb_dat_o_3(wb_dat_gpio_3[31:0]),
		.wb_ack_o_3(ack_in_3[1]),
		.wb_err_o_3(),
		.wb_inta_o_3(IE_CH_3[2]),
		.GPIO_ext_pad_i_3(GPIO_ext_pad_i_3[31:0]),
		.GPIO_ext_pad_o_3(GPIO_ext_pad_o_3[31:0]),
		.GPIO_ext_padOE_o_3(GPIO_ext_padOE_o_3[31:0]),
		.GPIO_clk_pad_i_3(GPIO_clk_pad_i_3)
	 );

	   assign IE_CH_1[0] = 1'b0;
	   assign IE_CH_2[0] = 1'b0;
	   assign IE_CH_3[0] = 1'b0;

	   assign rst_el_s_1 = ~PowerUpReset_1;
	   assign rst_el_s_2 = ~PowerUpReset_2;
	   assign rst_el_s_3 = ~PowerUpReset_3;

	   assign wb_err_o_1 = 1'b0;
	   assign wb_err_o_2 = 1'b0;
	   assign wb_err_o_3 = 1'b0;
	   
	   assign Reset_BG_1 = ~reset_1;
	   assign Reset_BG_2 = ~reset_2;
	   assign Reset_BG_3 = ~reset_3;
	   
	   assign SDA_out_inv_1 = ~SDA_OUT_1;	 
	   assign SDA_out_inv_2 = ~SDA_OUT_2;	 
	   assign SDA_out_inv_3 = ~SDA_OUT_3;
	   
	   assign SCL_1 = SCL_inv_1; //26oct2015
	   assign SCL_2 = SCL_inv_2; //26oct2015
	   assign SCL_3 = SCL_inv_3; //26oct2015
	  
	   assign anaEXT_CLK_1 = anaEXT_CLK;
	   assign anaEXT_CLK_2 = anaEXT_CLK;	 
	   assign anaEXT_CLK_3 = anaEXT_CLK; 

endmodule

























