module CLA8(Cout, Sout, Cin, A, B);
output Cout;
output [7:0] Sout;
input Cin;
input [7:0] A, B;

wire c0_out;

CLA4 c0(.Cout(c0_out), .S(Sout[3:0]), .A(A[3:0]), .B(B[3:0]), .Cin(1'b0));
CLA4 c1(.Cout(Cout), .S(Sout[7:4]), .A(A[7:4]), .B(B[7:4]), .Cin(c0_out));

endmodule