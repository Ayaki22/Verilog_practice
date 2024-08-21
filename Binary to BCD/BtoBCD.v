module BtoBCD(BCD_0, BCD_1, BCD_2, Binary);
output [3:0] BCD_0, BCD_1, BCD_2;
input [7:0] Binary;

wire [3:0] add6_dout, low_byte_mux;
wire add6_cout;
wire [7:0] low_to_high_byte;

ADD6 a0(.Dout(add6_dout), .Cout(add6_cout), .Din(Binary[3:0]));
assign low_byte_mux = (add6_cout) ? add6_dout: Binary[3:0];
assign low_to_high_byte = {3'b000, add6_cout, low_byte_mux};

wire [7:0] BADD_sout0, BADD_sout1, BADD_sout2;
wire [7:0] high_byte_mux_0, high_byte_mux_1, high_byte_mux_2, high_byte_mux_3;
wire BADD2_cout, BADD3_cout, maybe_hundred;

assign high_byte_mux_0 = (Binary[4]) ? 8'h16 : 8'h00;
BCDADD b0(.Sout(BADD_sout0), .Cout(), .A(low_to_high_byte), .B(high_byte_mux_0));

assign high_byte_mux_1 = (Binary[5]) ? 8'h32 : 8'h00;
BCDADD b1(.Sout(BADD_sout1), .Cout(), .A(BADD_sout0), .B(high_byte_mux_1));

assign high_byte_mux_2 = (Binary[6]) ? 8'h64 : 8'h00;
BCDADD b2(.Sout(BADD_sout2), .Cout(BADD2_cout), .A(BADD_sout1), .B(high_byte_mux_2));

assign high_byte_mux_3 = (Binary[7]) ? 8'h28 : 8'h00;
BCDADD b3(.Sout({BCD_1[3:0],BCD_0[3:0]}), .Cout(BADD3_cout), .A(BADD_sout2), .B(high_byte_mux_3));

assign maybe_hundred = BADD2_cout | BADD3_cout;
fa_old f0(.Cout(BCD_2[1]), .S(BCD_2[0]), .A(Binary[7]), .B(maybe_hundred), .Cin(1'b0));

assign BCD_2[3:2] = 2'b00;

endmodule