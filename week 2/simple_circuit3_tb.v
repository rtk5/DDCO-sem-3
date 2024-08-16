module tb_simple_circuit;
    wire Z;  
    reg A2, B2, C2;

    simple_circuit1 M1 (.A2(A2), .B2(B2), .C2(C2), .Z(Z));

    initial begin
        A2 = 1'b0; B2 = 1'b0; C2 = 1'b0;
        #20 A2 = 1'b0; B2 = 1'b0; C2 = 1'b1;  
        #20 A2 = 1'b0; B2 = 1'b1; C2 = 1'b0;
        #20 A2 = 1'b0; B2 = 1'b1; C2 = 1'b1;  
        #20 A2 = 1'b1; B2 = 1'b0; C2 = 1'b0;  
        #20 A2 = 1'b1; B2 = 1'b0; C2 = 1'b1;  
        #20 A2 = 1'b1; B2 = 1'b1; C2 = 1'b0;  
        #20 A2 = 1'b1; B2 = 1'b1; C2 = 1'b1;  
        #20;
    end  

    initial begin
        $monitor($time, " A2=%b, B2=%b, C2=%b, Z=%b", A2, B2, C2, Z);
    end

    initial begin
        $dumpfile("simple3.vcd");
        $dumpvars(1, tb_simple_circuit);  
        #200;
        $finish;
    end
endmodule
