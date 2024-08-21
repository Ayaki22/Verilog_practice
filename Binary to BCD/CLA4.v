module CLA4(Cout, S, A, B, Cin);
output Cout;
output [3:0] S;
input [3:0] A,B;
input Cin;

wire [3:0] G, P;
wire C0, C1, C2;

FA FA0(.S(S[0]), .G(G[0]), .P(P[0]), .Cin(Cin), .A(A[0]), .B(B[0]));
FA FA1(.S(S[1]), .G(G[1]), .P(P[1]), .Cin(C0), .A(A[1]), .B(B[1]));
FA FA2(.S(S[2]), .G(G[2]), .P(P[2]), .Cin(C1), .A(A[2]), .B(B[2]));
FA FA3(.S(S[3]), .G(G[3]), .P(P[3]), .Cin(C2), .A(A[3]), .B(B[3]));

CLG CLG0(.Cout(Cout), .C0(C0), .C1(C1), .C2(C2), .Cin(Cin), .G(G), .P(P));

endmodule