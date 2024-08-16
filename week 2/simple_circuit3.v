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
assign y = ~a;
endmodule

module simple_circuit1 (A2, B2, C2, Z);
output Z;  
input A2, B2, C2;  
wire w1, w2, w3;

andgate G1 (w1, C2, B2); 
andgate G2 (w2, B2, A2); 
orgate G3 (w3, w1, A2);
orgate G4 (Z, w3, w2); 

endmodule
