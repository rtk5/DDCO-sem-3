module halfadder;
wire sum,carry;
reg A,B;

halfadder M1(.A(A), .B(B), .C(C), .sum(sum), .carry(carry));

initial
begin
#0 A = 1'b0; B = 1'b0; 
#20 A = 1'b0; B = 1'b1;
#20 A = 1'b1; B = 1'b0; 
#20 A = 1'b1; B = 1'b1; 
end 

initial begin 
$monitor($time, "a=%b, b=%b,sum=%b,carry=%b", A, B, sum, carry);
end

initial begin 
$dumpfile("halfadder.vcd"); 
$dumpvars(0, halfadder_tb); 
end 
endmodule