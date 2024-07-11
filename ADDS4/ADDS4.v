module ADDS4(Cout, V, S, A, B, M);
output Cout, V;
output [3:0] S;
input [3:0] A, B;
input M;

wire [3:0] NB;
wire C0, C1, C2;

assign NB = B ^ {4{M}};

FA F0(.Cout(C0), .S(S[0]), .A(A[0]), .B(NB[0]), .Cin(M));
FA F1(.Cout(C1), .S(S[1]), .A(A[1]), .B(NB[1]), .Cin(C0));
FA F2(.Cout(C2), .S(S[2]), .A(A[2]), .B(NB[2]), .Cin(C1));
FA F3(.Cout(Cout), .S(S[3]), .A(A[3]), .B(NB[3]), .Cin(C2));

assign V = C2 ^ Cout;

endmodule