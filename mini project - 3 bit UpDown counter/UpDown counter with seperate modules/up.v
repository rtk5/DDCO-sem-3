module up_counter(Q, clk, enable);
    input clk, enable;
    output reg [2:0] Q;

    initial begin
        Q = 3'b000;  
    end

    always @(posedge clk) begin
        if (enable) begin
            Q <= Q + 1;  
        end
    end
endmodule
