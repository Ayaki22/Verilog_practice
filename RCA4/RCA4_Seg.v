module RCA4_Seg(DSout, DCout, A, B, Cin);
output [6:0] DSout;
output DCout;
input [3:0] A, B;
input Cin;

wire [3:0] S;

RCA4 R0 (.Sout(S), .Cout(DCout), .A(A), .B(B), .Cin(Cin));
SevenSeg(.Din(S), .Dout(DSout));

endmodule