module MUX8to1(Dout, Din, sel);
output Dout;
input [7:0]Din;
input [2:0]sel;

wire M0_out, M1_out;

/*first*/
MUX4to1 M0(.Dout(M0_out),
            .Din(Din[7:4]),
            .sel(sel[1:0]));
            
MUX4to1 M1(.Dout(M1_out),
            .Din(Din[3:0]),
            .sel(sel[1:0]));
            
/*second*/
MUX2to1 M2(.c(Dout),
            .a(M0_out),
            .b(M1_out),
            .sel(sel[2]));

endmodule