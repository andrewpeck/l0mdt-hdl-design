




`ifndef SPI_DEFINES
`define SPI_DEFINES             
	`define SPI_DIVIDER_LEN        16   
	`define SPI_MAX_CHAR          128  
	`define SPI_CHAR_LEN_BITS       7
	`define SPI_SS_NB               8    
	`define SPI_OFS_BITS          4:2
	`define SPI_CTRL_BIT_NB        14
	
	//REGISTER ASSIGNAMENT	
	`define SPI_RX_0                0
	`define SPI_RX_1                1
	`define SPI_RX_2                2
	`define SPI_RX_3                3
	`define SPI_TX_0                0
	`define SPI_TX_1                1
	`define SPI_TX_2                2
	`define SPI_TX_3                3
	`define SPI_CTRL                4
	`define SPI_DEVIDE              5
	`define SPI_SS                  6
	`define SPI_GO_REG              7


	// Control register bit position
	`define SPI_CTRL_ASS            13
	`define SPI_CTRL_IE             12
	`define SPI_CTRL_LSB            11
	`define SPI_CTRL_TX_NEGEDGE     10
	`define SPI_CTRL_RX_NEGEDGE     9
	`define SPI_CTRL_GO             8
	`define SPI_CTRL_INV_SCLK       7
	`define SPI_CTRL_CHAR_LEN       6:0
`endif




