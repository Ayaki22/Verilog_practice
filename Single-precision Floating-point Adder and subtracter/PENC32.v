module PENC32(Dout, Valid, Din);
output [4:0] Dout;
output Valid;
input [31:0] Din;

wire v0, v1, v2, v3;
wire [2:0] d0, d1, d2, d3;

PENC8 p0(.Dout(d0), .Valid(v0), .Din(Din[7:0]));
PENC8 p1(.Dout(d1), .Valid(v1), .Din(Din[15:8]));
PENC8 p2(.Dout(d2), .Valid(v2), .Din(Din[23:16]));
PENC8 p3(.Dout(d3), .Valid(v3), .Din(Din[31:24]));

assign Valid = v3 | v2 | v1 | v0;
assign Dout[4] = v3 | v2;
assign Dout[3] = v3 | (!v2 & v1);
assign Dout[2:0] = (Dout[4]) ? (Dout[3] ? d3 : d2) : (Dout[3] ? d1 :d0);

endmodule