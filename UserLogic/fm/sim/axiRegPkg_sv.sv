package axiRegPkg_sv;

   parameter AXI_ADDR_WIDTH = 32;
   parameter AXI_ID_BIT_COUNT = 6;
   
   
   typedef struct {
      logic [AXI_ADDR_WIDTH-1:0] address;
      logic [AXI_ID_BIT_COUNT-1:0] address_ID; 
      logic [2:0] 		   protection_type; 
      logic 			   address_valid;
      logic [7:0] 		   burst_length; 
      logic [2:0] 		   burst_size; 
      logic [1:0] 		   burst_type; 
      logic 			   lock_type; 
      logic [3:0] 		   cache_type;
      logic [3:0] 		   qos;
      logic [3:0] 		   region;
      logic [3:0] 		   address_user; 
      logic 			   ready_for_data;
   }AXIReadMOSI;
   
   

   //slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
   typedef struct 			   {
      logic 			   ready_for_address ; 
      logic [AXI_ID_BIT_COUNT-1:0] data_ID ;
      logic [31:0] 		   data ;
      logic 			   data_valid ; 
      logic [1:0] 		   response ; 
      logic 			   last ; 
      logic [3:0] 		   data_user; 
   }AXIReadMISO;



   //slave_writeMOSI  : in  AXIWriteMOSI;
  typedef  struct 			   { 			   
      logic [AXI_ADDR_WIDTH - 1:0] address;
      logic [AXI_ID_BIT_COUNT-1:0] address_ID;
      logic [2:0] 		   protection_type;
      logic 			   address_valid;
      logic [7:0] 		   burst_length;
      logic [2:0] 		   burst_size;
      logic [1:0] 		   burst_type;
      logic 			   lock_type; 
      logic [3:0] 		   cache_type;
      logic [3:0] 		   qos; 
      logic [3:0] 		   region;
      logic [3:0] 		   address_user;
      
      //write data
      logic [AXI_ID_BIT_COUNT-1:0] write_ID; 
      logic [31:0] 		   data;
      logic 			   data_valid;
      logic [3:0] 		   data_write_strobe; 
      logic 			   last; 
      logic [3:0] 		   data_user;
      
      //write response
      logic 			   ready_for_response; 
   }AXIWriteMOSI;
   

   typedef struct 			   {
      //slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
      //   --write address
      logic 			   ready_for_address;
      
      //		      --write data
      logic 			   ready_for_data;
      
      //				      --write response
      logic [AXI_ID_BIT_COUNT-1:0] response_ID;
      logic 			   response_valid; 
      logic [1:0] 		   response; 
      logic [3:0] 		   response_user; 
   }AXIWriteMISO;
   

endpackage
