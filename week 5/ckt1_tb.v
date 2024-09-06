module tb_top_module;
    // Declare inputs as reg
    reg [2:0] i1;
    reg i2;

    // Declare outputs as wire
    wire Sum1, Cout1;

    // Instantiate the top_module (DUT)
    top_module uut (
        .i1(i1), 
        .i2(i2), 
        .Sum1(Sum1), 
        .Cout1(Cout1)
    );

    // Apply test vectors
    initial begin
        // Test case 1: i1 = 3'b000, i2 = 1'b0
        i1 = 3'b000;
        i2 = 1'b0;
        #10;

        // Test case 2: i1 = 3'b001, i2 = 1'b1
        i1 = 3'b001;
        i2 = 1'b1;
        #10;

        // Test case 3: i1 = 3'b010, i2 = 1'b0
        i1 = 3'b010;
        i2 = 1'b0;
        #10;

        // Test case 4: i1 = 3'b011, i2 = 1'b1
        i1 = 3'b011;
        i2 = 1'b1;
        #10;

        // Test case 5: i1 = 3'b010, i2 = 1'b0
        i1 = 3'b010;
        i2 = 1'b0;
        #10;

        // Test case 6: i1 = 3'b011, i2 = 1'b1
        i1 = 3'b011;
        i2 = 1'b1;
        #10;

        // End of test
        $finish;
    end

    // Monitor output values
    initial begin
        $monitor("Time = %0t , i1 = %b , i2 = %b , Sum1 = %b , Cout1 = %b", $time, i1, i2, Sum1, Cout1);
    end

    // Dump waveforms for analysis
    initial begin
        $dumpfile("ckt1.vcd"); // File for waveform
        $dumpvars(0, tb_top_module); // Dump all variables
    end
endmodule
