`timescale 1ns/1ps
module tb_pc;

  reg clk, reset, inc, add, sub;
  reg [15:0] offset;
  wire [15:0] pc;
  
  // Instantiate the Program Counter (pc) module
  pc uut (
    .clk(clk),
    .reset(reset),
    .inc(inc),
    .add(add),
    .sub(sub),
    .offset(offset),
    .pc(pc)
  );

  // Clock generation (50% duty cycle)
  always #5 clk = ~clk;

  // Test sequence
  initial begin
    // Initialize signals
    clk = 0;
    reset = 1;
    inc = 0;
    add = 0;
    sub = 0;
    offset = 16'h0000;

    // Apply reset
    #10 reset = 0;
    
    // CASE 1: inc = 1, add = 0, sub = 0, offset = 0000
    // Expected output: pc = 0001
    #10 inc = 1; add = 0; sub = 0; offset = 16'h0000;
    #10 inc = 0; // Wait one clock cycle to observe the output
    
    // CASE 2: inc = 0, add = 1, sub = 0, offset = 00A5
    // Expected output: pc = 00A6
    #10 inc = 0; add = 1; sub = 0; offset = 16'h00A5;
    #10 add = 0; // Wait one clock cycle to observe the output
    
    // CASE 3: inc = 0, add = 0, sub = 0, offset = 0000
    // Expected output: pc = 00A6 (no change)
    #10 inc = 0; add = 0; sub = 0; offset = 16'h0000;
    #10; // Wait one clock cycle to observe the output
    
    // CASE 4: inc = 1, add = 0, sub = 0, offset = 0000
    // Expected output: pc = 00A7
    #10 inc = 1; add = 0; sub = 0; offset = 16'h0000;
    #10 inc = 0; // Wait one clock cycle to observe the output
    
    // CASE 5: inc = 0, add = 0, sub = 1, offset = 0014
    // Expected output: pc = pc - offset = 00A7 - 0014 = 0093
    #10 inc = 0; add = 0; sub = 1; offset = 16'h0014;
    #10 sub = 0; // Wait one clock cycle to observe the output
    
    // Finish the simulation
    #10 $finish;
  end

  // Monitor changes in the PC value
  initial begin
    $monitor("Time: %0t | inc: %b, add: %b, sub: %b, offset: %h, pc: %h", 
             $time, inc, add, sub, offset, pc);
  end

endmodule
