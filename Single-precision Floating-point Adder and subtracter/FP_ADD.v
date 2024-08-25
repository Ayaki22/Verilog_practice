module FP_ADD(FS, FA, FB, op);
output [31:0] FS;
input [31:0] FA, FB;
input op;

wire FA_S, FB_S, FS_S;
wire [7:0] FA_E, FB_E, FS_E;
wire [22:0] FA_F, FB_F, FS_F;
wire [25:0] FB_F_Sh;
wire [25:0] FA_F_Ext, FB_F_Ext;
wire [25:0] FS_F_cal;

wire [7:0] Ex_diff;

wire [25:0] FA_F_com, FB_F_com;
wire [25:0] detected_neg_FS_F_cal;
wire [31:0] detected_FB;

wire valid, zero;
wire [4:0] FS_shift_num;

assign detected_FB = {(op ^ FB[31]), FB[30:0]};

//swap
assign {FA_S, FA_E, FA_F} = (FA[30:23] >= detected_FB[30:23]) ? FA : detected_FB;
assign {FB_S, FB_E, FB_F} = (FA[30:23] >= detected_FB[30:23]) ? detected_FB : FA;
// assign FS = {FS_S, FS_E, FS_F};

//hidden bit with sign bit
assign FA_F_Ext = {3'b001, FA_F};//sign, carry, hidden
assign FB_F_Ext = {3'b001, FB_F};

//right shift
assign Ex_diff = FA_E-FB_E;
assign FB_F_Sh = FB_F_Ext >> Ex_diff;

//complement
assign FA_F_com = (FA_S) ? ~FA_F_Ext + 26'd1 : FA_F_Ext;
assign FB_F_com = (FB_S) ? ~FB_F_Sh + 26'd1 : FB_F_Sh;

//result
assign FS_F_cal = FA_F_com + FB_F_com;

//detect neg
assign detected_neg_FS_F_cal = (FS_F_cal[25]) ? ~FS_F_cal + 26'd1 : FS_F_cal;

PENC32 p0(.Dout(FS_shift_num), .Valid(valid), .Din({8'd0, detected_neg_FS_F_cal}));

//normalized
assign FS_S = FS_F_cal[25];
assign FS_E = (detected_neg_FS_F_cal[24]) ? FA_E + 8'd1 : FA_E - (5'd23 - FS_shift_num);
assign FS_F = (detected_neg_FS_F_cal[24]) ? detected_neg_FS_F_cal[23:1] : detected_neg_FS_F_cal[22:0] << (5'd23 - FS_shift_num);

//zero detection
assign zero = !(valid | detected_neg_FS_F_cal[24] | detected_neg_FS_F_cal[25]);
assign FS = (zero) ? 32'd0 : {FS_S, FS_E, FS_F};

endmodule