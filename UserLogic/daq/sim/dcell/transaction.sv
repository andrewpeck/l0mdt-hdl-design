class Transaction;

   // declaring the transaction items

   bit [11:0] bcid;
   rand bit        allowed;
   rand bit        wren;
   rand bit [511:0] pld;

   rand bit l1a_req;
   
    // constaint, to generate any one among write and read
    constraint wr_rd_c {
       wren == 1 -> pld[27:12] == 16'hF00D;
       wren == 0 -> pld[27:12] == 16'hDEAD;
    }
       
    function void post_randomize();
       begin
          pld[11:0] = bcid;
       end
    endfunction
endclass // Transaction
