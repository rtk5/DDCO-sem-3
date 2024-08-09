module not_test;
reg a;
wire y;
not(y,a);
initial
begin
#0 a=0;
#15 a=1;
end
initial
begin
$monitor($time,"a=%b,y=%b",a,y);
end
initial
begin
$dumpfile("not2_test.vcd");
$dumpvars(0,not_test);
end
endmodule