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

xorgate X1(.y(sum), .a(A), .b(B));  // sum = A ^ B
andgate A1(.y(carry), .a(A), .b(B)); // carry = A & B

endmodule
