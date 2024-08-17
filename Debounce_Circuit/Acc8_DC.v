module Acc8_DC(Sout1, Sout0, btn, reset, clk);
output [6:0] Sout0, Sout1;
input btn, reset, clk;

wire dout_clk;

Debounce_Circuit dc0(.Dout(dout_clk), .Din(btn), .clk(clk), .reset(reset));
Acc8 a0(.Sout1(Sout1), .Sout0(Sout0), .w_en(1'b1), .clk(dout_clk), .reset(reset));

endmodule