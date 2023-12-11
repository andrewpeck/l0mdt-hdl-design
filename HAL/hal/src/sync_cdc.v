module sync_cdc #(
		  parameter NSTAGES_RCLK = 2,
		  parameter NSTAGES_WCLK = 2,
		  parameter WIDTH=193
		  )(
		 input wire 	     rst,
		 input wire 	     wr_clk,
		 input wire 	     rd_clk,
		 input wire [WIDTH-1:0]  data_wr_in,
		 output wire [WIDTH-1:0] data_rd_out
		 
		 );

   wire 			     wr_rst_busy;
   wire 			     rd_rst_busy;
   wire 			     proj_full;
   wire 			     rd_En;
   
   reg [WIDTH-1:0] 			     data_wr[0:NSTAGES_WCLK-1];
   reg [WIDTH-1:0] 			     data_rd[0:NSTAGES_RCLK-1];
   wire [WIDTH-1:0] 			     fifo_data_rd;
   wire 				     fifo_data_vld;
   
   integer 			     i;
   
   
   sl_fifo_sync_cdc sl_fifo_sync_cdc_inst (
					   .rst(rst),                  // input wire rst
					   .wr_clk(wr_clk),            // input wire wr_clk
					   .rd_clk(rd_clk),            // input wire rd_clk
					   .din(data_wr[NSTAGES_WCLK-1]),                  // input wire [WIDTH-2 : 0] din
					   .wr_en(data_wr[NSTAGES_WCLK-1][WIDTH-1]),              // input wire wr_en
					   .rd_en(rd_en),              // input wire rd_en
					   .dout(fifo_data_rd),                // output wire [WIDTH-2 : 0] dout
					   .full(full),                // output wire full
					   .empty(empty),              // output wire emptyq
					   .almost_full(),
					   .valid(fifo_data_vld),              // output wire valid
					   .prog_full(prog_full),      // output wire prog_full
					   .wr_rst_busy(wr_rst_busy),  // output wire wr_rst_busy
					   .rd_rst_busy(rd_rst_busy)  // output wire rd_rst_busy
					   );
   assign data_rd_out    = data_rd[NSTAGES_RCLK-1];
   
   assign rd_en              = ~empty;

   
   
   always @ (posedge rd_clk or posedge rst or posedge rd_rst_busy)
     begin
	if(rst | rd_rst_busy)
	  begin
	     for( i=1; i<NSTAGES_RCLK; i=i+1)
	       begin
		  data_rd[i] <= 'b0;
	       end
	  end
	
	else
	  begin
	     data_rd[0] <= (fifo_data_vld == 0)? {1'b0,fifo_data_rd[WIDTH-2:0]} : fifo_data_rd;
	     
	     for( i=1; i<NSTAGES_RCLK; i=i+1)
	       data_rd[i] <= data_rd[i-1];	     
	  end
	     
	
     end
   
   always @ (posedge wr_clk or posedge rst or posedge wr_rst_busy)
     begin
	if(rst | wr_rst_busy)
	  begin
	     for( i=0; i<NSTAGES_WCLK; i=i+1)
	       begin
		  data_wr[i] <= 'b0;		  
	       end
	  end
	else
	  begin
	     data_wr[0]     <= data_wr_in;
	     for( i=1; i<NSTAGES_WCLK; i=1+1)
	       begin
		  data_wr[i] <= data_wr[i-1];
		  
	       end
	  end
     end
endmodule // sync_cdc

