module TB;
reg i;        
reg sel;      
wire y0;      
wire y1;      

demux uut (.i(i),.sel(sel),.y0(y0),.y1(y1));

initial begin
#0; i = 1'b0; sel = 1'b0;
#5; i = 1'b0; sel = 1'b1;
#5; i = 1'b1; sel = 1'b0;
#5; i = 1'b1; sel = 1'b1;
#5;
end

initial begin
$monitor($time, " i=%b, sel=%b, y0=%b, y1=%b", i, sel, y0, y1);
end

initial begin
$dumpfile("demux_test.vcd");
$dumpvars(0, TB);
end
endmodule
