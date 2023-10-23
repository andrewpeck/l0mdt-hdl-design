module fm_map_wrapper #(
			parameter AXI_ADDR_WIDTH = 32,
			parameter AXI_ID_BIT_COUNT = 6
  )
   (
    input wire 			       clk_axi,
    input wire 			       clk_hs,
    input wire 			       reset_hs,
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


   fm_map_vhdl_wrapper    fm_map_vhdl_wrapper_inst(
    .clk_axi(clk_axi),
    .reset_axi_n(reset_axi_n),
						   .clk_hs(clk_hs),
						   .reset_hs(reset_hs),
    //slave_readMOSI   : in  AXIReadMOSI;
    .slave_readMOSI_address(slave_readMOSI_address), // : std_wire_vector(AXI_ADDR_WIDTH-1 downto 0); -- ARADDR
    .slave_readMOSI_address_ID(slave_readMOSI_address_ID), // : std_wire_vector(AXI_ID_BIT_COUNT-1 downto 0); --ARID
    .slave_readMOSI_protection_type(slave_readMOSI_protection_type), // : slv_3_t; -- ARPROT
    .slave_readMOSI_address_valid(slave_readMOSI_address_valid), // : std_wire; -- ARVALID
    .slave_readMOSI_burst_length(slave_readMOSI_burst_length), // : slv_8_t; -- ARLEN
    .slave_readMOSI_burst_size(slave_readMOSI_burst_size), // : slv_3_t; -- ARSIZE
    .slave_readMOSI_burst_type(slave_readMOSI_burst_type), // : slv_2_t; -- ARBURST
    .slave_readMOSI_lock_type(slave_readMOSI_lock_type), // : std_wire; -- ARLOCK
    .slave_readMOSI_cache_type(slave_readMOSI_cache_type), // : slv_4_t; -- ARCACHE
    .slave_readMOSI_qos(slave_readMOSI_qos), // : slv_4_t; -- ARQOS
    .slave_readMOSI_region(slave_readMOSI_region), // : slv_4_t; -- ARREGION
    .slave_readMOSI_address_user(slave_readMOSI_address_user), // : slv_4_t; -- ARUSER		
    .slave_readMOSI_ready_for_data(slave_readMOSI_ready_for_data), // : std_wire; -- RREADY
    
    //slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
   
    .slave_readMISO_ready_for_address(slave_readMISO_ready_for_address) , // std_logic; -- ARREADY
    .slave_readMISO_data_ID(slave_readMISO_data_ID) , // std_logic_vector(AXI_ID_BIT_COUNT-1 downto 0); --RID
    .slave_readMISO_data(slave_readMISO_data) , // slv_32_t; -- RDATA
    .slave_readMISO_data_valid(slave_readMISO_data_valid) , // std_logic; -- RVALID
    .slave_readMISO_response(slave_readMISO_response) , // slv_2_t; -- RRESP
    .slave_readMISO_last(slave_readMISO_last) , // std_logic; -- RLAST
    .slave_readMISO_data_user(slave_readMISO_data_user), // slv_4_t; -- RUSER
    
    //slave_writeMOSI  : in  AXIWriteMOSI;
    .slave_writeMOSI_address(slave_writeMOSI_address), // : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0); -- AWADDR
    .slave_writeMOSI_address_ID(slave_writeMOSI_address_ID), // : std_logic_vector(AXI_ID_BIT_COUNT-1 downto 0); --AWID
    .slave_writeMOSI_protection_type(slave_writeMOSI_protection_type), // : slv_3_t; -- AWPROT
    .slave_writeMOSI_address_valid(slave_writeMOSI_address_valid),// : std_logic; -- AWVALID
    .slave_writeMOSI_burst_length(slave_writeMOSI_burst_length), // : slv_8_t; -- AWLEN
    .slave_writeMOSI_burst_size(slave_writeMOSI_burst_size), // : slv_3_t; -- AWSIZE
    .slave_writeMOSI_burst_type(slave_writeMOSI_burst_type), // : slv_2_t; -- AWBURST
    .slave_writeMOSI_lock_type(slave_writeMOSI_lock_type), // : std_logic; -- AWLOCK
    .slave_writeMOSI_cache_type(slave_writeMOSI_cache_type), // : slv_4_t; -- AWCACHE
    .slave_writeMOSI_qos(slave_writeMOSI_qos), // : slv_4_t; -- AWQOS
    .slave_writeMOSI_region(slave_writeMOSI_region), // : slv_4_t; -- AWREGION
    .slave_writeMOSI_address_user(slave_writeMOSI_address_user), // : slv_4_t; -- AWUSER
				      
    //write data
    .slave_writeMOSI_write_ID(slave_writeMOSI_write_ID), // : std_logic_vector(AXI_ID_BIT_COUNT-1 downto 0); --WID
    .slave_writeMOSI_data(slave_writeMOSI_data), // : slv_32_t; -- WDATA
    .slave_writeMOSI_data_valid(slave_writeMOSI_data_valid), // : std_logic; -- WVALID
    .slave_writeMOSI_data_write_strobe(slave_writeMOSI_data_write_strobe), // : slv_4_t; -- WSTRB
    .slave_writeMOSI_last(slave_writeMOSI_last), // : std_logic; -- WLAST
    .slave_writeMOSI_data_user(slave_writeMOSI_data_user), // : slv_4_t; -- WUSER
				      
    //write response
    .slave_writeMOSI_ready_for_response(slave_writeMOSI_ready_for_response), // : std_logic; -- BREADY
    

    //slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    //   --write address
    .slave_writeMISO_ready_for_address(slave_writeMISO_ready_for_address),// : std_logic; -- AWREADY
				      
    //		      --write data
    .slave_writeMISO_ready_for_data(slave_writeMISO_ready_for_data),// : std_logic; -- WREADY
				      
    //				      --write response
    .slave_writeMISO_response_ID(slave_writeMISO_response_ID),// : std_logic_vector(AXI_ID_BIT_COUNT-1 downto 0); --BID
    .slave_writeMISO_response_valid(slave_writeMISO_response_valid), // : std_logic; -- BVALID
    .slave_writeMISO_response(slave_writeMISO_response), // : slv_2_t; -- BRESP
    .slave_writeMISO_response_user(slave_writeMISO_response_user) // : slv_4_t; -- BUSER
    
    );
   
   
  endmodule // fm_map_wrapper
