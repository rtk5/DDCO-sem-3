`timescale 1ns / 1ps

module tb_up_down_counter;

reg clk;
reg enable_up, enable_down;

wire [2:0] Q_up;
wire [2:0] Q_down;

up_counter uut_up (
    .Q(Q_up),
    .clk(clk),
    .enable(enable_up)
);

down_counter uut_down (
    .Q(Q_down),
    .clk(clk),
    .enable(enable_down)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;  
end

initial begin
    enable_up = 1;
    enable_down = 0;  
    #80;  
    
    enable_up = 0;
    enable_down = 1;
    $display("Switching to Down Counter phase: ");
    
    #80;
    
    $finish;
end

initial begin
    forever begin
        @(posedge clk);  
        if (enable_up) begin
            $display("Up Counter phase: At time %t: clk = %b, Q_up = %b", $time, clk, Q_up);
        end else if (enable_down) begin
            $display("Down Counter phase: At time %t: clk = %b, Q_down = %b", $time, clk, Q_down);
        end
    end
end

initial begin
    $dumpfile("up_down_counter.vcd"); 
    $dumpvars(0, tb_up_down_counter); 
end

endmodule
