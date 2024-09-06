module tb_top_module;
reg [2:0] i1;
reg i2;

wire Sum1, Cout1;

top_module uut (
.i1(i1), 
.i2(i2), 
.Sum1(Sum1), 
.Cout1(Cout1)
);

initial begin
i1 = 3'b000;
i2 = 1'b0;
#10;

i1 = 3'b001;
i2 = 1'b1;
#10;

i1 = 3'b010;
i2 = 1'b0;
#10;

i1 = 3'b011;
i2 = 1'b1;
#10;

i1 = 3'b010;
i2 = 1'b0;
#10;

i1 = 3'b011;
i2 = 1'b1;
#10;

$finish;
end

initial begin
$monitor("Time = %0t , i1 = %b , i2 = %b , Sum1 = %b , Cout1 = %b", $time, i1, i2, Sum1, Cout1);
end

initial begin
$dumpfile("ckt1.vcd"); 
$dumpvars(0, tb_top_module); 
end
endmodule
