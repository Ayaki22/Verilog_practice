module RA16_display(Sout0, Sout1, Sout2, Sout3, add_cout, Read_value, addr, data, btn, RW, clk, reset);
output [6:0] Sout0, Sout1, Sout2, Sout3;
output add_cout;
output [3:0] Read_value;
input [2:0] addr;
input [3:0] data;
input btn, RW, clk, reset;

wire dc_out;
wire [15:0] add_sout;

Debounce_Circuit dc0(.Dout(dc_out), .Din(btn), .clk(clk), .reset(reset));

Reg_Add16 ra0(.add_sout(add_sout), 
                .add_cout(add_cout), 
                .read_value(Read_value), 
                .data(data), 
                .addr(addr), 
                .RW(RW), 
                .clk(dc_out), 
                .reset(reset));

SevenSeg s0(.Din(add_sout[3:0]),.Dout(Sout0));
SevenSeg s1(.Din(add_sout[7:4]),.Dout(Sout1));
SevenSeg s2(.Din(add_sout[11:8]),.Dout(Sout2));
SevenSeg s3(.Din(add_sout[15:12]),.Dout(Sout3));

endmodule