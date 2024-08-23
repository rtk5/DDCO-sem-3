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

module ripplecarryadder(input wire [3:0] a, b, input wire cin, output wire [3:0] sum, output wire cout);
wire [2:0] c;
fulladder u0 (.sum(sum[0]), .carry(c[0]), .A(a[0]), .B(b[0]), .C(cin));  // First 
fulladder u1 (.sum(sum[1]), .carry(c[1]), .A(a[1]), .B(b[1]), .C(c[0])); // Second 
fulladder u2 (.sum(sum[2]), .carry(c[2]), .A(a[2]), .B(b[2]), .C(c[1])); // Third 
fulladder u3 (.sum(sum[3]), .carry(cout), .A(a[3]), .B(b[3]), .C(c[2])); // Fourth 
endmodule

