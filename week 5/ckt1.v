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


module top_module (input [2:0] i1, input i2,output Sum1,output Cout1 );
wire Sum0, Cout0;
fulladder FA0(.sum(Sum0),.carry(Cout0),.A(i1[1]),.B(i1[0]),.C(i1[2]));
fulladder FA1(.sum(Sum1),.carry(Cout1),.A(i2),.B(Sum0),.C(Cout0));
endmodule
