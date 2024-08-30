module mem_LED(LED_out, Fsel, Psel, clk, reset);
output [7:0] LED_out;
input [2:0] Fsel;
input Psel, clk, reset;

wire clk_i;
reg [3:0] addr_out;

FDiv f0(.Fout(clk_i), .Fin(clk), .Fsel(Fsel));

//address generator
always @(posedge clk_i or negedge reset)
    addr_out <= (!reset) ? 4'b0 : addr_out + 1'b1;

mem1 m0(.address({Psel,addr_out}),.clock(clk_i),.data(8'b0),.wren(1'b0),.q(LED_out));

endmodule