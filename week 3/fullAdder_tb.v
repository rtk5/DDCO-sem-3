module fulladder_tb;
reg A, B, C;
wire sum, carry;

fulladder M1(.sum(sum), .carry(carry), .A(A), .B(B), .C(C));

initial begin
#0 A = 1'b0; B = 1'b0; C = 1'b0;
#20 A = 1'b0; B = 1'b1; C = 1'b0;
#20 A = 1'b1; B = 1'b0; C = 1'b0;
#20 A = 1'b1; B = 1'b1; C = 1'b0;
#20 A = 1'b0; B = 1'b0; C = 1'b1;
#20 A = 1'b0; B = 1'b1; C = 1'b1;
#20 A = 1'b1; B = 1'b0; C = 1'b1;
#20 A = 1'b1; B = 1'b1; C = 1'b1;
end

initial begin
    $monitor($time, " A=%b, B=%b, C=%b, sum=%b, carry=%b", A, B, C, sum, carry);
end

initial begin
    $dumpfile("fulladder.vcd");
    $dumpvars(0, fulladder_tb);
end

endmodule
