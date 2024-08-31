module encoder4 (
input wire y3, y2, y1, y0,   
output wire A1, A0           
);

assign {A1, A0} = (y3 ? 2'b11 : 
y2 ? 2'b10 : 
y1 ? 2'b01 : 
y0 ? 2'b00 : 2'b00);
endmodule
