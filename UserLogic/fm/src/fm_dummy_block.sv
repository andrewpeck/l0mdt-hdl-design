


module fm_dummy_block (
		       input logic 	   clk,
		       input logic 	   rst,
		       output logic [32:0] dummy_mon_data
		       );
   logic [31:0] 			   dummy_val[3] = {32'hC0FFEE, 32'hFEED5, 32'hBEECAFE};
   logic [5:0] 				   count;
   
   always @ (posedge clk)
     begin
	if(rst)
	  begin
	     dummy_mon_data  <= 'h0 ;
	     count                       <= 'h0;	     
	  end
	else
	  begin
	     count <= count + 1;

	     if(count < 3)
	       begin
		  dummy_mon_data <= {1'b1, dummy_val[count]};
		  
	       end
	     else
	       begin
		  dummy_mon_data <= 'h0;
		  
	       end
	     
	       
		 
	  end
	
     end
endmodule // fm_dummy_block
