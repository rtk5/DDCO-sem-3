module ALU (
    input [7:0] A,           
    input [7:0] B,           
    input [1:0] opcode,      
    output reg [7:0] result  
);
    always @(*) begin
        case (opcode)
            2'b00: result = A & B;  
            2'b01: result = A | B;  
            2'b10: result = ~(A & B); 
            2'b11: result = ~(A | B); 
            default: result = 8'b00000000; 
        endcase
    end
endmodule

module RegisterFile (
    input clk,                
    input [2:0] write_addr,   
    input [7:0] write_data,   
    input write_enable,       
    input [2:0] read_addr,    
    output reg [7:0] read_data
);
    reg [7:0] registers [0:7];

    always @(posedge clk) begin
        if (write_enable) begin
            registers[write_addr] <= write_data; 
        end
    end

    always @(*) begin
        read_data = registers[read_addr]; 
    end
endmodule

module Processor (
    input clk,                
    input [7:0] A,            
    input [7:0] B,            
    input [1:0] opcode,       
    input [2:0] write_addr,   
    input write_enable,       
    input [2:0] read_addr,    
    output [7:0] read_data    
);
    wire [7:0] alu_result;    

    ALU alu (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(alu_result)
    );

    RegisterFile reg_file (
        .clk(clk),
        .write_addr(write_addr),
        .write_data(alu_result),
        .write_enable(write_enable),
        .read_addr(read_addr),
        .read_data(read_data)
    );
endmodule
