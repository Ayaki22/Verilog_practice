module Reg_Add16(add_sout, add_cout, read_value, data, addr, RW, clk, reset);
output [15:0] add_sout;
output [3:0] read_value;
output add_cout;
input [3:0] data;
input [2:0] addr;
input RW, clk, reset;

reg [3:0] reg_file [0:7];

wire [7:0] reg_en, dout, w_en;
wire [15:0] add_in_A, add_in_B;

Decoder3to8 d0(.Dout(dout), .Din(addr));

assign w_en = (RW) ? 8'd0 : dout;

always @(posedge clk or negedge reset)begin
    if(!reset)begin
        //要打完
        reg_file[0] <= 4'd0;
        reg_file[1] <= 4'd0;
        reg_file[2] <= 4'd0;
        reg_file[3] <= 4'd0;
        reg_file[4] <= 4'd0;
        reg_file[5] <= 4'd0;
        reg_file[6] <= 4'd0;
        reg_file[7] <= 4'd0;
    end
    else begin
        reg_file[0] <= (w_en[0]) ? data : reg_file[0];
        reg_file[1] <= (w_en[1]) ? data : reg_file[1];
        reg_file[2] <= (w_en[2]) ? data : reg_file[2];
        reg_file[3] <= (w_en[3]) ? data : reg_file[3];
        reg_file[4] <= (w_en[4]) ? data : reg_file[4];
        reg_file[5] <= (w_en[5]) ? data : reg_file[5];
        reg_file[6] <= (w_en[6]) ? data : reg_file[6];
        reg_file[7] <= (w_en[7]) ? data : reg_file[7];
    end
end

//assign add_in_A = reg_file[3:0];error
assign add_in_A = {reg_file[3],reg_file[2],reg_file[1],reg_file[0]};

//assign add_in_B = reg_file[7:4];error
assign add_in_B = {reg_file[7],reg_file[6],reg_file[5],reg_file[4]};

add16 a0(.Sout(add_sout), .Cout(add_cout), .A(add_in_A), .B(add_in_B));

assign read_value = reg_file[addr];
/*
always @(*)
case(w_en)
    8'b00000001:read_value <= reg_file[0];
    8'b00000010:read_value <= reg_file[1];
    8'b00000100:read_value <= reg_file[2];
    8'b00001000:read_value <= reg_file[3];
    8'b00010000:read_value <= reg_file[4];
    8'b00100000:read_value <= reg_file[5];
    8'b01000000:read_value <= reg_file[6];
    8'b10000000:read_value <= reg_file[7];
endcase
*/
endmodule