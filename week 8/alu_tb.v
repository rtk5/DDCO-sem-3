module ALU_tb;
    reg [3:0] A, B;
    reg [1:0] ALU_op;
    wire [3:0] Result;
    wire Zero;

    // Instantiate the ALU
    ALU alu_inst (
        .A(A),
        .B(B),
        .ALU_op(ALU_op),
        .Result(Result),
        .Zero(Zero)
    );

    initial begin
        // Initialize VCD file
        $dumpfile("alu_test.vcd");
        $dumpvars(0, ALU_tb);
        
        // Monitor signals
        $monitor("A=%b, B=%b, ALU_op=%b, Result=%b, Zero=%b", A, B, ALU_op, Result, Zero);
        
        // Test cases
        A = 4'b0011; B = 4'b0001; ALU_op = 2'b00; #10; // 3 + 1
        A = 4'b0100; B = 4'b0001; ALU_op = 2'b01; #10; // 4 - 1
        A = 4'b0101; B = 4'b0011; ALU_op = 2'b10; #10; // 5 & 3
        A = 4'b0110; B = 4'b0011; ALU_op = 2'b11; #10; // 6 | 3
        
        $finish;
    end
endmodule
