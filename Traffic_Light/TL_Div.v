module TL_Div(LightA, LightB, clk, reset);
output [2:0] LightA, LightB;
input clk, reset;

wire clk_1s;

Traffic_Light tl0(.LightA(LightA), .LightB(LightB), .clk(clk_1s), .reset(reset));
FDiv fd0(.Fout(clk_1s), .Fin(clk), .Fsel(3'b011));

endmodule