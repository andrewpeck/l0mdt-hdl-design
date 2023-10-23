


module fm_dummy_block #(
			parameter dummy_master = 1,
			parameter data_width = 32
			)(
		       input logic 	   clk,
		       input logic 	   rst,
		       input logic [data_width-1:0]  dummy_input,
		       input logic 	   dummy_input_vld,
		       output logic [data_width-1:0] dummy_mon_data,
		       output logic 	   dummy_mon_vld
		       );
   logic [data_width-2:0] 		   dummy_val[5] = {'h40000BAD, 'h60000BEE, 'h7000D0E5, 'h78000FAB, 'h7C00DEED};
   logic [5:0] 		   		           count;
   
   always @ (posedge clk)
     begin
	if(rst)
	  begin
	     dummy_mon_data  <= 'h0 ;
	     dummy_mon_vld    <= 'h0 ;
	     count                       <= 'h0;	     
	  end
	else
	  begin
	     if(dummy_master == 1)
	       begin
		  count <= count + 1;
		  
		  if(count < 5)
		    begin
		       dummy_mon_data[data_width-2:0] <=  dummy_val[count];
		       dummy_mon_data[data_width-1]     <= 1'b1;		       
		       dummy_mon_vld    <= 1'b1;		  
		    end
		  else
		    begin
		       dummy_mon_data <= 'h0;
		       dummy_mon_vld    <= 1'b0;
		    end
	       end // if (dummy_master == 1)
	     else
	       begin
		  dummy_mon_data <= dummy_input;
		  dummy_mon_vld    <= dummy_input_vld;
		  
	       end
	  end
	
     end
endmodule // fm_dummy_block
