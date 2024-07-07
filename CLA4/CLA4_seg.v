module CLA4_seg(Cout, Sout, A, B, Cin);
output Cout;
output [6:0] Sout;
input [3:0] A,B;
input Cin;

wire [3:0] S;

CLA4 cla0(.Cout(Cout), .S(S), .A(A), .B(B), .Cin(Cin));
SevenSeg s0 (.Din(S),.Dout(Sout));

endmodule