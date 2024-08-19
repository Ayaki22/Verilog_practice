module S_Reg(Sout, Pout, Din, SW, clk, reset);
output Sout;
output [7:0] Pout;
input Din, SW, clk, reset;

reg [7:0] SReg;

wire sin;

assign sin = (SW) ? SReg[7] : Din;

always @(posedge clk or negedge reset)
	if(!reset)
		SReg <= 8'd0;
	else
		SReg <= {SReg[6:0], sin};

assign Sout = SReg[7];
assign Pout = SReg;

endmodule