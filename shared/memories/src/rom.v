module rom #(
  parameter MXADRB = 9,
  parameter MXDATB       = 11,
  parameter ROMLENGTH    = 1 << MXADRB,
  parameter ROM_FILE     = "a0.mem",
  parameter ROM_STYLE    = "auto"
) (
  input clka,
  input ena,
  input      [MXADRB-1:0] addra,
  output reg [MXDATB-1:0] douta
);

//---------------------------------------
// Parameters
//---------------------------------------



//---------------------------------------
// Signals
//---------------------------------------

(* ram_style = ROM_STYLE *) 
reg [MXDATB-1:0] rom [ROMLENGTH-1:0];
reg [MXDATB-1:0] rd_data0;

//---------------------------------------
// Read in ROM File
//---------------------------------------

initial begin
  $readmemh(ROM_FILE, rom);
end

//---------------------------------------
// ROM
//---------------------------------------

always @(posedge clka) begin
   if (ena) begin
      rd_data0 <= rom[addra];
   end
   douta    <= rd_data0;
end

endmodule
