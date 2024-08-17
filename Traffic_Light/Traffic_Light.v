module Traffic_Light(LightA, LightB, clk, reset);
output reg [2:0] LightA, LightB;
input clk, reset;

reg [3:0] ncount, ccount;// next count, currnet count max count is 10
reg [1:0] ns, cs;// next state, current state

//next state combinational logic
always @(*)begin
    case(cs)
    2'b00:begin
        ncount = (ccount < 4'd8) ? ccount + 4'd1 : 4'd1;
        ns = (ccount < 4'd8) ? 2'b00 : 2'b01;
    end
    
    2'b01:begin
        ncount = (ccount < 4'd3) ? ccount + 4'd1 : 4'd1;
        ns = (ccount < 4'd3) ? 2'b01 : 2'b10;
    end
    
    2'b10:begin
        ncount = (ccount < 4'd10) ? ccount + 4'd1 : 4'd1;
        ns = (ccount < 4'd10) ? 2'b10 : 2'b11;
    end
    
    2'b11:begin
        ncount = (ccount < 4'd3) ? ccount + 4'd1 : 4'd1;
        ns = (ccount < 4'd3) ? 2'b11 : 2'b00;
    end
    
    endcase
end

//state register
always @(posedge clk or negedge reset)begin
    if(!reset)begin
        ccount <= 4'd1;
        cs <= 2'b00;
    end
    else begin
        ccount <= ncount;
        cs <= ns;
    end
end

//output combination logic
always @(*)begin
    case(cs)
    2'b00:begin
        LightA = 3'b001;
        LightB = 3'b100;
    end
    
    2'b01:begin
        LightA = 3'b010;
        LightB = 3'b100;
    end
    
    2'b10:begin
        LightA = 3'b100;
        LightB = 3'b001;
    end
    
    2'b11:begin
        LightA = 3'b100;
        LightB = 3'b010;
    end
    
    endcase
end

endmodule