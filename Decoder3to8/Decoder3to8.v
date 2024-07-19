module Decoder3to8(Dout, Din);
output reg [7:0] Dout;
input [2:0] Din;

always@(*)
case(Din)
3'b000:Dout <= 8'b0000_0001;
3'b001:Dout <= 8'b0000_0010;
3'b010:Dout <= 8'b0000_0100;
3'b011:Dout <= 8'b0000_1000;
3'b100:Dout <= 8'b0001_0000;
3'b101:Dout <= 8'b0010_0000;
3'b110:Dout <= 8'b0100_0000;
3'b111:Dout <= 8'b1000_0000;
endcase

endmodule