module stack_display(Sout, full, empty, data_in, push_pop, btn, enable, clk, reset);
output [6:0] Sout;
output full, empty;
input [3:0] data_in;
input push_pop, btn, enable, clk, reset;

wire dc_out;
wire [3:0] data_out;

Debounce_Circuit d0(.Dout(dc_out), .Din(btn), .clk(clk), .reset(reset));

Stack4_8 st0(.data_out(data_out), .full(full), .empty(empty), .data_in(data_in), .push_pop(push_pop), .enable(enable), .clk(dc_out), .reset(reset));

SevenSeg s0(.Din(data_out), .Dout(Sout));

endmodule