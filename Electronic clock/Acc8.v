module Acc8(Dout, w_en, clk, reset);
output [7:0] Dout;
input w_en, clk, reset;

wire [7:0] add_result;

CLA8 c0(.Cout(), .Sout(add_result), .Cin(1'b0), .A(Dout), .B(8'd1));
DFF8 d0(.Dout(Dout), .Din(add_result), .clk(clk), .reset(reset), .w_en(w_en));

endmodule