module dfrl_16 (
    input wire clk,
    input wire reset,
    input wire load,
    input wire [15:0] in,
    output reg [15:0] out
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            out <= 16'b0; // Reset the output to zero
        end else if (load) begin
            out <= in; // Load input to output
        end
    end
endmodule

module reg_file (
    input wire clk,
    input wire reset,
    input wire wr, // Write enable
    input wire [2:0] rd_addr_a, // Read address A
    input wire [2:0] rd_addr_b, // Read address B
    input wire [2:0] wr_addr, // Write address
    input wire [15:0] d_in, // Data input
    output wire [15:0] d_out_a, // Data output A
    output wire [15:0] d_out_b // Data output B
);
    wire [15:0] dout[7:0]; // Internal outputs for 8 registers
    wire [7:0] load; // Load signals for each register

    dfrl_16 dfrl_16_0(clk, reset, load[0], d_in, dout[0]);
    dfrl_16 dfrl_16_1(clk, reset, load[1], d_in, dout[1]);
    dfrl_16 dfrl_16_2(clk, reset, load[2], d_in, dout[2]);
    dfrl_16 dfrl_16_3(clk, reset, load[3], d_in, dout[3]);
    dfrl_16 dfrl_16_4(clk, reset, load[4], d_in, dout[4]);
    dfrl_16 dfrl_16_5(clk, reset, load[5], d_in, dout[5]);
    dfrl_16 dfrl_16_6(clk, reset, load[6], d_in, dout[6]);
    dfrl_16 dfrl_16_7(clk, reset, load[7], d_in, dout[7]);

    assign load = {8{wr}} & (1 << wr_addr);

    assign d_out_a = (rd_addr_a == 3'd0) ? dout[0] :
                     (rd_addr_a == 3'd1) ? dout[1] :
                     (rd_addr_a == 3'd2) ? dout[2] :
                     (rd_addr_a == 3'd3) ? dout[3] :
                     (rd_addr_a == 3'd4) ? dout[4] :
                     (rd_addr_a == 3'd5) ? dout[5] :
                     (rd_addr_a == 3'd6) ? dout[6] :
                     (rd_addr_a == 3'd7) ? dout[7] : 16'b0;

    assign d_out_b = (rd_addr_b == 3'd0) ? dout[0] :
                     (rd_addr_b == 3'd1) ? dout[1] :
                     (rd_addr_b == 3'd2) ? dout[2] :
                     (rd_addr_b == 3'd3) ? dout[3] :
                     (rd_addr_b == 3'd4) ? dout[4] :
                     (rd_addr_b == 3'd5) ? dout[5] :
                     (rd_addr_b == 3'd6) ? dout[6] :
                     (rd_addr_b == 3'd7) ? dout[7] : 16'b0;
endmodule
