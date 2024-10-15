module ALU (
    input [3:0] A,        // 4-bit input A
    input [3:0] B,        // 4-bit input B
    input [1:0] ALU_op,   // ALU operation selector
    output reg [3:0] Result, // 4-bit Result
    output reg Zero        // Zero flag
);

    always @(*) begin
        case (ALU_op)
            2'b00: Result = A + B;         // Addition
            2'b01: Result = A - B;         // Subtraction
            2'b10: Result = A & B;         // AND
            2'b11: Result = A | B;         // OR
            default: Result = 4'b0000;     // Default case
        endcase
        
        Zero = (Result == 4'b0000);         // Set Zero flag if Result is zero
    end
endmodule

