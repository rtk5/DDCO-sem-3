module decoder2to4 (
    input wire A, B,          
    output wire Y0, Y1, Y2, Y3 
);
    assign Y0 = ~A & ~B;   // Y0 is active when A = 0, B = 0
    assign Y1 = ~A & B;    // Y1 is active when A = 0, B = 1
    assign Y2 = A & ~B;    // Y2 is active when A = 1, B = 0
    assign Y3 = A & B;     // Y3 is active when A = 1, B = 1
endmodule
