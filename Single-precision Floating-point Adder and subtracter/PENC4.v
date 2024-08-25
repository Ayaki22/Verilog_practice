module PENC4(Dout, Valid, Din);
output [1:0] Dout;
output Valid;
input [3:0] Din;

assign Dout = {(Din[3] | Din[2]), Din[3] | ((!Din[2]) & Din[1])};
assign Valid = |Din;

endmodule