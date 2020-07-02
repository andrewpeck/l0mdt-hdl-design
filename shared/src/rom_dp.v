module rom_dp (
  input clka,
  input clkb,
  input  [MXADRB-1:0] addra, addrb,
  output reg [MXDATB-1:0] douta, doutb
);

//----------------------------------------------------------------------------------------------------------------------
// Parameters
//----------------------------------------------------------------------------------------------------------------------

parameter FALLING_EDGE = 0;
parameter MXADRB       = 12;
parameter MXDATB       = 9;
parameter ROMLENGTH    = 1 << MXADRB;
parameter ROM_FILE     = "rom_dp.mem";

//----------------------------------------------------------------------------------------------------------------------
// Signals
//----------------------------------------------------------------------------------------------------------------------

reg [MXDATB-1:0] rom [ROMLENGTH-1:0];
reg [MXDATB-1:0] rd_data0, rd_data1;
wire [MXDATB-1:0] din = 0;
wire we = 0;

//----------------------------------------------------------------------------------------------------------------------
// Read in ROM File
//----------------------------------------------------------------------------------------------------------------------

initial begin
  $readmemh(ROM_FILE, rom);
end

//----------------------------------------------------------------------------------------------------------------------
// ROM
//----------------------------------------------------------------------------------------------------------------------

always @(posedge clka) begin
   // dummy write to help Xilinx infer a dual port block RAM
   // needed in ISE
   if (we)      rom[addra]<=din;

   rd_data0 <= rom[addra];
   douta <= rd_data0;
end

always @(posedge clkb) begin
    rd_data1 <= rom[addrb];
    doutb <= rd_data1;
end

endmodule
