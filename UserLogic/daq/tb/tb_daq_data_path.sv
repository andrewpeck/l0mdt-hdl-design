module tb_daq_data_path;

   int fd, ptr = 0, last = 0, ii = 0, line_ctr = 0, bx_cntr = 0;
   string line;

   bit [255:0] lhc_time      ;
   bit [255:0] opening_offset;
   bit [255:0] request_offset;
   bit [255:0] closing_offset;
   bit [255:0] window_timeout;
   bit [255:0] busy_threshold; 
   bit [255:0] inn_tdc_hits;
   bit [255:0] mid_tdc_hits;
   bit [255:0] out_tdc_hits; 
   bit [255:0] ext_tdc_hits;

   byte	       x;
   bit	       clk = 1, bx = 0;

   always @ (posedge clk) begin
      if (bx_cntr < 8) begin
	 bx_cntr++;
	 bx = 0;
      end else begin
	 bx = 1;
	 bx_cntr=0;
      end
   end

   always #1 clk = !clk;

   initial begin
      fd = $fopen("../tb/stimulus.txt", "r");
   end
   
   always @ (posedge clk) begin

      if (!$feof(fd)) begin
	 
      	 $fgets(line, fd);
      	 $display("Line: %s", line);

	 if (line != "") begin
	 
	    ii = 0;	 
	    while(line[ii] == " ") ii++;
	    if (!(line[ii] == "\n" || line[ii] == "#")) begin

	       if (line_ctr == 0) begin
		  while(line[ii] == " ") ii++;
		  last = ii;
		  while (line[ii] != " " && ii <= line.len()) ii++;
      		  $display("word: %d"    , line.substr(last, ii-1));
		  $sscanf(line.substr(last, ii-1), "%d", opening_offset);

		  while(line[ii] == " ") ii++;
		  last = ii;
		  while (line[ii] != " " && ii <= line.len()) ii++;
      		  $display("word: %d"    , line.substr(last, ii-1));
		  $sscanf(line.substr(last, ii-1), "%d", request_offset);

		  while(line[ii] == " ") ii++;
		  last = ii;
		  while (line[ii] != " " && ii <= line.len()) ii++;
      		  $display("word: %d"    , line.substr(last, ii-1));
		  $sscanf(line.substr(last, ii-1), "%d", closing_offset);

		  while(line[ii] == " ") ii++;
		  last = ii;
		  while (line[ii] != " " && ii <= line.len()) ii++;
      		  $display("word: %d"    , line.substr(last, ii-1));
		  $sscanf(line.substr(last, ii-1), "%d", window_timeout);

		  while(line[ii] == " ") ii++;
		  last = ii;
		  while (line[ii] != " " && ii <= line.len()) ii++;
      		  $display("word: %d"    , line.substr(last, ii-1));
		  $sscanf(line.substr(last, ii-1), "%d", busy_threshold);
		  line_ctr++;
	       end else begin
		  while(line[ii] == " ") ii++;
		  last = ii;
		  while (line[ii] != " " && ii <= line.len()) ii++;
      		  $display("word: %d"    , line.substr(last, ii-1));
		  $sscanf(line.substr(last, ii-1), "%d", lhc_time);

		  while(line[ii] == " ") ii++;
		  last = ii;
		  while (line[ii] != " " && ii <= line.len()) ii++;
      		  $display("word: %d"    , line.substr(last, ii-1));
		  $sscanf(line.substr(last, ii-1), "%d", inn_tdc_hits);

		  while(line[ii] == " ") ii++;
		  last = ii;
		  while (line[ii] != " " && ii <= line.len()) ii++;
      		  $display("word: %d"    , line.substr(last, ii-1));
		  $sscanf(line.substr(last, ii-1), "%d", mid_tdc_hits);

		  while(line[ii] == " ") ii++;
		  last = ii;
		  while (line[ii] != " " && ii <= line.len()) ii++;
      		  $display("word: %d"    , line.substr(last, ii-1));
		  $sscanf(line.substr(last, ii-1), "%d", out_tdc_hits);

		  while(line[ii] == " ") ii++;
		  last = ii;
		  while (line[ii] != " " && ii < line.len()) ii++;
      		  $display("word: %d"    , line.substr(last, ii-1));
		  $sscanf(line.substr(last, ii-1), "%d", ext_tdc_hits);
	       end // else: !if(line_ctr == 0)
	    end // if (!(line[ii] == "\n" || line[ii] == "#"))
	 end // if (line != "")
      end // if (!$feof(fd))
   end // always @ (posedge clk)
endmodule // tb

   
   
