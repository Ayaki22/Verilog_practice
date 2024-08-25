module FP2(FP_A, FP_B, Din, clk, reset);
output reg [31:0] FP_A, FP_B;
input [7:0] Din;
input clk, reset;

always @(posedge clk or negedge reset)
	if(!reset)begin
		FP_A <= 32'd0;
		FP_B <= 32'd0;
	end
	else begin
		FP_B[7:0] <= Din;
		FP_B[15:8] <= FP_B[7:0];
		FP_B[23:16] <= FP_B[15:8];
		FP_B[31:24] <= FP_B[23:16];
		
		FP_A[7:0] <= FP_B[31:24];
		FP_A[15:8] <= FP_A[7:0];
		FP_A[23:16] <= FP_A[15:8];
		FP_A[31:24] <= FP_A[23:16];
	end

endmodule