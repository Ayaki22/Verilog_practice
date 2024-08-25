module PENC8(Dout, Valid, Din);
output [2:0] Dout;
output Valid;
input [7:0] Din;

wire v0, v1;
wire [1:0] d0, d1;

PENC4 p0(.Dout(d0), .Valid(v0), .Din(Din[3:0]));
PENC4 p1(.Dout(d1), .Valid(v1), .Din(Din[7:4]));

assign Valid = v1 | v0;
assign Dout[2] = v1;
assign Dout[1:0] = (v1) ? d1 : d0;

endmodule