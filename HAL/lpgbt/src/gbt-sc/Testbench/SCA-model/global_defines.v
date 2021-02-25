
   `define WithSEUcounter    //to activate single event upset counter logic
   `define ClkGate_channels  //use clock gating and reset for specific channel
// `define WithScanPath      //with scan path

   `define RC
   
   `ifdef WithSEUcounter
   `define SEUcnt_nbit 16
   `endif

