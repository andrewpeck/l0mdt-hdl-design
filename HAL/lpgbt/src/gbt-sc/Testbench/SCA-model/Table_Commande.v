///////////////////////////////////////
//                                   //
// Table of commands                 //
// Last modification: 29 sept 2015   //
//                                   //
//                                   //
///////////////////////////////////////

//------------ GLobal -------------
localparam wb_nb_bit       = 31;    
localparam atlantic_nb_bit = 15;    
localparam CH_NODE = 8'h00;  
localparam CH_SPI  = 8'h01;  
localparam CH_GPIO = 8'h02;  
localparam CH_I2C0 = 8'h03;  
localparam CH_I2C1 = 8'h04;  
localparam CH_I2C2 = 8'h05;  
localparam CH_I2C3 = 8'h06;  
localparam CH_I2C4 = 8'h07;  
localparam CH_I2C5 = 8'h08;  
localparam CH_I2C6 = 8'h09;  
localparam CH_I2C7 = 8'h0a;  
localparam CH_I2C8 = 8'h0b;  
localparam CH_I2C9 = 8'h0c;  
localparam CH_I2C10 = 8'h0d; 
localparam CH_I2C11 = 8'h0e; 
localparam CH_I2C12 = 8'h0f; 
localparam CH_I2C13 = 8'h10; 
localparam CH_I2C14 = 8'h11; 
localparam CH_I2C15 = 8'h12; 
localparam CH_JTAG  = 8'h13; 
localparam CH_ADC   = 8'h14; 
localparam CH_DAC   = 8'h15; 

//--------------Err flags----------
localparam Err_bit  = 0;   
localparam Inv_CH   = 1;
localparam Inv_Cmd  = 2;
localparam Inv_TR   = 3;  
localparam Inv_LEN  = 4;    
localparam CH_dis   = 5;  
localparam CH_Busy  = 6;
localparam Num_Max_CH = 8'h15;  

//--------------Node Ctrl----------
localparam NC_Write_CRA = 8'h00;    
localparam NC_Read_CRA  = 8'h01;    
localparam NC_Write_CRB = 8'h02;
localparam NC_Read_CRB  = 8'h03;
localparam NC_Write_CRC = 8'h04;
localparam NC_Read_CRC  = 8'h05;
localparam NC_Write_CRD = 8'h06;
localparam NC_Read_CRD  = 8'h07;
localparam NC_Write_CRE = 8'h08;    
localparam NC_Read_CRE  = 8'h09;

//-----------------SPI--------------
localparam SPI_wrt_TX0   = 8'h00;   
localparam SPI_rea_RX0   = 8'h01;   
localparam SPI_wrt_TX1   = 8'h10;   
localparam SPI_rea_RX1   = 8'h11;   
localparam SPI_wrt_TX2   = 8'h20;   
localparam SPI_rea_RX2   = 8'h21;   
localparam SPI_wrt_TX3   = 8'h30;   
localparam SPI_rea_RX3   = 8'h31;   
localparam SPI_wrt_ctrl  = 8'h40;   
localparam SPI_rea_ctrl  = 8'h41;   
localparam SPI_wrt_DIV   = 8'h50;   
localparam SPI_rea_DIV   = 8'h51;   
localparam SPI_wrt_SS    = 8'h60;   
localparam SPI_rea_SS    = 8'h61;   
localparam SPI_go        = 8'h72;   

//--------------JTAG----------------
localparam JTG_w_TDO_tx0   = 8'h00;
localparam JTG_r_TDI_rx0   = 8'h01;
localparam JTG_w_TDO_tx1   = 8'h10;
localparam JTG_r_TDI_rx1   = 8'h11;
localparam JTG_w_TDO_tx2   = 8'h20;
localparam JTG_r_TDI_rx2   = 8'h21;
localparam JTG_w_TDO_tx3   = 8'h30;
localparam JTG_r_TDI_rx3   = 8'h31;
localparam JTG_w_TMS_tx0   = 8'h40;
localparam JTG_r_TMS_tx0   = 8'h41;
localparam JTG_w_TMS_tx1   = 8'h50;
localparam JTG_r_TMS_tx1   = 8'h51;
localparam JTG_w_TMS_tx2   = 8'h60;
localparam JTG_r_TMS_tx2   = 8'h61;
localparam JTG_w_TMS_tx3   = 8'h70;
localparam JTG_r_TMS_tx3   = 8'h71;
localparam JTG_w_ctrl      = 8'h80;
localparam JTG_r_crtl      = 8'h81;
localparam JTG_w_div       = 8'h90;
localparam JTG_r_div       = 8'h91;
localparam JTG_go_auto     = 8'ha2;
localparam JTG_go_manual   = 8'hb0;
localparam JTAG_RES        = 8'hc0;
localparam JTAG_status     = 8'hd1;
localparam SEU_read        = 8'hf1;
localparam SEU_clear       = 8'hf0;


//--------------------------



//------------I2C------------------
localparam I2C_WRITE_CRA   = 8'h30;   
localparam I2C_READ_CRA    = 8'h31;   
localparam I2C_READ_SRA    = 8'h11;
localparam I2C_WRITE_MSK   = 8'h20;
localparam I2C_READ_MSK    = 8'h21;   
localparam I2C_1BYTE_WRITE = 8'h82;   
localparam I2C_1BYTE_READ  = 8'h86;
localparam I2C_1BYTE_WRITE_EXT = 8'h8A;   
localparam I2C_1byte_READ_EXT  = 8'h8E;   
localparam I2C_1byte_rmw_OR    = 8'hC6;   
localparam I2C_1byte_rmw_XOR   = 8'hCA;
localparam I2C_W_multi_4byte0  = 8'h40;   
localparam I2C_W_multi_4byte1  = 8'h50;   
localparam I2C_W_multi_4byte2  = 8'h60;   
localparam I2C_W_multi_4byte3  = 8'h70;   
localparam I2C_R_multi_4byte0  = 8'h41;   
localparam I2C_R_multi_4byte1  = 8'h51;   
localparam I2C_R_multi_4byte2  = 8'h61;   
localparam I2C_R_multi_4byte3  = 8'h71;  
localparam I2C_write_multi     = 8'hDA;   
localparam I2C_read_multi      = 8'hDE;   
localparam I2C_write_multi_ext = 8'hE2;   
localparam I2C_read_multi_ext  = 8'hE6;   


//-------------GPIO---------------------
localparam GPIO_R_DAT_IN        = 8'h01;     
localparam GPIO_W_DAT_OUT       = 8'h10;     
localparam GPIO_R_DAT_OUT       = 8'h11;     
localparam GPIO_W_OE            = 8'h20;     
localparam GPIO_R_WE            = 8'h21;     
localparam GPIO_W_INTE          = 8'h30;     
localparam GPIO_R_INTE          = 8'h31;     
localparam GPIO_W_PTRIG         = 8'h40;     
localparam GPIO_R_PTRIG         = 8'h41;     
localparam GPIO_W_AUX           = 8'h50;     
localparam GPIO_R_AUX           = 8'h51;     
localparam GPIO_W_CTRL          = 8'h60;     
localparam GPIO_R_CTRL          = 8'h61;     
localparam GPIO_W_INTS          = 8'h70;     
localparam GPIO_R_INTS          = 8'h71;     
localparam GPIO_W_ECLK          = 8'h80;
localparam GPIO_R_ECLK          = 8'h81;
localparam GPIO_W_NEC           = 8'h90;
localparam GPIO_R_NEC           = 8'h91;

//--------------DAC--------------------
localparam DAC_W_CTRL          = 8'h00;
localparam DAC_R_CTRL          = 8'h01;
localparam DAC_W_CH1           = 8'h10;
localparam DAC_R_CH1           = 8'h11;
localparam DAC_W_CH2           = 8'h20;
localparam DAC_R_CH2           = 8'h21;
localparam DAC_W_CH3           = 8'h30;
localparam DAC_R_CH3           = 8'h31;
localparam DAC_W_CH4           = 8'h40;
localparam DAC_R_CH4           = 8'h41;

//--------------ADC-------------------
localparam ADC_GO              = 8'h02; 
localparam ADC_W_MUX           = 8'h50;
localparam ADC_R_MUX           = 8'h51;
localparam ADC_W_GAIN          = 8'h10;
localparam ADC_R_GAIN	       = 8'h11;
localparam ADC_R_ID            = 8'hd1;
localparam ADC_W_CURR          = 8'h60;
localparam ADC_R_CURR          = 8'h61;
localparam ADC_R_DATA          = 8'h21;
localparam ADC_R_CTRL          = 8'h71;
localparam ADC_R_CWD           = 8'h31;
localparam ADC_R_OFFSET        = 8'h41;
localparam FUSE_W_ID           = 8'hf0;
localparam FUSE_R_ID           = 8'hf1;
localparam FUSE_W_GAIN         = 8'he0;
localparam FUSE_R_GAIN         = 8'he1;

