module add16(Sout, Cout, A, B);
output [15:0] Sout;
output Cout;
input [15:0] A, B;


wire C0, C1, C2;


RCA4 r0(.Sout(Sout[3:0]), .Cout(C0), .A(A[3:0]), .B(B[3:0]), .Cin(1'b0));
RCA4 r1(.Sout(Sout[7:4]), .Cout(C1), .A(A[7:4]), .B(B[7:4]), .Cin(C0));
RCA4 r2(.Sout(Sout[11:8]), .Cout(C2), .A(A[11:8]), .B(B[11:8]), .Cin(C1));
RCA4 r3(.Sout(Sout[15:12]), .Cout(Cout), .A(A[15:12]), .B(B[15:12]), .Cin(C2));

endmodule