//////////////////////////////////////////////////////////////////
//                                                              //
//  Design:................GBT-SCA                              //
//  File name:.............SCA_TRI_PAD.v                        //
//  Description:...........GBT-SCA top module                   //
//                                                              //
//  Authors:...............Christian Paillard CERN PH-ESE-ME    //
//          ...............Alessandro Caratelli CERN PH-ESE-ME  //
//                                                              //
//  Version 1.0:                                                //
//    Creation date:.......01 July 2013                         //
//    Last modification:...02 June 2014                         //
//                                                              //
//  Version 2.0:                                                //
//    Creation date:.......25 September 2015                    //
//    Last modification:...16 November 2015 11.06               //
//                                                              //
//////////////////////////////////////////////////////////////////

module SCA_TOP(
	// Elink HDLC 
	input          link_clk_pad2core,
	input          link_clk_aux_pad2core,
	input          disable_Elink_aux,
	output         tx_sd_core2pad,
	output         tx_sd_aux_core2pad,
	input          rx_sd_pad2core,
	input          rx_sd_aux_pad2core,
	output  [7:0]  CRE,
	// JTAG 
	output         TCK_core2pad,
	output         TMS_core2pad,
	output         TDO_core2pad,
	input          TDI_pad2core,
	output         RST_pad_o,      
	// SPI 
	output         SPI_sclk_core2pad,
	output  [7:0]  ss_pad_o,
	input          SPI_miso_pad2core,
	output         SPI_mosi_core2pad,    
	// GPIO 
	output  [31:0] GPIO_out_core2pad,
	output  [31:0] GPIO_oe_core2pad,
	input          gpio_clk_pad2core,
	input   [31:0] GPIO_pad2core,            
	//I2C 
	output  [15:0] SCL_core2pad,
	input   [15:0] SDA_IN_pad2core,
	output  [15:0] SDA_OUT_core2pad, 
	output  [15:0] SCLEN_core2pad, 
	// Auxiliary i2c Port 
	input          auxPort_TestEn,
	input          auxPort_SCL, 
	input          auxPort_SDA_in,    
	output         auxPort_SDA_out,
	output         auxPort_SDA_oEn,
	// Analog Pads 
	input          FuseProgramPulse,  //EFuses program pulse
	input          reset_b_pad2core,  //reset pad
	input   [30:0] ADC_analog_in,     //ADC analog input
	output  [3:0]  analog2pad,        //DAC analog output
	output  [30:0] Pad_current_out,
	inout          VDD33     
	);
	     
	wire    [3:0]  adc_CalibrRegI_1;  
	wire    [3:0]  adc_CalibrRegI_2;  
	wire    [3:0]  adc_CalibrRegI_3; 
	wire    [7:0]  DAC0;
	wire    [7:0]  DAC1;
	wire    [7:0]  DAC2;
	wire    [7:0]  DAC3;
	wire           CLK; 
	wire    [3:0]  DAC_out;
	wire    [31:0] ADC_in;
	wire           PowerUpReset_1;
	wire           PowerUpReset_2;
	wire           PowerUpReset_3;
	wire           ADC_wb_RES;
	wire           ADC_wb_CLK;
	wire    [7:0]  ADC_wb_SEL;
	wire           ADC_wb_WE;
	wire           ADC_wb_STB;
	wire           ADC_wb_CYC;
	wire    [3:0]  ADC_wb_ADR;
	wire    [31:0] ADC_wb_DATi;
	wire    [31:0] ADC_wb_DATo;
	wire           ADC_wb_ACK;
	wire           ADC_wb_INT;
                                      
	TOP_core_sca_tri_r2g  TOP_core_sca_tri_r2g (
	   
		// Elink HDLC 
		.link_clk_1(link_clk_pad2core),              .link_clk_2(link_clk_pad2core),         .link_clk_3(link_clk_pad2core),
		.link_clk_aux_1(link_clk_aux_pad2core),      .link_clk_aux_2(link_clk_aux_pad2core), .link_clk_aux_3(link_clk_aux_pad2core),
		.rx_sd_1(rx_sd_pad2core),                    .rx_sd_2(rx_sd_pad2core),               .rx_sd_3(rx_sd_pad2core),
		.rx_sd_aux_1(rx_sd_aux_pad2core),            .rx_sd_aux_2(rx_sd_aux_pad2core),       .rx_sd_aux_3(rx_sd_aux_pad2core),
		.tx_sd_1(tx_sd_core2pad),                    .tx_sd_2(),                             .tx_sd_3(),
		.tx_sd_aux_1(tx_sd_aux_core2pad),            .tx_sd_aux_2(),                         .tx_sd_aux_3(),
		.tx_adr_1(8'h00),                            .tx_adr_2(8'h00),                       .tx_adr_3(8'h00),
		.CRE_1(CRE[7:0]),                            .CRE_2(),                               .CRE_3(),
		.disable_aux_1(disable_Elink_aux),           .disable_aux_2(disable_Elink_aux),      .disable_aux_3(disable_Elink_aux),
		 
		 // Reset Logic 
		.PowerUpReset_1(PowerUpReset_1),             .PowerUpReset_2(PowerUpReset_2),        .PowerUpReset_3(PowerUpReset_3),
		.PromtReset_1(1'b0),                         .PromtReset_2(1'b0),
		.Reset_BG_1(Reset_BG),                       .Reset_BG_2(),                          .Reset_BG_3(),

		// Auxiliary i2c port //
		.auxPort_TestEn_1(auxPort_TestEn),           .auxPort_TestEn_2(auxPort_TestEn),      .auxPort_TestEn_3(auxPort_TestEn),
		.auxPort_SCL_1(auxPort_SCL),                 .auxPort_SCL_2(auxPort_SCL),            .auxPort_SCL_3(auxPort_SCL),
		.auxPort_SDA_in_1(auxPort_SDA_in),           .auxPort_SDA_in_2(auxPort_SDA_in),      .auxPort_SDA_in_3(auxPort_SDA_in),
		.auxPort_SDA_out_1(auxPort_SDA_out),         .auxPort_SDA_out_2(),                   .auxPort_SDA_out_3(),
		.auxPort_SDA_oEn_1(auxPort_SDA_oEn),         .auxPort_SDA_oEn_2(),                   .auxPort_SDA_oEn_3(),
		 
		// I2C 
		.SDA_in_1(SDA_IN_pad2core[15:0]),            .SDA_in_2(SDA_IN_pad2core[15:0]),       .SDA_in_3(SDA_IN_pad2core[15:0]),
		.SDA_out_inv_1(SDA_OUT_core2pad[15:0]),      .SDA_out_inv_2(),                       .SDA_out_inv_3(),
		.SCL_1(SCL_core2pad[15:0]),                  .SCL_2(),                               .SCL_3(),
		.SCLEN_1(SCLEN_core2pad[15:0]),              .SCLEN_2(),                             .SCLEN_3(),

		// JTAG 
		.JTAG_TMS_pad_o_1(TMS_core2pad),             .JTAG_TMS_pad_o_2(),                    .JTAG_TMS_pad_o_3(),
		.JTAG_TCK_pad_o_1(TCK_core2pad),             .JTAG_TCK_pad_o_2(),                    .JTAG_TCK_pad_o_3(),
		.JTAG_TDO_pad_o_1(TDO_core2pad),             .JTAG_TDO_pad_o_2(),                    .JTAG_TDO_pad_o_3(),
		.JTAG_TDI_pad_i_1(TDI_pad2core),             .JTAG_TDI_pad_i_2(TDI_pad2core),        .JTAG_TDI_pad_i_3(TDI_pad2core),
		.JTAG_RST_pad_o_1(RST_pad_o),                .JTAG_RST_pad_o_2(),                    .JTAG_RST_pad_o_3(),

		// SPI 
		.SPI_miso_pad_i_1(SPI_miso_pad2core),        .SPI_miso_pad_i_2(SPI_miso_pad2core),   .SPI_miso_pad_i_3(SPI_miso_pad2core),
		.SPI_mosi_pad_o_1(SPI_mosi_core2pad),        .SPI_mosi_pad_o_2(),                    .SPI_mosi_pad_o_3(),
		.SPI_sclk_pad_o_1(SPI_sclk_core2pad),        .SPI_sclk_pad_o_2(),                    .SPI_sclk_pad_o_3(),
		.SPI_ss_pad_o_1(ss_pad_o[7:0]),              .SPI_ss_pad_o_2(),                      .SPI_ss_pad_o_3(),

		// GPIO 
		.GPIO_clk_pad_i_1(gpio_clk_pad2core),        .GPIO_clk_pad_i_2(gpio_clk_pad2core),   .GPIO_clk_pad_i_3(gpio_clk_pad2core),
		.GPIO_ext_pad_i_1(GPIO_pad2core[31:0]),      .GPIO_ext_pad_i_2(GPIO_pad2core[31:0]), .GPIO_ext_pad_i_3(GPIO_pad2core[31:0]),
		.GPIO_ext_padOE_o_1(GPIO_oe_core2pad[31:0]), .GPIO_ext_padOE_o_2(),                  .GPIO_ext_padOE_o_3(),
		.GPIO_ext_pad_o_1(GPIO_out_core2pad[31:0]),  .GPIO_ext_pad_o_2(),                    .GPIO_ext_pad_o_3(),

		// DAC
		.anaDAC_A_1(DAC0),                           .anaDAC_A_2(),                          .anaDAC_A_3(),
		.anaDAC_B_1(DAC1),                           .anaDAC_B_2(),                          .anaDAC_B_3(),
		.anaDAC_C_1(DAC2),                           .anaDAC_C_2(),                          .anaDAC_C_3(),
		.anaDAC_D_1(DAC3),                           .anaDAC_D_2(),                          .anaDAC_D_3(),  

		// ADC 
		.ADC_wb_RES_1(ADC_wb_RES),                   .ADC_wb_RES_2(),                        .ADC_wb_RES_3(),
		.ADC_wb_CLK_1(ADC_wb_CLK),                   .ADC_wb_CLK_2(),                        .ADC_wb_CLK_3(),
		.ADC_wb_SEL_1(),                             .ADC_wb_SEL_2(),                        .ADC_wb_SEL_3(),
		.ADC_wb_WE_1(ADC_wb_WE),                     .ADC_wb_WE_2(),                         .ADC_wb_WE_3(),
		.ADC_wb_STB_1(ADC_wb_STB),                   .ADC_wb_STB_2(),                        .ADC_wb_STB_3(),
		.ADC_wb_CYC_1(ADC_wb_CYC),                   .ADC_wb_CYC_2(),                        .ADC_wb_CYC_3(),
		.ADC_wb_ADR_1(ADC_wb_ADR),                   .ADC_wb_ADR_2(),                        .ADC_wb_ADR_3(),
		.ADC_wb_DATi_1(ADC_wb_DATi),                 .ADC_wb_DATi_2(),                       .ADC_wb_DATi_3(),
		.ADC_wb_DATo_1(ADC_wb_DATo),                 .ADC_wb_DATo_2(ADC_wb_DATo),            .ADC_wb_DATo_3(ADC_wb_DATo),
		.ADC_wb_ACK_1(ADC_wb_ACK),                   .ADC_wb_ACK_2(ADC_wb_ACK),              .ADC_wb_ACK_3(ADC_wb_ACK),
		.ADC_wb_INT_1(ADC_wb_INT),                   .ADC_wb_INT_2(ADC_wb_INT),              .ADC_wb_INT_3(ADC_wb_INT)  
	);
          
	OC_PONtop Power_on_rst (
		.globalReset(reset_b_pad2core),
		.globalResetA(PowerUpReset_1), 
		.globalResetB(PowerUpReset_2), 
		.globalResetC(PowerUpReset_3)  
	);
        
	anaBlock analog_block1 (        
		.Clk_I(ADC_wb_CLK),
		.Reset_I(ADC_wb_RES),
		.ADR_I(ADC_wb_ADR),
		.CYC_I(ADC_wb_CYC),
		.DAT_I(ADC_wb_DATi),  
		.STB_I(ADC_wb_STB),
		.WE_I(ADC_wb_WE),
		.ACK_O(ADC_wb_ACK),
		.DAT_O(ADC_wb_DATo),
		.DoneConv(ADC_wb_INT),
		.DAC0(DAC0),                      // to logic
		.DAC1(DAC1),                      // to logic
		.DAC2(DAC2),                      // to logic
		.DAC3(DAC3),                      // to logic                
		.Reset_BG(Reset_BG),              // reset band gap  negatif  doit etre present 2015
		.AVDD33(VDD33),                   // to PAD 
		.ADC_in(ADC_analog_in[30:0]),     // to PAD 
		.DAC_out(analog2pad[3:0]),        // to PAD
		.CURR_out(Pad_current_out[30:0]), // to PAD
		.FuseProgramPulse(FuseProgramPulse)
	);


endmodule 




`timescale 1ns / 1ps
module top_pad (SPI_ss_pad, TMS_pad, TDO_pad, SPI_clk_pad, RESET_B_pad,
                SPI_mosi_pad,  DAC_out_pad, TCK_pad,
                SPI_miso_pad, SCL_pad, rx_sd_aux, tx_sd_aux, tx_sd_aux_n,link_clk_n, tx_sd,
                rx_sd_n, link_clk, pwr3_3pad, ADC_in_pad, link_clk_aux_n,
                tx_sd_n, rx_sd_aux_n, link_clk_aux, SDA_pad,
                rx_sd, TDI_pad, JTAG_reset_pad, GPIO_pad, link_aux_disable_pad, FuseProgramPulse_pad,
                pad_GPIO_EXTCLK,  
                auxPortSDA_pad, auxPortSCL_pad, auxPortTestEn_pad 
                //SCAN_EN_pad,SCAN_MODE_pad,SCAN_IN_pad
                );
 
  output [7:0] SPI_ss_pad;
  wire [7:0] SPI_ss_pad;
  output TMS_pad;
  wire TMS_pad;
  output TDO_pad;
  wire TDO_pad;
  output SPI_clk_pad;
  wire SPI_clk_pad;
  input RESET_B_pad;
  wire RESET_B_pad;
  output SPI_mosi_pad;
  wire SPI_mosi_pad; 
  output [3:0] DAC_out_pad;
  wire [3:0] DAC_out_pad;
  output TCK_pad;
  wire TCK_pad;
  input SPI_miso_pad;
  wire SPI_miso_pad;
  output [15:0] SCL_pad;
  wire [15:0] SCL_pad;
  input rx_sd_aux;
  wire rx_sd_aux;
  output tx_sd_aux;
  wire tx_sd_aux;
  output tx_sd_aux_n;
  wire tx_sd_aux_n;
  input pad_GPIO_EXTCLK;
  wire pad_GPIO_EXTCLK;
  input link_aux_disable_pad;
  wire link_aux_disable_pad;
  input FuseProgramPulse_pad;
  wire FuseProgramPulse_pad;
  input link_clk_n;
  wire link_clk_n;
  output tx_sd;
  wire tx_sd;
  input rx_sd_n;
  wire rx_sd_n;
  input link_clk;
  wire link_clk;
  input pwr3_3pad;
  wire pwr3_3pad;
  input [30:0] ADC_in_pad;
  wire [30:0] ADC_in_pad;
  input link_clk_aux_n;
  wire link_clk_aux_n;
  output tx_sd_n;
  wire tx_sd_n;
  input rx_sd_aux_n;
  wire rx_sd_aux_n;
  input link_clk_aux;
  wire link_clk_aux;
  inout [15:0] SDA_pad;
  wire [15:0] SDA_pad;
  input rx_sd;
  wire rx_sd;
  input TDI_pad;
  wire TDI_pad;
  output JTAG_reset_pad;
  wire JTAG_reset_pad;
  inout [31:0] GPIO_pad;
  wire [31:0] GPIO_pad;
  wire [15:0] SDA_OUT_core2pad;
  wire [15:0] SDA_IN_pad2core;
  wire [15:0] SCL_core2pad;
  wire SPI_miso_pad2core;
  wire [31:0] GPIO_oe_core2pad;
  wire TCK_core2pad;
  wire [3:0] analog2pad;
  wire TDI_pad2core;
  wire rx_sd_pad2core;
  wire TDO_core2pad;
  wire pad_GPIO_EXTCLK_pad2core;
  wire link_clk_pad2core;
  wire rx_sd_aux_pad2core;
  wire [31:0] GPIO_pad2core;
  wire reset_b_pad2core;
  wire [7:0] CRE;
  wire SPI_mosi_core2pad;
  wire TMS_core2pad;
  wire RST_pad_o;
  wire [7:0] ss_pad_o;
  wire SPI_sclk_core2pad;
  wire [31:0] GPIO_out_core2pad;
  wire tx_sd_aux_core2pad;
  wire tx_sd_core2pad;
  wire [30:0] ADC_analog_in;
  wire [30:0] Pad_current_out;  //------------------------2015
  wire link_clk_aux_pad2core;
  wire DVDD;  
  wire DVSS;
  wire AGND;
  wire AVDD;
  wire GND;
  wire VDD33;
  wire auxPort_TestEn_pad2core;
  wire auxPort_SCL_pad2core;
  wire auxPort_SDA_in_pad2core;   
  wire auxPort_SDA_out_core2pad;
  wire auxPort_SDA_oEn_core2pad; 
  inout auxPortSDA_pad;
  wire  auxPortSDA_pad;
  input auxPortSCL_pad;
  wire  auxPortSCL_pad;
  input auxPortTestEn_pad;
  wire  auxPortTestEn_pad;
  wire  [15:0] SCLEN_core2pad;
     
     
      
SCA_TOP SCA_TOP(
        // Elink HDLC //////////////////////////
        .link_clk_pad2core(link_clk_pad2core),
        .link_clk_aux_pad2core(link_clk_aux_pad2core),
        .disable_Elink_aux(disable_Elink_aux),
        .tx_sd_core2pad(tx_sd_core2pad),
        .tx_sd_aux_core2pad(tx_sd_aux_core2pad),
        .rx_sd_pad2core(rx_sd_pad2core),
        .rx_sd_aux_pad2core(rx_sd_aux_pad2core),
        .CRE(CRE),
        // JTAG ////////////////////////////////
        .TCK_core2pad(TCK_core2pad),
        .TMS_core2pad(TMS_core2pad),
        .TDO_core2pad(TDO_core2pad),
        .TDI_pad2core(TDI_pad2core),
        .RST_pad_o(RST_pad_o),      
        // SPI /////////////////////////////////
        .SPI_sclk_core2pad(SPI_sclk_core2pad),
        .ss_pad_o(ss_pad_o),
        .SPI_miso_pad2core(SPI_miso_pad2core),
        .SPI_mosi_core2pad(SPI_mosi_core2pad),    
        // GPIO ////////////////////////////////
        .GPIO_out_core2pad(GPIO_out_core2pad),
        .GPIO_oe_core2pad(GPIO_oe_core2pad),
        .gpio_clk_pad2core(pad_GPIO_EXTCLK_pad2core),
        .GPIO_pad2core(GPIO_pad2core),       
        //I2C //////////////////////////////////
        .SCL_core2pad(SCL_core2pad),
        .SDA_IN_pad2core(SDA_IN_pad2core),
        .SDA_OUT_core2pad(SDA_OUT_core2pad), 
	.SCLEN_core2pad(SCLEN_core2pad), 
        // Analog Pads /////////////////////////
        .FuseProgramPulse(FuseProgramPulse),//EFuses program pulse
	.VDD33(VDD33),   // 2015
        .reset_b_pad2core(reset_b_pad2core),//reset pad
        .ADC_analog_in(ADC_analog_in),//ADC analog input
	.Pad_current_out(Pad_current_out),    //---------------2015
        .analog2pad(analog2pad),
        // Auxiliary i2c port /////////////////
        .auxPort_TestEn(auxPort_TestEn_pad2core),  
        .auxPort_SCL(auxPort_SCL_pad2core),        
        .auxPort_SDA_in(auxPort_SDA_in_pad2core),  
        .auxPort_SDA_out(auxPort_SDA_out_core2pad),
        .auxPort_SDA_oEn(auxPort_SDA_oEn_core2pad)
  );


  
  SIOB04_B  PAD_AUX_SDA //inout
    (
     .PAD(auxPortSDA_pad),
     .Z(),
     .ZH(auxPort_SDA_in_pad2core),
     .A(auxPort_SDA_out_core2pad),
     .RG(1'b1),
     .TS(auxPort_SDA_oEn_core2pad)
     );
 
   SIOB04_B  PAD_AUX_SCL //in
    (
     .PAD(auxPortSCL_pad),
     .Z(),
     .ZH(auxPort_SCL_pad2core),
     .A(1'b0),
     .RG(1'b1),
     .TS(1'b0)
     );
 
    SIOB04_B  PAD_AUX_EN //in
    (
     .PAD(auxPortTestEn_pad),
     .Z(),
     .ZH(auxPort_TestEn_pad2core),
     .A(1'b0),
     .RG(1'b1),
     .TS(1'b0)
     );

   
   
   
   
   
   
   SIOB08_B  PAD_I2C_CLK15//modif 26october2015
    (
     .PAD(SCL_pad[15]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[15]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[15])
     );
 
  SIOB08_B  PAD_I2C_CLK14//modif 26october2015
    (
     .PAD(SCL_pad[14]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[14]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[14])
     );
 
  SIOB08_B  PAD_I2C_CLK13//modif 26october2015
    (
     .PAD(SCL_pad[13]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[13]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[13])
     );
 
  SIOB08_B  PAD_I2C_CLK12//modif 26october2015
    (
     .PAD(SCL_pad[12]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[12]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[12])
     );
 
  SIOB08_B  PAD_I2C_CLK11//modif 26october2015
    (
     .PAD(SCL_pad[11]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[11]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[11])
     );
 
  SIOB08_B  PAD_I2C_CLK10//modif 26october2015
    (
     .PAD(SCL_pad[10]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[10]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[10])
     );
 
  SIOB08_B  PAD_I2C_CLK9//modif 26october2015
    (
     .PAD(SCL_pad[9]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[9]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[9])
     );
 
  SIOB08_B  PAD_I2C_CLK8//modif 26october2015
    (
     .PAD(SCL_pad[8]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[8]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[8])
     );
 
  SIOB08_B  PAD_I2C_CLK7//modif 26october2015
    (
     .PAD(SCL_pad[7]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[7]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[7])
     );
 
  SIOB08_B  PAD_I2C_CLK6//modif 26october2015
    (
     .PAD(SCL_pad[6]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[6]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[6])
     );
 
  SIOB08_B  PAD_I2C_CLK5//modif 26october2015
    (
     .PAD(SCL_pad[5]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[5]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[5])
     );
 
  SIOB08_B  PAD_I2C_CLK4//modif 26october2015
    (
     .PAD(SCL_pad[4]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[4]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[4])
     );
 
  SIOB08_B  PAD_I2C_CLK3//modif 26october2015
    (
     .PAD(SCL_pad[3]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[3]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[3])
     );
 
  SIOB08_B  PAD_I2C_CLK2//modif 26october2015
    (
     .PAD(SCL_pad[2]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[2]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[2])
     );
 
  SIOB08_B  PAD_I2C_CLK1//modif 26october2015
    (
     .PAD(SCL_pad[1]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[1]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[1])
     );
 
  SIOB08_B  PAD_I2C_CLK0  //modif 26october2015
    (
     .PAD(SCL_pad[0]),
     .Z(),
     .ZH(),
     .A(SCL_core2pad[0]),
     .RG(1'b0),
     .TS(SCLEN_core2pad[0])
     ); 
   
   
   
   
   
   
   
   
   
   
   
   

  SIOB04_B  PAD_GPIO31
    (
     .PAD(GPIO_pad[31]),
     .Z(),
     .ZH(GPIO_pad2core[31]),
     .A(GPIO_out_core2pad[31]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[31])
     );
 
  SIOB04_B  PAD_GPIO30
    (
     .PAD(GPIO_pad[30]),
     .Z(),
     .ZH(GPIO_pad2core[30]),
     .A(GPIO_out_core2pad[30]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[30])
     );
 
  SIOB04_B  PAD_GPIO29
    (
     .PAD(GPIO_pad[29]),
     .Z(),
     .ZH(GPIO_pad2core[29]),
     .A(GPIO_out_core2pad[29]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[29])
     );
 
  SIOB04_B  PAD_GPIO28
    (
     .PAD(GPIO_pad[28]),
     .Z(),
     .ZH(GPIO_pad2core[28]),
     .A(GPIO_out_core2pad[28]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[28])
     );
 
  SIOB04_B  PAD_GPIO27
    (
     .PAD(GPIO_pad[27]),
     .Z(),
     .ZH(GPIO_pad2core[27]),
     .A(GPIO_out_core2pad[27]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[27])
     );
 
  SIOB04_B  PAD_GPIO26
    (
     .PAD(GPIO_pad[26]),
     .Z(),
     .ZH(GPIO_pad2core[26]),
     .A(GPIO_out_core2pad[26]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[26])
     );
 
  SIOB04_B  PAD_GPIO25
    (
     .PAD(GPIO_pad[25]),
     .Z(),
     .ZH(GPIO_pad2core[25]),
     .A(GPIO_out_core2pad[25]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[25])
     );
 
  SIOB04_B  PAD_GPIO24
    (
     .PAD(GPIO_pad[24]),
     .Z(),
     .ZH(GPIO_pad2core[24]),
     .A(GPIO_out_core2pad[24]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[24])
     );
 
  SIOB04_B  PAD_GPIO23
    (
     .PAD(GPIO_pad[23]),
     .Z(),
     .ZH(GPIO_pad2core[23]),
     .A(GPIO_out_core2pad[23]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[23])
     );
 
  SIOB04_B  PAD_GPIO22
    (
     .PAD(GPIO_pad[22]),
     .Z(),
     .ZH(GPIO_pad2core[22]),
     .A(GPIO_out_core2pad[22]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[22])
     );
 
  SIOB04_B  PAD_GPIO21
    (
     .PAD(GPIO_pad[21]),
     .Z(),
     .ZH(GPIO_pad2core[21]),
     .A(GPIO_out_core2pad[21]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[21])
     );
 
  SIOB04_B  PAD_GPIO20
    (
     .PAD(GPIO_pad[20]),
     .Z(),
     .ZH(GPIO_pad2core[20]),
     .A(GPIO_out_core2pad[20]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[20])
     );
 
  SIOB04_B  PAD_GPIO19
    (
     .PAD(GPIO_pad[19]),
     .Z(),
     .ZH(GPIO_pad2core[19]),
     .A(GPIO_out_core2pad[19]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[19])
     );
 
  SIOB04_B  PAD_GPIO18
    (
     .PAD(GPIO_pad[18]),
     .Z(),
     .ZH(GPIO_pad2core[18]),
     .A(GPIO_out_core2pad[18]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[18])
     );
 
  SIOB04_B  PAD_GPIO17
    (
     .PAD(GPIO_pad[17]),
     .Z(),
     .ZH(GPIO_pad2core[17]),
     .A(GPIO_out_core2pad[17]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[17])
     );
 
  SIOB04_B  PAD_GPIO16
    (
     .PAD(GPIO_pad[16]),
     .Z(),
     .ZH(GPIO_pad2core[16]),
     .A(GPIO_out_core2pad[16]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[16])
     );
 
  SIOB04_B  PAD_GPIO15
    (
     .PAD(GPIO_pad[15]),
     .Z(),
     .ZH(GPIO_pad2core[15]),
     .A(GPIO_out_core2pad[15]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[15])
     );
 
  SIOB04_B  PAD_GPIO14
    (
     .PAD(GPIO_pad[14]),
     .Z(),
     .ZH(GPIO_pad2core[14]),
     .A(GPIO_out_core2pad[14]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[14])
     );
 
  SIOB04_B  PAD_GPIO13
    (
     .PAD(GPIO_pad[13]),
     .Z(),
     .ZH(GPIO_pad2core[13]),
     .A(GPIO_out_core2pad[13]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[13])
     );
 
  SIOB04_B  PAD_GPIO12
    (
     .PAD(GPIO_pad[12]),
     .Z(),
     .ZH(GPIO_pad2core[12]),
     .A(GPIO_out_core2pad[12]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[12])
     );
 
  SIOB04_B  PAD_GPIO11
    (
     .PAD(GPIO_pad[11]),
     .Z(),
     .ZH(GPIO_pad2core[11]),
     .A(GPIO_out_core2pad[11]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[11])
     );
 
  SIOB04_B  PAD_GPIO10
    (
     .PAD(GPIO_pad[10]),
     .Z(),
     .ZH(GPIO_pad2core[10]),
     .A(GPIO_out_core2pad[10]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[10])
     );
 
  SIOB04_B  PAD_GPIO9
    (
     .PAD(GPIO_pad[9]),
     .Z(),
     .ZH(GPIO_pad2core[9]),
     .A(GPIO_out_core2pad[9]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[9])
     );
 
  SIOB04_B  PAD_GPIO8
    ( 
     .PAD(GPIO_pad[8]),
     .Z(),
     .ZH(GPIO_pad2core[8]),
     .A(GPIO_out_core2pad[8]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[8])
     );
 
  SIOB04_B  PAD_GPIO7
    (
     .PAD(GPIO_pad[7]),
     .Z(),
     .ZH(GPIO_pad2core[7]),
     .A(GPIO_out_core2pad[7]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[7])
     );
 
  SIOB04_B  PAD_GPIO6
    (
     .PAD(GPIO_pad[6]),
     .Z(),
     .ZH(GPIO_pad2core[6]),
     .A(GPIO_out_core2pad[6]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[6])
     );
 
  SIOB04_B  PAD_GPIO5
    (
     .PAD(GPIO_pad[5]),
     .Z(),
     .ZH(GPIO_pad2core[5]),
     .A(GPIO_out_core2pad[5]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[5])
     );
 
  SIOB04_B  PAD_GPIO4
    (
     .PAD(GPIO_pad[4]),
     .Z(),
     .ZH(GPIO_pad2core[4]),
     .A(GPIO_out_core2pad[4]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[4])
     );
 
  SIOB04_B  PAD_GPIO3
    (
     .PAD(GPIO_pad[3]),
     .Z(),
     .ZH(GPIO_pad2core[3]),
     .A(GPIO_out_core2pad[3]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[3])
     );
 
  SIOB04_B  PAD_GPIO2
    (
     .PAD(GPIO_pad[2]),
     .Z(),
     .ZH(GPIO_pad2core[2]),
     .A(GPIO_out_core2pad[2]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[2])
     );
 
  SIOB04_B  PAD_GPIO1
    (
     .PAD(GPIO_pad[1]),
     .Z(),
     .ZH(GPIO_pad2core[1]),
     .A(GPIO_out_core2pad[1]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[1])
     );
 
  SIOB04_B  PAD_GPIO0
    (
     .PAD(GPIO_pad[0]),
     .Z(),
     .ZH(GPIO_pad2core[0]),
     .A(GPIO_out_core2pad[0]),
     .RG(1'b1),
     .TS(GPIO_oe_core2pad[0])
     );
 
  SIOB08_B  PAD_I2C_SDA15
    (
     .PAD(SDA_pad[15]),
     .Z(),
     .ZH(SDA_IN_pad2core[15]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[15])
     );
 
  SIOB08_B  PAD_I2C_SDA14
    (
     .PAD(SDA_pad[14]),
     .Z(),
     .ZH(SDA_IN_pad2core[14]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[14])
     );
 
  SIOB08_B  PAD_I2C_SDA13
    (
     .PAD(SDA_pad[13]),
     .Z(),
     .ZH(SDA_IN_pad2core[13]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[13])
     );
 
  SIOB08_B  PAD_I2C_SDA12
    (
     .PAD(SDA_pad[12]),
     .Z(),
     .ZH(SDA_IN_pad2core[12]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[12])
     );
 
  SIOB08_B  PAD_I2C_SDA11
    (
     .PAD(SDA_pad[11]),
     .Z(),
     .ZH(SDA_IN_pad2core[11]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[11])
     );
 
  SIOB08_B  PAD_I2C_SDA10
    (
     .PAD(SDA_pad[10]),
     .Z(),
     .ZH(SDA_IN_pad2core[10]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[10])
     );
 
  SIOB08_B  PAD_I2C_SDA9
    (
     .PAD(SDA_pad[9]),
     .Z(),
     .ZH(SDA_IN_pad2core[9]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[9])
     );
 
  SIOB08_B  PAD_I2C_SDA8
    (
     .PAD(SDA_pad[8]),
     .Z(),
     .ZH(SDA_IN_pad2core[8]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[8])
     );
 
  SIOB08_B  PAD_I2C_SDA7
    (
     .PAD(SDA_pad[7]),
     .Z(),
     .ZH(SDA_IN_pad2core[7]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[7])
     );
 
  SIOB08_B  PAD_I2C_SDA6
    (
     .PAD(SDA_pad[6]),
     .Z(),
     .ZH(SDA_IN_pad2core[6]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[6])
     );
 
  SIOB08_B  PAD_I2C_SDA5
    (
     .PAD(SDA_pad[5]),
     .Z(),
     .ZH(SDA_IN_pad2core[5]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[5])
     );
 
  SIOB08_B  PAD_I2C_SDA4
    (
     .PAD(SDA_pad[4]),
     .Z(),
     .ZH(SDA_IN_pad2core[4]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[4])
     );
 
  SIOB08_B  PAD_I2C_SDA3
    (
     .PAD(SDA_pad[3]),
     .Z(),
     .ZH(SDA_IN_pad2core[3]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[3])
     );
 
  SIOB08_B  PAD_I2C_SDA2
    (
     .PAD(SDA_pad[2]),
     .Z(),
     .ZH(SDA_IN_pad2core[2]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[2])
     );
 
  SIOB08_B  PAD_I2C_SDA1
    (
     .PAD(SDA_pad[1]),
     .Z(),
     .ZH(SDA_IN_pad2core[1]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[1])
     );
 
  SIOB08_B  PAD_I2C_SDA0
    (
     .PAD(SDA_pad[0]),
     .Z(),
     .ZH(SDA_IN_pad2core[0]),
     .A(1'b0),
     .RG(1'b1),
     .TS(SDA_OUT_core2pad[0])
     );
 
  SIOB12_B  PAD_JTAG_TMS
    (
     .PAD(TMS_pad),
     .Z(),
     .ZH(),
     .A(TMS_core2pad),
     .RG(1'b0),
     .TS(1'b1)
     );
 
  SIOB12_B  PAD_JTAG_TCK
    (
     .PAD(TCK_pad),
     .Z(),
     .ZH(),
     .A(TCK_core2pad),
     .RG(1'b0),
     .TS(1'b1)
     );
 
  SIOB12_B  PAD_JTAG_TDO
    (
     .PAD(TDO_pad),
     .Z(),
     .ZH(),
     .A(TDO_core2pad),
     .RG(1'b0),
     .TS(1'b1)
     );
 
  SIOB12_B  PAD_SPI_clk /////////////////////////// 18nov
    (
     .PAD(SPI_clk_pad),
     .Z(),
     .ZH(),
     .A(SPI_sclk_core2pad),
     .RG(1'b0),
     .TS(1'b1)
     );
 
  SIOB12_B  PAD_SPI_mosi
    (
     .PAD(SPI_mosi_pad),
     .Z(),
     .ZH(),
     .A(SPI_mosi_core2pad),
     .RG(1'b0),
     .TS(1'b1)
     );
 
  SIOB12_B  PAD_SPI_miso
    (
     .PAD(SPI_miso_pad),
     .Z(),
     .ZH(SPI_miso_pad2core),
     .A(1'b0),
     .RG(1'b1),
     .TS(1'b0)
     );
 
  SIOB04_B  PAD_SPI_ss7
    (
     .PAD(SPI_ss_pad[7]),
     .Z(),
     .ZH(),
     .A(ss_pad_o[7]),
     .RG(1'b0),
     .TS(1'b1)
     );
 
  SIOB04_B  PAD_SPI_ss6
    (
     .PAD(SPI_ss_pad[6]),
     .Z(),
     .ZH(),
     .A(ss_pad_o[6]),
     .RG(1'b0),
     .TS(1'b1)
     );
 
  SIOB04_B  PAD_SPI_ss5
    (
     .PAD(SPI_ss_pad[5]),
     .Z(),
     .ZH(),
     .A(ss_pad_o[5]),
     .RG(1'b0),
     .TS(1'b1)
     );
 
  SIOB04_B  PAD_SPI_ss4
    (
     .PAD(SPI_ss_pad[4]),
     .Z(),
     .ZH(),
     .A(ss_pad_o[4]),
     .RG(1'b0),
     .TS(1'b1)
     );
 
  SIOB04_B  PAD_SPI_ss3
    (
     .PAD(SPI_ss_pad[3]),
     .Z(),
     .ZH(),
     .A(ss_pad_o[3]),
     .RG(1'b0),
     .TS(1'b1)
     );
 
  SIOB04_B  PAD_SPI_ss2
    (
     .PAD(SPI_ss_pad[2]),
     .Z(),
     .ZH(),
     .A(ss_pad_o[2]),
     .RG(1'b0),
     .TS(1'b1)
     );
 
  SIOB04_B  PAD_SPI_ss1
    (
     .PAD(SPI_ss_pad[1]),
     .Z(),
     .ZH(),
     .A(ss_pad_o[1]),
     .RG(1'b0),
     .TS(1'b1)
     );
 
  SIOB04_B  PAD_SPI_ss0
    (
     .PAD(SPI_ss_pad[0]),
     .Z(),
     .ZH(),
     .A(ss_pad_o[0]),
     .RG(1'b0),
     .TS(1'b1)
     );
 
  SIOB12_B  PAD_JTAG_TDI
    (
     .PAD(TDI_pad),
     .Z(),
     .ZH(TDI_pad2core),
     .A(1'b0),
     .RG(1'b1),
     .TS(1'b0)
     );
 
  Eport_TX  PAD_TX_SD
    (
     .outp(tx_sd),
     .in(tx_sd_core2pad),
     .cset(CRE[3:0]),
     .off(),
     .outn(tx_sd_n),
     .DVSS(DVSS),
     .DVDD(DVDD)
     );
 
  Eport_TX  PAD_TX_SD_AUX
    (
     .outp(tx_sd_aux),
     .in(tx_sd_aux_core2pad),
     .cset(CRE[3:0]),
     .off(),
     .outn(tx_sd_aux_n),
     .DVSS(DVSS),
     .DVDD(DVDD)
     );
 
  wire term_clk_ctrl;
  NAND2_B test_term_clk_nand(.A (disable_Elink_aux), .B (auxPort_TestEn_pad2core), .Z (term_clk_ctrl)); 
   
  Eport_RX  PAD_LINK_CLK
    (
     .inn(link_clk_n),
     .term(term_clk_ctrl),
     .inp(link_clk),
     .DVDD(DVDD),
     .off(1'b0),
     .DVSS(DVSS),
     .out(link_clk_pad2core)
     );
 
  Eport_RX  PAD_LINK_CLK_AUX
    (
     .inn(link_clk_aux_n),
     .term(1'b1),
     .inp(link_clk_aux),
     .DVDD(DVDD),
     .off(1'b0),
     .DVSS(DVSS),
     .out(link_clk_aux_pad2core)
     );
 
  Eport_RX  PAD_RX_SD
    (
     .inn(rx_sd_n),
     .term(1'b1),
     .inp(rx_sd),
     .DVDD(DVDD),
     .off(1'b0),
     .DVSS(DVSS),
     .out(rx_sd_pad2core)
     );

   SIOB04_B  PAD_LINK_AUX_DISABLE
    (
     .PAD(link_aux_disable_pad),
     .Z(),
     .ZH(disable_Elink_aux),
     .A(1'b0),
     .RG(1'b1),
     .TS(1'b0)
     );

   SIOB04_B  PAD_FUSE_PRG
    (
     .PAD(FuseProgramPulse_pad),
     .Z(),
     .ZH(FuseProgramPulse),
     .A(1'b0),
     .RG(1'b1),
     .TS(1'b0)
     );


  SIOVDD  PAD_VDD3
    (
 
     );
 
  SIOVDD  PAD_VDD2
    (
 
     );
 
  SIOVDD  PAD_VDD1
    (
 
     );
 
  SIOVDD  PAD_VDD0
    (
 
     );
 
  SIOGND  PAD_GND3
    (
 
     );
 
  SIOGND  PAD_GND2
    (
 
     );
 
  SIOGND  PAD_GND1
    (
 
     );
 
  SIOGND  PAD_GND0
    (
 
     );
 
  SIOWIRE_ESD_CDM_SB  PAD_DAC_OUT3
    (
     .PT(analog2pad[3]),
     .PAD(DAC_out_pad[3])
     );
 
 
  SIOWIRE_ESD_CDM_SB  PAD_DAC_OUT2
    (
     .PT(analog2pad[2]),
     .PAD(DAC_out_pad[2])
     );
 
  SIOWIRE_ESD_CDM_SB  PAD_DAC_OUT1
    (
     .PT(analog2pad[1]),
     .PAD(DAC_out_pad[1])
     );
 
  SIOWIRE_ESD_CDM_SB  PAD_DAC_OUT0
    (
     .PT(analog2pad[0]),
     .PAD(DAC_out_pad[0])
     );
 
  SIODVDD  PAD_DVDD5
    (
 
     );
 
  SIODVDD  PAD_DVDD4
    (
 
     );
 
  SIODVDD  PAD_DVDD3
    (
 
     );
 
  SIODVDD  PAD_DVDD2
    (
 
     );
 
  SIODVDD  PAD_DVDD1
    (
 
     );
 
  SIODVDD  PAD_DVDD0
    (
 
     );
 
  SIODVSS  PAD_DVSS5
    (
 
     );
 
  SIODVSS  PAD_DVSS4
    (
 
     );
 
  SIODVSS  PAD_DVSS3
    (
 
     );
 
  SIODVSS  PAD_DVSS2
    (
 
     );
 
  SIODVSS  PAD_DVSS1
    (
 
     );
 
  SIODVSS  PAD_DVSS0
    (
 
     );
 
   SIOAGND_SB  PAD_AGND2
    (
     .GND(AGND),
     .DVSS(AGND)
     );
 
//  SIOWIRE_ESD_CDM_SB  PAD_ADC_EXTRES
//    (
//     .PT(resOut_pad2core),
//     .PAD(pad_resOut)
//     );
 
SIO_ANALOG_INPAD   PAD_ADC_IN30
    (
     .PT(ADC_analog_in[30]),
     .PAD(ADC_in_pad[30]),
     .CurrentOut(Pad_current_out[30])     
     );
 
SIO_ANALOG_INPAD   PAD_ADC_IN29
    (
     .PT(ADC_analog_in[29]),
     .PAD(ADC_in_pad[29]),
     .CurrentOut(Pad_current_out[29])       
     );
 
SIO_ANALOG_INPAD   PAD_ADC_IN28
    (
     .PT(ADC_analog_in[28]),
     .PAD(ADC_in_pad[28]),
     .CurrentOut(Pad_current_out[28])      
     );
 
SIO_ANALOG_INPAD   PAD_ADC_IN27
    (
     .PT(ADC_analog_in[27]),
     .PAD(ADC_in_pad[27]),
     .CurrentOut(Pad_current_out[27])     
     );
 
SIO_ANALOG_INPAD   PAD_ADC_IN26
    (
     .PT(ADC_analog_in[26]),
     .PAD(ADC_in_pad[26]),
     .CurrentOut(Pad_current_out[26])      
     );
 
SIO_ANALOG_INPAD    PAD_ADC_IN25
    (
     .PT(ADC_analog_in[25]),
     .PAD(ADC_in_pad[25]),
     .CurrentOut(Pad_current_out[25])       
     );
 
SIO_ANALOG_INPAD    PAD_ADC_IN24
    (
     .PT(ADC_analog_in[24]),
     .PAD(ADC_in_pad[24]),
     .CurrentOut(Pad_current_out[24])      
     );
 
SIO_ANALOG_INPAD    PAD_ADC_IN23
    (
     .PT(ADC_analog_in[23]),
     .PAD(ADC_in_pad[23]),
     .CurrentOut(Pad_current_out[23])        
     );
 
SIO_ANALOG_INPAD   PAD_ADC_IN22
    (
     .PT(ADC_analog_in[22]),
     .PAD(ADC_in_pad[22]),
     .CurrentOut(Pad_current_out[22])        
     );
 
SIO_ANALOG_INPAD   PAD_ADC_IN21
    (
     .PT(ADC_analog_in[21]),
     .PAD(ADC_in_pad[21]),
     .CurrentOut(Pad_current_out[21])      
     );
 
SIO_ANALOG_INPAD   PAD_ADC_IN20
    (
     .PT(ADC_analog_in[20]),
     .PAD(ADC_in_pad[20]),
     .CurrentOut(Pad_current_out[20])      
     );
 
SIO_ANALOG_INPAD  PAD_ADC_IN19
    (
     .PT(ADC_analog_in[19]),
     .PAD(ADC_in_pad[19]),
     .CurrentOut(Pad_current_out[19])       
     );
 
SIO_ANALOG_INPAD  PAD_ADC_IN18
    (
     .PT(ADC_analog_in[18]),
     .PAD(ADC_in_pad[18]),
     .CurrentOut(Pad_current_out[18])      
     );
 
SIO_ANALOG_INPAD    PAD_ADC_IN17
    (
     .PT(ADC_analog_in[17]),
     .PAD(ADC_in_pad[17]),
     .CurrentOut(Pad_current_out[17])       
     );
 
SIO_ANALOG_INPAD      PAD_ADC_IN16
    (
     .PT(ADC_analog_in[16]),
     .PAD(ADC_in_pad[16]),
     .CurrentOut(Pad_current_out[16])       
     );
 
SIO_ANALOG_INPAD     PAD_ADC_IN15
    (
     .PT(ADC_analog_in[15]),
     .PAD(ADC_in_pad[15]),
     .CurrentOut(Pad_current_out[15])     
     );
 
SIO_ANALOG_INPAD      PAD_ADC_IN14
    (
     .PT(ADC_analog_in[14]),
     .PAD(ADC_in_pad[14]),
     .CurrentOut(Pad_current_out[14])      
     );
 
SIO_ANALOG_INPAD     PAD_ADC_IN13
    (
     .PT(ADC_analog_in[13]),
     .PAD(ADC_in_pad[13]),
     .CurrentOut(Pad_current_out[13])      
     );
 
SIO_ANALOG_INPAD    PAD_ADC_IN12
    (
     .PT(ADC_analog_in[12]),
     .PAD(ADC_in_pad[12]),
     .CurrentOut(Pad_current_out[12])       
     );
 
SIO_ANALOG_INPAD    PAD_ADC_IN11
    (
     .PT(ADC_analog_in[11]),
     .PAD(ADC_in_pad[11]),
     .CurrentOut(Pad_current_out[11])      
     );
 
SIO_ANALOG_INPAD     PAD_ADC_IN10
    (
     .PT(ADC_analog_in[10]),
     .PAD(ADC_in_pad[10]),
     .CurrentOut(Pad_current_out[10])      
     );
 
SIO_ANALOG_INPAD      PAD_ADC_IN9
    (
     .PT(ADC_analog_in[9]),
     .PAD(ADC_in_pad[9]),
     .CurrentOut(Pad_current_out[9])         
     );
 
SIO_ANALOG_INPAD     PAD_ADC_IN8
    (
     .PT(ADC_analog_in[8]),
     .PAD(ADC_in_pad[8]),
     .CurrentOut(Pad_current_out[8])       
     );
 
SIO_ANALOG_INPAD     PAD_ADC_IN7
    (
     .PT(ADC_analog_in[7]),
     .PAD(ADC_in_pad[7]),
     .CurrentOut(Pad_current_out[7])       
     );
 
SIO_ANALOG_INPAD    PAD_ADC_IN6
    (
     .PT(ADC_analog_in[6]),
     .PAD(ADC_in_pad[6]),
     .CurrentOut(Pad_current_out[6])          
     );
 
SIO_ANALOG_INPAD    PAD_ADC_IN5
    (
     .PT(ADC_analog_in[5]),
     .PAD(ADC_in_pad[5]),
     .CurrentOut(Pad_current_out[5])       
     );
 
SIO_ANALOG_INPAD    PAD_ADC_IN4
    (
     .PT(ADC_analog_in[4]),
     .PAD(ADC_in_pad[4]),
     .CurrentOut(Pad_current_out[4])      
     );
 
SIO_ANALOG_INPAD     PAD_ADC_IN3
    (
     .PT(ADC_analog_in[3]),
     .PAD(ADC_in_pad[3]),
     .CurrentOut(Pad_current_out[3])      
     );
 
SIO_ANALOG_INPAD     PAD_ADC_IN2
    (
     .PT(ADC_analog_in[2]),
     .PAD(ADC_in_pad[2]),
     .CurrentOut(Pad_current_out[2])     
     );
 
SIO_ANALOG_INPAD     PAD_ADC_IN1
    (
     .PT(ADC_analog_in[1]),
     .PAD(ADC_in_pad[1]),
     .CurrentOut(Pad_current_out[1])     
     );
 
/*  SIOWIRE_ESD_CDM_SB  PAD_ADC_IN0
    (
     .PT(ADC_analog_in[0]),
     .PAD(ADC_in_pad[0])
     );
------------------------2015---------------*/
 
SIO_ANALOG_INPAD  PAD_ADC_IN0
    (
     .PT(ADC_analog_in[0]),
     .PAD(ADC_in_pad[0]),
     .CurrentOut(Pad_current_out[0])
     ); 

 
 
   SIOB04_B  PAD_GPIO_EXTCLK
    (
     .PAD(pad_GPIO_EXTCLK),
     .Z(),
     .ZH(pad_GPIO_EXTCLK_pad2core),
     .A(1'b0),
     .RG(1'b1),
     .TS(1'b0)
     );       

  SIOVDD  PAD_AVDD1
    (
      .VDD(AVDD)
     );
 
  SIOVDD  PAD_AVDD0
    (
      .VDD(AVDD)
     );
 
  SIOAGND_SB  PAD_AGND1
    (
      .GND(AGND),
     .DVSS(AGND)
     );
 
  SIOAGND_SB  PAD_AGND0
    (
     .GND(AGND),
     .DVSS(AGND) 
     );
 
  SIOB04_B  PAD_RESET_B
    (
     .PAD(RESET_B_pad),
     .Z(),
     .ZH(reset_b_pad2core),
     .A(1'b0),
     .RG(1'b1),
     .TS(1'b0)
     );
 
  SIOWIRE_ESD33  PAD_3_3V
    (
     .PT(VDD33),  //.PT(pwr_3_3pad2core),
     .PAD(pwr3_3pad),
     .DVSS(DVSS)
     );
 
  SIOB12_B  PAD_JTAG_RST
    (
     .PAD(JTAG_reset_pad),
     .Z(),
     .ZH(),
     .A(RST_pad_o),
     .RG(1'b0),
     .TS(1'b1)
     );
 

    
  Eport_RX  PAD_RX_SD_AUX
    (
     .inn(rx_sd_aux_n),
     .term(1'b1),
     .inp(rx_sd_aux),
     .DVDD(DVDD),
     .off(1'b0),
     .DVSS(DVSS),
     .out(rx_sd_aux_pad2core)
     );
 
  SIOBREAK_SB  BREAK1
    (
     .DVSS(DVSS),
     .DVSS_R(AGND)
     );
 
  SIOBREAK_SB  BREAK2
    (
     .DVSS(DVSS),
     .DVSS_R(AGND)
     );
 
SIOFILL_AGND_AVDD_SB FILL_agnd0();
SIOFILL_AGND_AVDD_SB FILL_agnd1();

 
endmodule




