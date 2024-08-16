module andgate (y, a, b);  
input a, b;
output y;
assign y = a & b;
endmodule

module orgate (y, a, b);  
input a, b;
output y;
assign y = a | b;
endmodule

module notgate (y, a);  
input a;
output y;
assign y = !a;
endmodule

module simple_circuit1 (A, B, C, D, E);
output D, E;  
input A, B, C;  
wire w1;
andgate G1 (w1, A, B); 
notgate G2 (E, C);    
orgate G3 (D, w1, E); 
endmodule
