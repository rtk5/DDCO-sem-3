module TB;

reg A, B;               
wire Y0, Y1, Y2, Y3;    

decoder2to4 uut (.A(A),.B(B),.Y0(Y0),.Y1(Y1),.Y2(Y2),.Y3(Y3));

initial begin
#0; A = 1'b0; B = 1'b0;
#5; A = 1'b0; B = 1'b1;
#5; A = 1'b1; B = 1'b0;
#5; A = 1'b1; B = 1'b1;
end

initial begin
$monitor($time, " A=%b, B=%b, Y0=%b, Y1=%b, Y2=%b, Y3=%b", A, B, Y0, Y1, Y2, Y3);
end

initial begin
$dumpfile("decoder2to4_test.vcd");
$dumpvars(0, TB);
end

endmodule
