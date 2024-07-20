module MUL4(P, A, B);
output [7:0] P;
input [3:0] A,B;

wire [3:0] pi_1, pi_2, pi_3, pi_4;
parameter zero = 1'b0;
wire [3:0] tmp_sum_1, tmp_sum_2, tmp_sum_3;
wire tmp_cout_1, tmp_cout_2, tmp_cout_3;

assign P = {tmp_cout_3, tmp_sum_3, tmp_sum_2[0], tmp_sum_1[0], pi_1[0]};

MultiplierUnit MU1(.Pi(pi_1), .A(A), .B(B[0]));
MultiplierUnit MU2(.Pi(pi_2), .A(A), .B(B[1]));
MultiplierUnit MU3(.Pi(pi_3), .A(A), .B(B[2]));
MultiplierUnit MU4(.Pi(pi_4), .A(A), .B(B[3]));

CLA4 c1(.Cout(tmp_cout_1), .S(tmp_sum_1), .A(pi_2), .B({zero,pi_1[3:1]}), .Cin(zero));
CLA4 c2(.Cout(tmp_cout_2), .S(tmp_sum_2), .A(pi_3), .B({zero,tmp_sum_1[3:1]}), .Cin(tmp_cout_1));
CLA4 c3(.Cout(tmp_cout_3), .S(tmp_sum_3), .A(pi_4), .B({zero,tmp_sum_2[3:1]}), .Cin(tmp_cout_2));



endmodule