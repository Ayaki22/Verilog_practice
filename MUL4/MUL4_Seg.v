module MUL4_Seg(Sout1, Sout0, A,B);//2 seg
output [6:0] Sout1, Sout0;
input [3:0] A,B;

wire [7:0] P;

MUL4 m1 (.P(P), .A(A), .B(B));

SevenSeg s1 (.Din(P[3:0]), .Dout(Sout0));
SevenSeg s2 (.Din(P[7:4]), .Dout(Sout1));

endmodule