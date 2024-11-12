// 3-bit Up-Down Counter
module up_down_counter(Q, clk, up_down);
    input clk, up_down;
    output reg [2:0] Q;

    initial begin
        Q = 3'b000;  // Initialize counter to zero
    end

    always @(posedge clk) begin
        if (up_down) begin
            Q <= Q + 1;  // Count up
        end else begin
            Q <= Q - 1;  // Count down
        end
    end
endmodule