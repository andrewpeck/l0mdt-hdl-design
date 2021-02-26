`ifndef MAJORITY_VOTER_V
`define MAJORITY_VOTER_V


`timescale 1ns/1ps
module majority_voter (in1, in2, in3, out, err);
    // synopsys template
    
    parameter WIDTH = 1;
	parameter QUIET = 0;
	parameter HALT = 0;
    
    input   [(WIDTH-1):0]   in1, in2, in3;
    
    output  [(WIDTH-1):0]   out;
    output          	    err;
    
    reg     [(WIDTH-1):0]   out;
    reg     	    	    err;
    
	reg errdel ;
	
    always @* begin
    	err = 0;
		out = vote (in1,in2,in3);
		
		
    end
	
`ifdef DC
`else
	always @* begin
		errdel <=#0.001 err;
		
		if (errdel && err) begin
			if (!QUIET) begin
				//$display("........................%d: SEU!!! %m", $time);
				if (HALT) $stop;
			end
		end
	end
`endif
	
    
    function vote_atom;
    	input in1,in2,in3;
    	begin
		if (in1 != in2) begin
    	    		vote_atom   = in3;
			err     	= 1;
		end
		else begin
		    	if (in2 != in3) err = 1;
    	    		vote_atom = in1;
		end
    	end
    endfunction
    
    function [(WIDTH-1):0] vote;
        input   [(WIDTH-1):0]   in1, in2, in3;
	integer i;
    	begin
	    for (i=0; i<WIDTH; i=i+1)
	    	vote[i] = vote_atom( in1[i], in2[i], in3[i] );
	end
    endfunction
    
 
endmodule

`endif //MAJORITY_VOTER_V
