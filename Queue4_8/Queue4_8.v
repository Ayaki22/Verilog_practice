module Queue4_8(data_out, full, empty, data_in, push_pop, enable, clk, reset);
output [3:0] data_out;
output full;
output reg empty;
input [3:0] data_in;
input push_pop, enable, clk, reset;

reg [3:0] queue_mem [0:7];
reg [2:0] read_idx;


always @(posedge clk or negedge reset)
    if(!reset)begin
        read_idx <= 3'd0;
        empty <= 1'd1;
    end
    else if(enable)begin
        if (push_pop)begin //push
            if (!full)begin
                queue_mem[7]<=queue_mem[6];
                queue_mem[6]<=queue_mem[5];
                queue_mem[5]<=queue_mem[4];
                queue_mem[4]<=queue_mem[3];
                queue_mem[3]<=queue_mem[2];
                queue_mem[2]<=queue_mem[1];
                queue_mem[1]<=queue_mem[0];
                queue_mem[0]<=data_in;
                if(empty)begin
                    read_idx <= 3'd0;
                    empty <=1'd0;
                end
            end
            read_idx <= (full) ? 3'd7 : (read_idx + 3'd1);
        end
        else begin//pop
            if (read_idx == 3'd0)
                empty <= 1'b1;
            
            read_idx <= (read_idx == 3'd0) ? 3'd0 : (read_idx - 3'd1);
            empty <= (read_idx == 3'd0);
        end
        // read_idx <= read_idx;
    end

assign full = (read_idx == 3'd7);
assign data_out = (empty) ? 4'd0 : queue_mem[read_idx];

endmodule