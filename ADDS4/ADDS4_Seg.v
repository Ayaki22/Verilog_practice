module ADDS4_Seg(Cout, Sout, V, A, B, M);
output Cout,V;
output [6:0] Sout;
input [3:0] A, B;
input M;

wire [3:0] S;

ADDS4 as0(.Cout(Cout), .V(V), .S(S), .A(A), .B(B), .M(M));
SevenSeg s0(.Din(S), .Dout(Sout));

endmodule