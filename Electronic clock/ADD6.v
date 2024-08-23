module ADD6(Dout, Cout, Din);
output [3:0]Dout;
output Cout;
input [3:0] Din;

assign Dout[0] = Din[0];
assign Dout[1] = !Din[1];
assign Dout[2] = (!Din[1]) ^ Din[2];
assign Dout[3] = (Din[1] | Din[2]) ^ Din[3];

assign Cout = (Din[1] | Din[2]) & Din[3];

endmodule