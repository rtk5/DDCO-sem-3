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

module xorgate(y, a, b);
input a, b;
output y;
assign y = a ^ b;
endmodule

module halfadder(sum, carry, A, B);
input A, B;
output sum, carry;
xorgate X1(.y(sum), .a(A), .b(B));   // sum = A ^ B
andgate A1(.y(carry), .a(A), .b(B)); // carry = A & B
endmodule

module fulladder(sum, carry, A, B, C);
input A, B, C;
output sum, carry;
wire W1, W2, C1;
halfadder HA1(.sum(W1), .carry(W2), .A(A), .B(B)); // First half-adder
halfadder HA2(.sum(sum), .carry(C1), .A(W1), .B(C)); // Second half-adder
orgate OG(.y(carry), .a(W2), .b(C1));  // OR gate 
endmodule
