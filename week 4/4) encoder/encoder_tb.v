module TB;

reg y3, y2, y1, y0;    
wire A1, A0;           

encoder4 uut (.y3(y3),.y2(y2),.y1(y1),.y0(y0),.A1(A1),.A0(A0));

initial begin
#0; y3 = 1'b0; y2 = 1'b0; y1 = 1'b0; y0 = 1'b1;
#5; y3 = 1'b0; y2 = 1'b0; y1 = 1'b1; y0 = 1'b0;
#5; y3 = 1'b0; y2 = 1'b1; y1 = 1'b0; y0 = 1'b0;
#5; y3 = 1'b1; y2 = 1'b0; y1 = 1'b0; y0 = 1'b0;
end

initial begin
$monitor($time, " y3=%b, y2=%b, y1=%b, y0=%b, A1=%b, A0=%b", y3, y2, y1, y0, A1, A0);
end

initial begin
$dumpfile("encoder4_test.vcd");
$dumpvars(0, TB);
end

endmodule
