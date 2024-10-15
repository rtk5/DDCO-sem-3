module ALU (
    input [3:0] A,
    input [3:0] B,
    input [1:0] ALU_Sel,
    output reg [3:0] Result,
    output reg Zero
);
    always @(*) begin
        case (ALU_Sel)
            2'b00: Result = A + B; // Addition
            2'b01: Result = A - B; // Subtraction
            2'b10: Result = A & B; // AND
            2'b11: Result = A | B; // OR
            default: Result = 4'b0000;
        endcase
        Zero = (Result == 4'b0000) ? 1'b1 : 1'b0;
    end
endmodule

module RegisterFile (
    input clk,
    input [1:0] read_addr,
    input [1:0] write_addr,
    input [3:0] write_data,
    input write_enable,
    output reg [3:0] read_data
);
    reg [3:0] registers [3:0];

    always @(posedge clk) begin
        if (write_enable) begin
            registers[write_addr] <= write_data;
        end
    end

    always @(*) begin
        read_data = registers[read_addr];
    end
endmodule

module ALU_Register_File (
    input clk,
    input [1:0] read_addr,
    input [1:0] write_addr,
    input [3:0] immediate,
    input [1:0] ALU_Sel,
    input write_enable,
    output [3:0] alu_result,
    output zero_flag
);
    wire [3:0] reg_out_a, reg_out_b;

    RegisterFile reg_file (
        .clk(clk),
        .read_addr(read_addr),
        .write_addr(write_addr),
        .write_data(immediate),
        .write_enable(write_enable),
        .read_data(reg_out_a)
    );

    RegisterFile reg_file_b (
        .clk(clk),
        .read_addr(read_addr + 1'b1),
        .write_addr(write_addr),
        .write_data(immediate),
        .write_enable(write_enable),
        .read_data(reg_out_b)
    );

    ALU alu (
        .A(reg_out_a),
        .B(reg_out_b),
        .ALU_Sel(ALU_Sel),
        .Result(alu_result),
        .Zero(zero_flag)
    );
endmodule
