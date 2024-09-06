module TB;
reg [2:0] i;
reg y;
wire So, Cout;

top_module uut (.i(i),.y(y),.So(So),.Cout(Cout));

initial begin
i = 3'b000; y = 1'b0;#5;
i = 3'b000; y = 1'b1;#5;
i = 3'b001; y = 1'b0;#5;
i = 3'b001; y = 1'b1;#5;
i = 3'b010; y = 1'b0;#5;
i = 3'b010; y = 1'b1;#5;
i = 3'b011; y = 1'b0;#5;
i = 3'b011; y = 1'b1;#5;
i = 3'b100; y = 1'b0;#5;
i = 3'b100; y = 1'b1;#5;
i = 3'b101; y = 1'b0;#5;
i = 3'b101; y = 1'b1;#5;
i = 3'b110; y = 1'b0;#5;
i = 3'b110; y = 1'b1;#5;
i = 3'b111; y = 1'b0;#5;
i = 3'b111; y = 1'b1;#5;
end

initial begin
$monitor($time, " i=%b, y=%b, So=%b, Cout=%b", i, y, So, Cout);
end

initial begin
$dumpfile("top_module_test.vcd");
$dumpvars(0, TB);
end

endmodule
