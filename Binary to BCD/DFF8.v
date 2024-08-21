module DFF8(Dout, Din, clk, reset, w_en);
output reg [7:0] Dout;
input [7:0] Din;
input clk, reset, w_en;

always@(posedge clk or negedge reset)begin
if (!reset)
	Dout <= 8'b0;
else
	Dout <= (w_en) ? Din : Dout;
end

endmodule