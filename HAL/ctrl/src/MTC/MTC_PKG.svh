// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl
// 2022-03-15 23:42:24

`ifndef MTC_CTRL_SVH
`define MTC_CTRL_SVH


`include <common_ieee_pkg.svh>

package MTC_CTRL;

   typedef struct MTC_MON_t {
      logic STATUS;
      logic READY;
   };

   typedef struct MTC_CTRL_t {
      logic RESET;
   };

endpackage : MTC_CTRL

`endif // MTC_CTRL_SVH
