module Testbench;reg clk;reg [7:0] A;reg [7:0] B;reg [1:0] opcode;reg [2:0] write_addr;reg write_enable;reg [2:0] read_addr;wire [7:0] read_data;

    Processor uut (.clk(clk),.A(A),.B(B),.opcode(opcode),.write_addr(write_addr),.write_enable(write_enable),.read_addr(read_addr),.read_data(read_data)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        $dumpfile("processor_tb.vcd"); 
        $dumpvars(0, Testbench); 
    end

    initial begin
        A = 8'b11001100; B = 8'b10101010; opcode = 2'b00; 
        write_addr = 3'b000; write_enable = 1; read_addr = 3'b000;
        #10; 
        write_enable = 0; 
        #10; 
        $display("Inputs: A = %b, B = %b, Opcode = %b", A, B, opcode); 
        $display("AND Result: %b", read_data); 

        A = 8'b11001100; B = 8'b10101010; opcode = 2'b01; 
        write_addr = 3'b001; write_enable = 1; read_addr = 3'b001;
        #10; 
        write_enable = 0; 
        #10; 
        $display("Inputs: A = %b, B = %b, Opcode = %b", A, B, opcode); 
        $display("OR Result: %b", read_data); 

        A = 8'b11001100; B = 8'b10101010; opcode = 2'b10; 
        write_addr = 3'b010; write_enable = 1; read_addr = 3'b010;
        #10; 
        write_enable = 0; 
        #10; 
        $display("Inputs: A = %b, B = %b, Opcode = %b", A, B, opcode); 
        $display("NAND Result: %b", read_data); 

        A = 8'b11001100; B = 8'b10101010; opcode = 2'b11; 
        write_addr = 3'b011; write_enable = 1; read_addr = 3'b011;
        #10; 
        write_enable = 0; 
        #10; 
        $display("Inputs: A = %b, B = %b, Opcode = %b", A, B, opcode); 
        $display("NOR Result: %b", read_data); 

        #10; 
        $finish; 
    end
endmodule
