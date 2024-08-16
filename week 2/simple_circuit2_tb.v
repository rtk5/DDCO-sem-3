module tb_simple_circuit;
wire D;  
reg A, B, C;

simple_circuit1 M1 (.A(A), .B(B), .C(C), .D(D));

initial begin
A = 1'b0; B = 1'b0; C = 1'b0;
#20 A = 1'b0; B = 1'b0; C = 1'b1;  
#20 A = 1'b0; B = 1'b1; C = 1'b0;
#20 A = 1'b0; B = 1'b1; C = 1'b1;  
#20 A = 1'b1; B = 1'b0; C = 1'b0;  
#20 A = 1'b1; B = 1'b0; C = 1'b1;  
#20 A = 1'b1; B = 1'b1; C = 1'b0;  
#20 A = 1'b1; B = 1'b1; C = 1'b1;  
#20;
end  

initial begin
$monitor($time, " A=%b, B=%b, C=%b, D=%b", A, B, C, D);
end

initial begin
$dumpfile("simple2.vcd");
$dumpvars(1, tb_simple_circuit);  
#200;
$finish;
end
endmodule
