module MultiplierUnit(Pi, A, B);
output [3:0] Pi;
input [3:0]A;
input B;

assign Pi = {A[3]&B, A[2]&B, A[1]&B, A[0]&B};
endmodule