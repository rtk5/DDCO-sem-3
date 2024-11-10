`timescale 1ns / 1ps

module tb_up_down_counter;
reg clk;
reg up_down;

wire [2:0] Q;

up_down_counter uut (.Q(Q),.clk(clk),.up_down(up_down));

initial begin
    clk = 0;
    forever #5 clk = ~clk;  
end

initial begin
    up_down = 1; 
    forever begin
        @(posedge clk);  
        $display("At time %t: clk = %b, up_down = %b, Q = %b", $time, clk, up_down, Q);
    end
end

initial begin
    #80; 
    up_down = 0;

    #80;
    $finish;
end

initial begin
    $dumpfile("up_down_counter.vcd"); 
    $dumpvars(0, tb_up_down_counter); 
end
endmodule
