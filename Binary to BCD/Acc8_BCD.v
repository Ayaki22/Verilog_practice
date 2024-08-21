module Acc8_BCD(Seg0, Seg1, Seg2, btn, w_en, clk, reset);
output [6:0] Seg0, Seg1, Seg2;
input btn, w_en, clk, reset;

wire dout;
wire [7:0] acc8_out;
wire [3:0] bcd_0_out, bcd_1_out, bcd_2_out;

Debounce_Circuit d0(.Dout(dout), .Din(btn), .clk(clk), .reset(reset));
Acc8 a0(.Dout(acc8_out), .w_en(w_en), .clk(dout), .reset(reset));
BtoBCD b0(.BCD_0(bcd_0_out), .BCD_1(bcd_1_out), .BCD_2(bcd_2_out), .Binary(acc8_out));
SevenSeg s0(.Din(bcd_0_out), .Dout(Seg0));
SevenSeg s1(.Din(bcd_1_out), .Dout(Seg1));
SevenSeg s2(.Din(bcd_2_out), .Dout(Seg2));

endmodule