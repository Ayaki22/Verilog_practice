module Stack4_8(data_out, full, empty, data_in, push_pop, enable, clk, reset);
output [3:0] data_out;
output reg empty;
output full;
input [3:0] data_in;
input push_pop, enable, clk, reset;

reg [3:0] stack_mem [0:7];
reg [2:0] sp_store;
wire [2:0] sp;

assign sp = (full) ? sp_store : ((empty) ? 3'd0 : sp_store + 3'd1);
assign full = (sp_store == 3'd7);
assign data_out = (empty) ? 4'd0 : stack_mem[sp_store];

always @(posedge clk or negedge reset)
    if(!reset)begin
        sp_store <= 3'd0;
        empty <= 1'b1;
    end
    else
        if(enable)
            if(push_pop)begin //push
                sp_store <= sp;
                stack_mem[sp] <= (full) ? stack_mem[sp] : data_in;
                empty <= 1'b0;
            end
            else begin
                sp_store <= (sp_store == 3'd0) ? 3'd0 : sp_store - 3'd1;
                stack_mem[sp_store] <= stack_mem[sp_store];
                empty <=(sp_store == 3'd0);
            end
        else begin
            sp_store <= sp_store;
            stack_mem[sp_store] <= stack_mem[sp_store];
            empty <= empty;
        end

endmodule