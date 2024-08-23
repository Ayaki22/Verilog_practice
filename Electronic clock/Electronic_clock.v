module Electronic_clock(display_num, wdata, mode, wen, clk, reset);
output reg [7:0] display_num;
input [7:0] wdata;
input [1:0] mode;
input wen, clk, reset;

reg [7:0] curr_h, curr_m, curr_s;
wire [7:0] curr_h_added, curr_m_added, curr_s_added;
wire [7:0] next_h, next_m, next_s;

//Next time generator
assign curr_h_added = curr_h + 8'd1;
assign curr_m_added = curr_m + 8'd1;
assign curr_s_added = curr_s + 8'd1;

assign next_h = (curr_m_added == 8'd60 && curr_s_added == 8'd60) ? ((curr_h_added == 8'd24) ? 8'd0 : curr_h_added) : curr_h;
assign next_m = (curr_s_added == 8'd60) ? ((curr_m_added == 8'd60) ? 8'd0 : curr_m_added) : curr_m;
assign next_s = (curr_s_added == 8'd60) ? 8'd0 : curr_s_added;

//Time register
always @(posedge clk or negedge reset)begin
    if (!reset)begin
        curr_h <= 8'd0;
        curr_m <= 8'd0;
        curr_s <= 8'd0;
    end
    else begin
        curr_h <= (wen && (mode==2'd2)) ? wdata : next_h;
        curr_m <= (wen && (mode==2'd1)) ? wdata : next_m;
        curr_s <= (wen && (mode==2'd0)) ? wdata : next_s;
    end
end

//Display circuit
always @(*)
    case(mode)
        2'd2 : display_num <= curr_h;
        2'd1 : display_num <= curr_m;
        2'd0 : display_num <= curr_s;
        default : display_num <= curr_s;
    endcase

endmodule