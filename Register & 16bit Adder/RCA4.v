module RCA4(Sout, Cout, A, B, Cin);
output [3:0] Sout;
output Cout;
input [3:0] A,B;
input Cin;

wire C0, C1, C2;

FA F0(.Cout(c0), .S(Sout[0]), .A(A[0]), .B(B[0]), .Cin(Cin));
FA F1(.Cout(c1), .S(Sout[1]), .A(A[1]), .B(B[1]), .Cin(c0));
FA F2(.Cout(c2), .S(Sout[2]), .A(A[2]), .B(B[2]), .Cin(c1));
FA F3(.Cout(Cout), .S(Sout[3]), .A(A[3]), .B(B[3]), .Cin(c2));


endmodule