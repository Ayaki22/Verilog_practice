module S_Reg(Sout, Pout, Sin, SW, clk, reset, PS, Pin);
output Sout;
output [7:0] Pout;
input Sin, SW, clk, reset, PS;
input [7:0] Pin;

reg [7:0] SReg;

always @(posedge clk or negedge reset)
	if(!reset)
		SReg <= 8'd0;
	else if(SW)
		SReg <= {SReg[6:0], SReg[7]};
	else
		SReg <= (PS) ? Pin : {SReg[6:0], Sin};

assign Sout = SReg[7];
assign Pout = SReg;

endmodule