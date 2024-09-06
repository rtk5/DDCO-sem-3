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

module xorgate (y, a, b);
input a, b;
output y;
assign y = a ^ b;
endmodule

module notgate(y, a);
input a;
output y;
assign y = ~a;
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

module top_module(input [2:0] i, input y, output So, output Cout);
wire Sum0, Co0, Not_y, And_out1, And_out2;
fulladder FA0 (.sum(Sum0), .carry(Co0), .A(i[0]), .B(i[1]), .C(i[2]));
notgate NG1 (.y(Not_y), .a(y));  
andgate AND1 (.y(And_out1), .a(Sum0), .b(Not_y)); 
andgate AND2 (.y(And_out2), .a(And_out1), .b(Co0)); 
halfadder HA0 (.sum(So), .carry(Cout), .A(And_out2), .B(Co0));
endmodule
