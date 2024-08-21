module FA(S,G,P,Cin,A,B);
output S,G,P;//G=A*B, P=A+B
input A,B,Cin;

xor(S,A,B,Cin);

assign G = A & B;
assign P = A + B;

endmodule