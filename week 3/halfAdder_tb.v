module halfadder_tb;
reg A, B;
wire sum, carry;

halfadder M1(.sum(sum), .carry(carry), .A(A), .B(B));

initial begin
    A = 1'b0; B = 1'b0;
    #20 A = 1'b0; B = 1'b1;
    #20 A = 1'b1; B = 1'b0;
    #20 A = 1'b1; B = 1'b1;
end

initial begin
    $monitor($time, " A=%b, B=%b, sum=%b, carry=%b", A, B, sum, carry);
end

initial begin
    $dumpfile("halfadder.vcd");
    $dumpvars(0, halfadder_tb);
end

endmodule
