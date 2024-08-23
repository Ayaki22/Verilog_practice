module FP_ADD(FS, FA, FB);
output [31:0] FS;
input [31:0] FA, FB;

wire FA_S, FB_S, FS_S;
wire [7:0] FA_E, FB_E, FS_E;
wire [22:0] FA_F, FB_F, FS_F;
wire [24:0] FB_F_Sh;
wire [24:0] FA_F_Ext, FB_F_Ext;
wire [24:0] FS_F_cal;

wire [7:0] Ex_diff;

//swap
assign {FA_S, FA_E, FA_F} = (FA[30:23] >= FB[30:23]) ? FA : FB;
assign {FB_S, FB_E, FB_F} = (FA[30:23] >= FB[30:23]) ? FB : FA;
assign FS = {FS_S, FS_E, FS_F};

//hidden bit
assign FA_F_Ext = {2'b01, FA_F};
assign FB_F_Ext = {2'b01, FB_F};

//right shift
assign Ex_diff = FA_E-FB_E;
assign FB_F_Sh = FB_F_Ext >> Ex_diff;

//result
assign FS_F_cal = FA_F_Ext + FB_F_Sh;

//normalized
assign FS_S = 1'b0;
assign FS_E = (FS_F_cal[24]) ? FA_E + 8'd1 : FA_E;
assign FS_F = (FS_F_cal[24]) ? FS_F_cal[23:1] : FS_F_cal[22:0];

endmodule