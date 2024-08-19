module SR_display(Seg1, Seg0, Sout, Sin, SW, btn, clk, reset, Pin, PS);
output [6:0] Seg1, Seg0;
output Sout;
input Sin, SW, btn, clk, reset, PS;
input [7:1] Pin;//Pin[0] for Sin

wire SR_clk;
wire [7:0] Pout;

Debounce_Circuit dc0(.Dout(SR_clk), .Din(btn), .clk(clk), .reset(reset));

S_Reg sr0(.Sout(Sout), .Pout(Pout), .Sin(Sin), .SW(SW), .clk(SR_clk), .reset(reset), .PS(PS), .Pin(Pin));

SevenSeg s0(.Din(Pout[3:0]), .Dout(Seg0));
SevenSeg s1(.Din(Pout[7:4]), .Dout(Seg1));

endmodule