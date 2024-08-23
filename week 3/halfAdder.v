module andgate (y,a, b,);  
input a, b;
output y;
assign y = a & b;
endmodule

module orgate (y,a, b,);  
input a, b;
output y;
assign y = a | b;
endmodule

module xorgate(y,a,b,);
input a, b;
output y;
assign y = a ^ b;
endmodule