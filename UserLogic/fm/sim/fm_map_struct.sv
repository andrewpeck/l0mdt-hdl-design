

module fm_map_struct #(
			parameter AXI_ADDR_WIDTH = 32,
			parameter AXI_ID_BIT_COUNT = 6
  )
   (
    input wire 			       clk_axi,
    input wire 			       reset_axi_n,
    //slave_readMOSI   : in  AXIReadMOSI;
    input wire [AXI_ADDR_WIDTH-1:0]    slave_readMOSI_address, // : std_wire_vector(AXI_ADDR_WIDTH-1 downto 0); -- ARADDR
    input wire [AXI_ID_BIT_COUNT-1:0]  slave_readMOSI_address_ID, // : std_wire_vector(AXI_ID_BIT_COUNT-1 downto 0); --ARID
    input wire [2:0] 		       slave_readMOSI_protection_type, // : slv_3_t; -- ARPROT
    input wire 			       slave_readMOSI_address_valid, // : std_wire; -- ARVALID
    input wire [7:0] 		       slave_readMOSI_burst_length, // : slv_8_t; -- ARLEN
    input wire [2:0] 		       slave_readMOSI_burst_size, // : slv_3_t; -- ARSIZE
    input wire [1:0] 		       slave_readMOSI_burst_type, // : slv_2_t; -- ARBURST
    input wire 			       slave_readMOSI_lock_type, // : std_wire; -- ARLOCK
    input wire [3:0] 		       slave_readMOSI_cache_type, // : slv_4_t; -- ARCACHE
    input wire [3:0] 		       slave_readMOSI_qos, // : slv_4_t; -- ARQOS
    input wire [3:0] 		       slave_readMOSI_region, // : slv_4_t; -- ARREGION
    input wire [3:0] 		       slave_readMOSI_address_user, // : slv_4_t; -- ARUSER		
    input wire 			       slave_readMOSI_ready_for_data, // : std_wire; -- RREADY
    
    //slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
   
    output wire 		       slave_readMISO_ready_for_address , // std_logic; -- ARREADY
    output wire [AXI_ID_BIT_COUNT-1:0] slave_readMISO_data_ID , // std_logic_vector(AXI_ID_BIT_COUNT-1 downto 0); --RID
    output wire [31:0] 		       slave_readMISO_data , // slv_32_t; -- RDATA
    output wire 		       slave_readMISO_data_valid , // std_logic; -- RVALID
    output wire [1:0] 		       slave_readMISO_response , // slv_2_t; -- RRESP
    output wire 		       slave_readMISO_last , // std_logic; -- RLAST
    output wire [3:0] 		       slave_readMISO_data_user, // slv_4_t; -- RUSER
    
    //slave_writeMOSI  : in  AXIWriteMOSI;
    input wire [AXI_ADDR_WIDTH - 1:0]  slave_writeMOSI_address, // : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0); -- AWADDR
    input wire [AXI_ID_BIT_COUNT-1:0]  slave_writeMOSI_address_ID, // : std_logic_vector(AXI_ID_BIT_COUNT-1 downto 0); --AWID
    input wire [2:0] 		       slave_writeMOSI_protection_type, // : slv_3_t; -- AWPROT
    input wire 			       slave_writeMOSI_address_valid,// : std_logic; -- AWVALID
    input wire [7:0] 		       slave_writeMOSI_burst_length, // : slv_8_t; -- AWLEN
    input wire [2:0] 		       slave_writeMOSI_burst_size, // : slv_3_t; -- AWSIZE
    input wire [1:0] 		       slave_writeMOSI_burst_type, // : slv_2_t; -- AWBURST
    input wire 			       slave_writeMOSI_lock_type, // : std_logic; -- AWLOCK
    input wire [3:0] 		       slave_writeMOSI_cache_type, // : slv_4_t; -- AWCACHE
    input wire [3:0] 		       slave_writeMOSI_qos, // : slv_4_t; -- AWQOS
    input wire [3:0] 		       slave_writeMOSI_region, // : slv_4_t; -- AWREGION
    input wire [3:0] 		       slave_writeMOSI_address_user, // : slv_4_t; -- AWUSER
				      
    //write data
    input wire [AXI_ID_BIT_COUNT-1:0]  slave_writeMOSI_write_ID, // : std_logic_vector(AXI_ID_BIT_COUNT-1 downto 0); --WID
    input wire [31:0] 		       slave_writeMOSI_data, // : slv_32_t; -- WDATA
    input wire 			       slave_writeMOSI_data_valid, // : std_logic; -- WVALID
    input wire [3:0] 		       slave_writeMOSI_data_write_strobe, // : slv_4_t; -- WSTRB
    input 			       slave_writeMOSI_last, // : std_logic; -- WLAST
    input [3:0] 		       slave_writeMOSI_data_user, // : slv_4_t; -- WUSER
				      
    //write response
    input wire 			       slave_writeMOSI_ready_for_response, // : std_logic; -- BREADY
    

    //slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    //   --write address
    output wire 		       slave_writeMISO_ready_for_address,// : std_logic; -- AWREADY
				      
    //		      --write data
    output wire 		       slave_writeMISO_ready_for_data,// : std_logic; -- WREADY
				      
    //				      --write response
    output wire [AXI_ID_BIT_COUNT-1:0] slave_writeMISO_response_ID,// : std_logic_vector(AXI_ID_BIT_COUNT-1 downto 0); --BID
    output wire 		       slave_writeMISO_response_valid, // : std_logic; -- BVALID
    output wire [1:0] 		       slave_writeMISO_response, // : slv_2_t; -- BRESP
    output wire [3:0] 		       slave_writeMISO_response_user // : slv_4_t; -- BUSER
    
    );
   import axiRegPkg_sv::*;
   
   
 
   
   axiRegPkg_sv::AXIReadMOSI  slave_readMOSI;
   axiRegPkg_sv::AXIReadMISO  slave_readMISO;   
   axiRegPkg_sv::AXIWriteMOSI slave_writeMOSI;
   axiRegPkg_sv::AXIWriteMISO slave_writeMISO;
   
   FM_map FM_map_inst(
		      .clk_axi(clk_axi),
		      .reset_axi_n(reset_axi_n),
		      .slave_readMOSI(slave_readMOSI),
		      .slave_readMISO(slave_readMISO),
		      .slave_writeMOSI(slave_writeMOSI),
		      .slave_writeMISO(slave_writeMISO),
		      .Mon(),
		      .Ctrl()
		      );
	
  

   
   always_comb
     begin
	//slave_readMOSI   : in  AXIReadMOSI;
	slave_readMOSI.address        = slave_readMOSI_address; 
	slave_readMOSI.address_ID     = slave_readMOSI_address_ID;
	slave_readMOSI.protection_type= slave_readMOSI_protection_type; 
	slave_readMOSI.address_valid  = slave_readMOSI_address_valid; 
	slave_readMOSI.burst_length   = slave_readMOSI_burst_length; 
	slave_readMOSI.burst_size     = slave_readMOSI_burst_size;
	slave_readMOSI.burst_type     = slave_readMOSI_burst_type; 
	slave_readMOSI.lock_type      = slave_readMOSI_lock_type; 
	slave_readMOSI.cache_type     = slave_readMOSI_cache_type; 
	slave_readMOSI.qos            = slave_readMOSI_qos; 
	slave_readMOSI.region         = slave_readMOSI_region;
	slave_readMOSI.address_user   = slave_readMOSI_address_user; 
	slave_readMOSI.ready_for_data = slave_readMOSI_ready_for_data;


	//slave_readMISO   : out AXIReadMISO
	slave_readMISO.ready_for_address     = slave_readMISO_ready_for_address     ;
	slave_readMISO.data_ID               = slave_readMISO_data_ID               ; 
 	slave_readMISO.data                  = slave_readMISO_data                  ; 
	slave_readMISO.data_valid            = slave_readMISO_data_valid            ;
	slave_readMISO.response              = slave_readMISO_response              ; 
	slave_readMISO.last                  = slave_readMISO_last                  ;
	slave_readMISO.data_user             = slave_readMISO_data_user             ; 


	//slave_writeMOSI  : in  AXIWriteMOSI;
	slave_writeMOSI.address           = slave_writeMOSI_address                 ;
	slave_writeMOSI.address_ID        = slave_writeMOSI_address_ID              ;
	slave_writeMOSI.protection_type   = slave_writeMOSI_protection_type         ; 
	slave_writeMOSI.address_valid     = slave_writeMOSI_address_valid           ;
	slave_writeMOSI.burst_length      = slave_writeMOSI_burst_length            ; 
	slave_writeMOSI.burst_size        = slave_writeMOSI_burst_size              ;
	slave_writeMOSI.burst_type        = slave_writeMOSI_burst_type              ; 
	slave_writeMOSI.lock_type         = slave_writeMOSI_lock_type               ;
	slave_writeMOSI.cache_type        = slave_writeMOSI_cache_type              ; 
	slave_writeMOSI.qos               = slave_writeMOSI_qos                     ; 
	slave_writeMOSI.region            = slave_writeMOSI_region                  ;
	slave_writeMOSI.address_user      = slave_writeMOSI_address_user            ; 	
	slave_writeMOSI.write_ID             = slave_writeMOSI_write_ID             ;
	slave_writeMOSI.data                 = slave_writeMOSI_data                 ;
	slave_writeMOSI.data_valid           = slave_writeMOSI_data_valid           ; 
	slave_writeMOSI.data_write_strobe    = slave_writeMOSI_data_write_strobe    ;
	slave_writeMOSI.last                 = slave_writeMOSI_last                 ;
	slave_writeMOSI.data_user            = slave_writeMOSI_data_user            ; 
	slave_writeMOSI.ready_for_response   = slave_writeMOSI_ready_for_response   ;
    

	//slave_writeMISO  : out AXIWriteMISO 
	slave_writeMISO.ready_for_address      = slave_writeMISO_ready_for_address  ;  	
	slave_writeMISO.ready_for_data         = slave_writeMISO_ready_for_data     ;
	slave_writeMISO.response_ID            = slave_writeMISO_response_ID        ;
	slave_writeMISO.response_valid         = slave_writeMISO_response_valid     ; 
	slave_writeMISO.response               = slave_writeMISO_response           ; 
	slave_writeMISO.response_user          = slave_writeMISO_response_user      ;
       
     end

  

   
   
  endmodule // fm_map_struct
