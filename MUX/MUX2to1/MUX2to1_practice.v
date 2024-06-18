/*
my first module
*/

module MUX2to1(c, a, b, sel);
output c;
input a, b, sel;

wire sel_, g0, g1;

//gate level
not n1(sel_, sel);
and a1(g0, a, sel);
and a2(g1, b, sel_);
or o1(c, g0, g1);

//dataflow level
// assign c = (a&sel) | (b&(!sel));

assign c = g0|g1;
assign g0 = a&sel;
assign g1 = b&(!sel);

//不可以用assign c = c|a;

//behavioral level主要是對電路的描述
//需要宣告reg在always block內賦值
//always@(需要偵測變化的線路) 可以用*來填入
//可以使用=賦值、if_else、case、for
//if_else有兩個以上描述需用begin_end包

module MUX2to1(c, a, b, sel);
output c;
input a, b, sel;

reg c ;

always@(a or b or sel)
begin
    if(sel)
        c = a;
    else
        c = b;
end
endmodule

//RTL就是綜合gate level、dataflow level、behavioral level三種方法設計電路