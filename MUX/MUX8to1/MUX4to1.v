module MUX4to1(Dout, Din, sel);
output Dout;
input [3:0]Din;
input [1:0]sel;

wire M0_out, M1_out;

/*first*/
MUX2to1 M0(.c(M0_out),
            .a(Din[3]),
            .b(Din[2]),
            .sel(sel[0]));
            
MUX2to1 M1(.c(M1_out),
            .a(Din[1]),
            .b(Din[0]),
            .sel(sel[0]));
            
/*second*/
MUX2to1 M2(.c(Dout),
            .a(M0_out),
            .b(M1_out),
            .sel(sel[1]));

endmodule