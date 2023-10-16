// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl
// 2023-10-16 13:23:17

`ifndef FM_CTRL_SVH
`define FM_CTRL_SVH


`include <common_ieee_pkg.svh>

package FM_CTRL;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB0_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB0_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB0_SB_MEM_MISO_t  SB_MEM;
   } FM_SB0_MON_t ;

   typedef struct packed {
      FM_SB0_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB0_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB1_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB1_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB1_SB_MEM_MISO_t  SB_MEM;
   } FM_SB1_MON_t ;

   typedef struct packed {
      FM_SB1_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB1_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB2_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB2_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB2_SB_MEM_MISO_t  SB_MEM;
   } FM_SB2_MON_t ;

   typedef struct packed {
      FM_SB2_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB2_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB3_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB3_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB3_SB_MEM_MISO_t  SB_MEM;
   } FM_SB3_MON_t ;

   typedef struct packed {
      FM_SB3_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB3_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB4_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB4_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB4_SB_MEM_MISO_t  SB_MEM;
   } FM_SB4_MON_t ;

   typedef struct packed {
      FM_SB4_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB4_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB5_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB5_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB5_SB_MEM_MISO_t  SB_MEM;
   } FM_SB5_MON_t ;

   typedef struct packed {
      FM_SB5_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB5_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB6_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB6_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB6_SB_MEM_MISO_t  SB_MEM;
   } FM_SB6_MON_t ;

   typedef struct packed {
      FM_SB6_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB6_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB7_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB7_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB7_SB_MEM_MISO_t  SB_MEM;
   } FM_SB7_MON_t ;

   typedef struct packed {
      FM_SB7_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB7_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB8_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB8_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB8_SB_MEM_MISO_t  SB_MEM;
   } FM_SB8_MON_t ;

   typedef struct packed {
      FM_SB8_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB8_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB9_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB9_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB9_SB_MEM_MISO_t  SB_MEM;
   } FM_SB9_MON_t ;

   typedef struct packed {
      FM_SB9_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB9_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB10_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB10_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB10_SB_MEM_MISO_t  SB_MEM;
   } FM_SB10_MON_t ;

   typedef struct packed {
      FM_SB10_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB10_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB11_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB11_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB11_SB_MEM_MISO_t  SB_MEM;
   } FM_SB11_MON_t ;

   typedef struct packed {
      FM_SB11_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB11_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB12_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB12_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB12_SB_MEM_MISO_t  SB_MEM;
   } FM_SB12_MON_t ;

   typedef struct packed {
      FM_SB12_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB12_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB13_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB13_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB13_SB_MEM_MISO_t  SB_MEM;
   } FM_SB13_MON_t ;

   typedef struct packed {
      FM_SB13_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB13_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB14_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB14_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB14_SB_MEM_MISO_t  SB_MEM;
   } FM_SB14_MON_t ;

   typedef struct packed {
      FM_SB14_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB14_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB15_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB15_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB15_SB_MEM_MISO_t  SB_MEM;
   } FM_SB15_MON_t ;

   typedef struct packed {
      FM_SB15_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB15_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB16_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB16_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB16_SB_MEM_MISO_t  SB_MEM;
   } FM_SB16_MON_t ;

   typedef struct packed {
      FM_SB16_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB16_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB17_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB17_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB17_SB_MEM_MISO_t  SB_MEM;
   } FM_SB17_MON_t ;

   typedef struct packed {
      FM_SB17_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB17_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB18_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB18_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB18_SB_MEM_MISO_t  SB_MEM;
   } FM_SB18_MON_t ;

   typedef struct packed {
      FM_SB18_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB18_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB19_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB19_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB19_SB_MEM_MISO_t  SB_MEM;
   } FM_SB19_MON_t ;

   typedef struct packed {
      FM_SB19_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB19_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB20_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB20_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB20_SB_MEM_MISO_t  SB_MEM;
   } FM_SB20_MON_t ;

   typedef struct packed {
      FM_SB20_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB20_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB21_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB21_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB21_SB_MEM_MISO_t  SB_MEM;
   } FM_SB21_MON_t ;

   typedef struct packed {
      FM_SB21_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB21_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB22_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB22_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB22_SB_MEM_MISO_t  SB_MEM;
   } FM_SB22_MON_t ;

   typedef struct packed {
      FM_SB22_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB22_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB23_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB23_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB23_SB_MEM_MISO_t  SB_MEM;
   } FM_SB23_MON_t ;

   typedef struct packed {
      FM_SB23_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB23_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB24_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB24_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB24_SB_MEM_MISO_t  SB_MEM;
   } FM_SB24_MON_t ;

   typedef struct packed {
      FM_SB24_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB24_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB25_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB25_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB25_SB_MEM_MISO_t  SB_MEM;
   } FM_SB25_MON_t ;

   typedef struct packed {
      FM_SB25_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB25_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB26_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB26_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB26_SB_MEM_MISO_t  SB_MEM;
   } FM_SB26_MON_t ;

   typedef struct packed {
      FM_SB26_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB26_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB27_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB27_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB27_SB_MEM_MISO_t  SB_MEM;
   } FM_SB27_MON_t ;

   typedef struct packed {
      FM_SB27_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB27_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB28_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB28_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB28_SB_MEM_MISO_t  SB_MEM;
   } FM_SB28_MON_t ;

   typedef struct packed {
      FM_SB28_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB28_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB29_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB29_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB29_SB_MEM_MISO_t  SB_MEM;
   } FM_SB29_MON_t ;

   typedef struct packed {
      FM_SB29_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB29_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB30_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB30_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB30_SB_MEM_MISO_t  SB_MEM;
   } FM_SB30_MON_t ;

   typedef struct packed {
      FM_SB30_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB30_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB31_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB31_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB31_SB_MEM_MISO_t  SB_MEM;
   } FM_SB31_MON_t ;

   typedef struct packed {
      FM_SB31_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB31_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB32_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB32_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB32_SB_MEM_MISO_t  SB_MEM;
   } FM_SB32_MON_t ;

   typedef struct packed {
      FM_SB32_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB32_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB33_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB33_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB33_SB_MEM_MISO_t  SB_MEM;
   } FM_SB33_MON_t ;

   typedef struct packed {
      FM_SB33_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB33_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB34_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB34_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB34_SB_MEM_MISO_t  SB_MEM;
   } FM_SB34_MON_t ;

   typedef struct packed {
      FM_SB34_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB34_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB35_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB35_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB35_SB_MEM_MISO_t  SB_MEM;
   } FM_SB35_MON_t ;

   typedef struct packed {
      FM_SB35_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB35_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB36_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB36_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB36_SB_MEM_MISO_t  SB_MEM;
   } FM_SB36_MON_t ;

   typedef struct packed {
      FM_SB36_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB36_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB37_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB37_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB37_SB_MEM_MISO_t  SB_MEM;
   } FM_SB37_MON_t ;

   typedef struct packed {
      FM_SB37_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB37_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB38_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB38_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB38_SB_MEM_MISO_t  SB_MEM;
   } FM_SB38_MON_t ;

   typedef struct packed {
      FM_SB38_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB38_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB39_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB39_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB39_SB_MEM_MISO_t  SB_MEM;
   } FM_SB39_MON_t ;

   typedef struct packed {
      FM_SB39_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB39_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB40_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB40_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB40_SB_MEM_MISO_t  SB_MEM;
   } FM_SB40_MON_t ;

   typedef struct packed {
      FM_SB40_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB40_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB41_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB41_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB41_SB_MEM_MISO_t  SB_MEM;
   } FM_SB41_MON_t ;

   typedef struct packed {
      FM_SB41_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB41_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB42_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB42_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB42_SB_MEM_MISO_t  SB_MEM;
   } FM_SB42_MON_t ;

   typedef struct packed {
      FM_SB42_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB42_CTRL_t ;

   typedef struct packed {
      logic  clk;
      logic  enable;
      logic  wr_enable;
      logic [9 -1:0] address;
      logic [32 -1:0] wr_data;
   } FM_SB43_SB_MEM_MOSI_t ;

   typedef struct packed {
      logic [32 -1:0] rd_data;
      logic  rd_data_valid;
   } FM_SB43_SB_MEM_MISO_t ;

   typedef struct packed {
      FM_SB43_SB_MEM_MISO_t  SB_MEM;
   } FM_SB43_MON_t ;

   typedef struct packed {
      FM_SB43_SB_MEM_MOSI_t  SB_MEM;
   } FM_SB43_CTRL_t ;

   typedef struct packed {
      logic  GLOBAL_FREEZE;
      logic [2 - 1:0] GLOBAL_PLAYBACK_MODE;
      logic  INITIALIZE_SPY_MEMORY;
   } FM_SPY_CTRL_CTRL_t ;

   typedef struct packed {
      FM_SB0_MON_t  SB0;
      FM_SB1_MON_t  SB1;
      FM_SB2_MON_t  SB2;
      FM_SB3_MON_t  SB3;
      FM_SB4_MON_t  SB4;
      FM_SB5_MON_t  SB5;
      FM_SB6_MON_t  SB6;
      FM_SB7_MON_t  SB7;
      FM_SB8_MON_t  SB8;
      FM_SB9_MON_t  SB9;
      FM_SB10_MON_t  SB10;
      FM_SB11_MON_t  SB11;
      FM_SB12_MON_t  SB12;
      FM_SB13_MON_t  SB13;
      FM_SB14_MON_t  SB14;
      FM_SB15_MON_t  SB15;
      FM_SB16_MON_t  SB16;
      FM_SB17_MON_t  SB17;
      FM_SB18_MON_t  SB18;
      FM_SB19_MON_t  SB19;
      FM_SB20_MON_t  SB20;
      FM_SB21_MON_t  SB21;
      FM_SB22_MON_t  SB22;
      FM_SB23_MON_t  SB23;
      FM_SB24_MON_t  SB24;
      FM_SB25_MON_t  SB25;
      FM_SB26_MON_t  SB26;
      FM_SB27_MON_t  SB27;
      FM_SB28_MON_t  SB28;
      FM_SB29_MON_t  SB29;
      FM_SB30_MON_t  SB30;
      FM_SB31_MON_t  SB31;
      FM_SB32_MON_t  SB32;
      FM_SB33_MON_t  SB33;
      FM_SB34_MON_t  SB34;
      FM_SB35_MON_t  SB35;
      FM_SB36_MON_t  SB36;
      FM_SB37_MON_t  SB37;
      FM_SB38_MON_t  SB38;
      FM_SB39_MON_t  SB39;
      FM_SB40_MON_t  SB40;
      FM_SB41_MON_t  SB41;
      FM_SB42_MON_t  SB42;
      FM_SB43_MON_t  SB43;
   } FM_MON_t ;

   typedef struct packed {
      FM_SB0_CTRL_t  SB0;
      FM_SB1_CTRL_t  SB1;
      FM_SB2_CTRL_t  SB2;
      FM_SB3_CTRL_t  SB3;
      FM_SB4_CTRL_t  SB4;
      FM_SB5_CTRL_t  SB5;
      FM_SB6_CTRL_t  SB6;
      FM_SB7_CTRL_t  SB7;
      FM_SB8_CTRL_t  SB8;
      FM_SB9_CTRL_t  SB9;
      FM_SB10_CTRL_t  SB10;
      FM_SB11_CTRL_t  SB11;
      FM_SB12_CTRL_t  SB12;
      FM_SB13_CTRL_t  SB13;
      FM_SB14_CTRL_t  SB14;
      FM_SB15_CTRL_t  SB15;
      FM_SB16_CTRL_t  SB16;
      FM_SB17_CTRL_t  SB17;
      FM_SB18_CTRL_t  SB18;
      FM_SB19_CTRL_t  SB19;
      FM_SB20_CTRL_t  SB20;
      FM_SB21_CTRL_t  SB21;
      FM_SB22_CTRL_t  SB22;
      FM_SB23_CTRL_t  SB23;
      FM_SB24_CTRL_t  SB24;
      FM_SB25_CTRL_t  SB25;
      FM_SB26_CTRL_t  SB26;
      FM_SB27_CTRL_t  SB27;
      FM_SB28_CTRL_t  SB28;
      FM_SB29_CTRL_t  SB29;
      FM_SB30_CTRL_t  SB30;
      FM_SB31_CTRL_t  SB31;
      FM_SB32_CTRL_t  SB32;
      FM_SB33_CTRL_t  SB33;
      FM_SB34_CTRL_t  SB34;
      FM_SB35_CTRL_t  SB35;
      FM_SB36_CTRL_t  SB36;
      FM_SB37_CTRL_t  SB37;
      FM_SB38_CTRL_t  SB38;
      FM_SB39_CTRL_t  SB39;
      FM_SB40_CTRL_t  SB40;
      FM_SB41_CTRL_t  SB41;
      FM_SB42_CTRL_t  SB42;
      FM_SB43_CTRL_t  SB43;
      FM_SPY_CTRL_CTRL_t  SPY_CTRL;
      logic [32 - 1:0] FREEZE_MASK_0;
      logic [32 - 1:0] FREEZE_MASK_1;
      logic [32 - 1:0] PLAYBACK_MASK_0;
      logic [32 - 1:0] PLAYBACK_MASK_1;
      logic [32 - 1:0] SB_RESET_0;
      logic [32 - 1:0] SB_RESET_1;
   } FM_CTRL_t ;

endpackage : FM_CTRL

`endif // FM_CTRL_SVH
