module fa (input wire i0, i1, cin, output wire sum, cout);
    wire t0, t1, t2;
    
    // Sum logic using XOR gates
    xor (t0, i0, i1);
    xor (sum, t0, cin);
    
    // Carry out logic using AND gates
    and (t1, i0, i1);
    and (t2, t0, cin);
    
    // Final carry out using OR gate
    or (cout, t1, t2);
endmodule

module addsub (input wire addsub, i0, i1, cin, output wire sumdiff, cout);
    wire t;
    
    // XOR to determine if we are adding or subtracting
    xor (t, addsub, i1);
    
    // Use the full adder for add/subtract
    fa fa0 (.i0(i0), .i1(t), .cin(cin), .sum(sumdiff), .cout(cout));
endmodule

module pc_slice (input wire clk, reset, cin, load, inc, sub, input wire offset, output wire cout, pc);
    wire in, inc_;
    
    // Invert the sub signal
    not (inc_, sub);
    
    // Logic to handle incrementing or adding/subtracting
    and (and2_0, inc, ~load);
    addsub addsub_0 (.addsub(sub), .i0(pc), .i1(offset), .cin(cin), .sumdiff(in), .cout(cout));
    
    // Flip-flop for the program counter
    dfrl dfrl_0 (.clk(clk), .reset(reset), .load(load), .d(in), .q(pc));
endmodule

module pc_slice0 (input wire clk, reset, cin, load, inc, sub, input wire offset, output wire cout, pc);
    wire in;
    
    // Logic for the OR gate
    or (or2_0, inc, load);
    
    // Add/Sub module for add/subtract operations
    addsub addsub_0 (.addsub(sub), .i0(pc), .i1(offset), .cin(cin), .sumdiff(in), .cout(cout));
    
    // Flip-flop to store the PC value
    dfrl dfrl_0 (.clk(clk), .reset(reset), .load(load), .d(in), .q(pc));
endmodule

module dfrl(input wire clk, reset, load, input wire d, output reg q);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 1'b0;  // Reset the flip-flop
        end else if (load) begin
            q <= d;     // Load the input data into the flip-flop
        end
    end
endmodule

module pc (input wire clk, reset, inc, add, sub, input wire [15:0] offset, output wire [15:0] pc);
    wire load;
    wire [15:0] c;
    
    // OR gate to determine whether to increment or add
    assign load = inc | add | sub;
    
    // Instantiating the PC slices
    pc_slice0 pc_slice_0 (.clk(clk), .reset(reset), .cin(1'b0), .load(load), .inc(inc), .sub(sub), .offset(offset[0]), .cout(c[0]), .pc(pc[0]));
    
    genvar i;
    generate
        for (i = 1; i < 16; i = i + 1) begin : pc_slices
            pc_slice pc_slice_1 (.clk(clk), .reset(reset), .cin(c[i-1]), .load(load), .inc(inc), .sub(sub), .offset(offset[i]), .cout(c[i]), .pc(pc[i]));
        end
    endgenerate
endmodule
