module FP_ADD_Display(Sout0, Sout1, Sout2, Sout3, Din, HL, btn, clk, reset);
output [6:0] Sout0, Sout1, Sout2, Sout3;
input [7:0] Din;
input HL, btn, clk, reset;

wire dc_out;
wire [31:0] fa, fb, fs;
wire [3:0] seg0, seg1, seg2, seg3;

Debounce_Circuit d0(.Dout(dc_out), .Din(btn), .clk(clk), .reset(reset));

FP2 f0(.FP_A(fa), .FP_B(fb), .Din(Din), .clk(dc_out), .reset(reset));

FP_ADD fp0(.FS(fs), .FA(fa), .FB(fb));

assign {seg3, seg2, seg1, seg0} = (HL) ? fs[31:16] : fs[15:0];

SevenSeg s0(.Din(seg0),.Dout(Sout0));
SevenSeg s1(.Din(seg1),.Dout(Sout1));
SevenSeg s2(.Din(seg2),.Dout(Sout2));
SevenSeg s3(.Din(seg3),.Dout(Sout3));

endmodule