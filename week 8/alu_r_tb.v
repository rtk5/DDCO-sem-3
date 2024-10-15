module tb_ALU_Register_File;
    reg clk;
    reg [1:0] read_addr;
    reg [1:0] write_addr;
    reg [3:0] immediate;
    reg [1:0] ALU_Sel;
    reg write_enable;
    wire [3:0] alu_result;
    wire zero_flag;

    ALU_Register_File uut (
        .clk(clk),
        .read_addr(read_addr),
        .write_addr(write_addr),
        .immediate(immediate),
        .ALU_Sel(ALU_Sel),
        .write_enable(write_enable),
        .alu_result(alu_result),
        .zero_flag(zero_flag)
    );

    initial begin
        // Initialize signals
        clk = 0;
        write_enable = 0;
        immediate = 0;
        ALU_Sel = 0;
        read_addr = 0;
        write_addr = 0;

        // Test sequence
        #10;
        write_enable = 1; immediate = 4'b0010; write_addr = 2'b00; // Write 2 to R0
        #10;
        write_enable = 1; immediate = 4'b0011; write_addr = 2'b01; // Write 3 to R1
        #10;
        write_enable = 0; ALU_Sel = 2'b00; read_addr = 2'b00; // ALU operation (2 + 3)
        #10;
        write_enable = 1; immediate = 4'b0001; write_addr = 2'b10; // Write 1 to R2
        #10;
        write_enable = 0; ALU_Sel = 2'b01; read_addr = 2'b10; // ALU operation (R2 - R1)
        #10;

        // Finish simulation
        $finish;
    end

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $monitor("Time: %0d, ALU Result: %b, Zero Flag: %b", $time, alu_result, zero_flag);
        $dumpfile("alu_register_file.vcd");
        $dumpvars(0, tb_ALU_Register_File);
    end
endmodule
