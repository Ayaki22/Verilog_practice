module FDiv(Fout, Fin, Fsel);
output reg Fout;
input Fin;
input [2:0] Fsel;

wire reset, F_t;
wire [31:0] Dout, Dout_h, Acc_out;

assign reset = (Acc_out >= Dout);
assign F_t = (Acc_out > Dout_h);
assign Dout_h = {1'b0, Dout[31:1]};

Acc32 a0(.Acc_out(Acc_out), .w_en(1'b1), .clk(Fin), .reset(reset));

Div_Dec d0(.Dout(Dout), .Din(Fsel));

always@(posedge Fin)
	Fout <= F_t;

endmodule