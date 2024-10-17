`timescale 1ns / 1ps

module tb_reg_file; // Testbench module

    // Inputs
    reg clk;
    reg reset;
    reg wr; // Write enable
    reg [2:0] rd_addr_a; // Read address A
    reg [2:0] rd_addr_b; // Read address B
    reg [2:0] wr_addr; // Write address
    reg [15:0] d_in; // Data input

    // Outputs
    wire [15:0] d_out_a; // Data output A
    wire [15:0] d_out_b; // Data output B

    // Instantiate the reg_file
    reg_file uut (
        .clk(clk),
        .reset(reset),
        .wr(wr),
        .rd_addr_a(rd_addr_a),
        .rd_addr_b(rd_addr_b),
        .wr_addr(wr_addr),
        .d_in(d_in),
        .d_out_a(d_out_a),
        .d_out_b(d_out_b)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test procedure
    initial begin
        // Initialize inputs
        reset = 1;
        wr = 0;
        rd_addr_a = 3'd0;
        rd_addr_b = 3'd0;
        wr_addr = 3'd0;
        d_in = 16'b0;

        // Wait for some time and release reset
        #10;
        reset = 0;

        // Write data to register 0
        wr = 1;
        wr_addr = 3'd0;
        d_in = 16'hABCD; // Sample data
        #10; // Wait for one clock cycle
        wr = 0;

        // Read from register 0
        rd_addr_a = 3'd0; // Select register 0
        rd_addr_b = 3'd1; // Select register 1 (should be 0)
        #10;

        // Write data to register 1
        wr = 1;
        wr_addr = 3'd1;
        d_in = 16'h1234; // Sample data
        #10; // Wait for one clock cycle
        wr = 0;

        // Read from both registers
        rd_addr_a = 3'd0; // Select register 0
        rd_addr_b = 3'd1; // Select register 1
        #10;

        // Write data to register 2
        wr = 1;
        wr_addr = 3'd2;
        d_in = 16'h5678; // Sample data
        #10; // Wait for one clock cycle
        wr = 0;

        // Read from all three registers
        rd_addr_a = 3'd2; // Select register 2
        rd_addr_b = 3'd0; // Select register 0
        #10;

        // Check if reset works
        reset = 1; // Assert reset
        #10;
        reset = 0; // Release reset

        // Read from register 0 (should be 0 after reset)
        rd_addr_a = 3'd0;
        rd_addr_b = 3'd1; // Select register 1
        #10;

        // Finish the simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0dns | rd_addr_a: %0d, d_out_a: %h | rd_addr_b: %0d, d_out_b: %h",
                 $time, rd_addr_a, d_out_a, rd_addr_b, d_out_b);
    end

    // VCD file generation
    initial begin
        $dumpfile("reg_file_tb.vcd"); // Specify VCD file name
        $dumpvars(0, tb_reg_file); // Dump all variables in the testbench
    end

endmodule
