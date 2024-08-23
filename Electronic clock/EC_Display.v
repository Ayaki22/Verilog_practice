module EC_Display(Sout0, Sout1, Sout2, mode_out, wdata, wen, chmode, clk, reset);
output [6:0] Sout0, Sout1, Sout2;
output [2:0] mode_out;
input [7:0] wdata;
input wen, chmode, clk, reset;

wire ch_mode, one_sec;
reg [1:0] mode, next_mode;
wire [7:0] binary;
wire [3:0] bcd0, bcd1, bcd2;

Debounce_Circuit d0(.Dout(ch_mode), .Din(chmode), .clk(clk), .reset(reset));

//Mode control
always @(posedge ch_mode or negedge reset)begin
    if(!reset)
        mode <= 2'd0;
    else
        mode <= next_mode;
end

always @(*)
    case(mode)
        2'd0 : next_mode = 2'd1;
        2'd1 : next_mode = 2'd2;
        2'd2 : next_mode = 2'd0;
        default : next_mode = 2'd0;
    endcase

//Mode decoder
assign mode_out[2] = (mode == 2'd2) ? 1'b1 : 1'b0;
assign mode_out[1] = (mode == 2'd1) ? 1'b1 : 1'b0;
assign mode_out[0] = (mode == 2'd0) ? 1'b1 : 1'b0;

FDiv f0(.Fout(one_sec), .Fin(clk), .Fsel(3'd3));

Electronic_clock e0(.display_num(binary), .wdata(wdata), .mode(mode), .wen(wen), .clk(one_sec), .reset(reset));

BtoBCD bt0(.BCD_0(bcd0), .BCD_1(bcd1), .BCD_2(bcd2), .Binary(binary));

SevenSeg s0(.Din(bcd0), .Dout(Sout0));
SevenSeg s1(.Din(bcd1), .Dout(Sout1));
SevenSeg s2(.Din(bcd2), .Dout(Sout2));

endmodule