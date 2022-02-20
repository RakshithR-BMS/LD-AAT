module NAND_NOR_EXOR (output nand1,nor1,exor1, input A, B);
    assign nand1 = ~(A & B);
    assign nor1 = ~(A+B);
    assign exor1 = A ^ B;
endmodule

module NAND_NOR_EXOR_tb;
    reg A, B;
    wire nand1,nor1,exor1;
    NAND_NOR_EXOR Indtance (nand1,nor1,exor1, A, B);
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars();
            A = 1'b0; B = 1'b0;
        #1 A = 1'b0; B = 1'b1;
        #1 A = 1'b1; B = 1'b0;
        #1 A = 1'b1; B = 1'b1;
        #1 $finish;
    end
endmodule