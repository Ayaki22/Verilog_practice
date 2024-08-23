module BCDADD(Sout, Cout, A, B);
output [7:0] Sout;
output Cout;
input [7:0] A, B;

wire cla_cout_0, cla_cout_1, add6_cout_0, add6_cout_1, or_0;
wire [3:0] cla_sout_0, cla_sout_1, add6_dout_0, add6_dout_1; 

CLA4 c0(.Cout(cla_cout_0), .S(cla_sout_0), .A(A[3:0]), .B(B[3:0]), .Cin(1'b0));
ADD6 a0(.Dout(add6_dout_0), .Cout(add6_cout_0), .Din(cla_sout_0));
assign or_0 = cla_cout_0 | add6_cout_0;
assign Sout[3:0] = (or_0) ? add6_dout_0 : cla_sout_0;

CLA4 c1(.Cout(cla_cout_1), .S(cla_sout_1), .A(A[7:4]), .B(B[7:4]), .Cin(or_0));
ADD6 a1(.Dout(add6_dout_1), .Cout(add6_cout_1), .Din(cla_sout_1));
assign Cout = cla_cout_1 | add6_cout_1;
assign Sout[7:4] = (Cout) ? add6_dout_1 : cla_sout_1;

endmodule