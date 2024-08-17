module Acc8(Sout1, Sout0, w_en, clk, reset);
output [6:0] Sout1, Sout0;
input w_en, clk, reset;

wire [7:0] add_result, dout;

CLA8 c0(.Cout(), .Sout(add_result), .Cin(1'b0), .A(dout), .B(8'd1));
DFF8 d0(.Dout(dout), .Din(add_result), .clk(clk), .reset(reset), .w_en(w_en));

SevenSeg s0(.Din(dout[3:0]), .Dout(Sout0));
SevenSeg s1(.Din(dout[7:4]), .Dout(Sout1));

endmodule