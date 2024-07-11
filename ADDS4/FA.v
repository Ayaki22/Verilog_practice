module FA(Cout, S, A, B, Cin);
output Cout, S;
input A, B, Cin;

xor X1(S, A, B, Cin);

assign Cout = (A&B)|(B&Cin)|(A&Cin);


endmodule