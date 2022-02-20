module nandnor(y, a, b);
    input a,b;
    output [1:0]y;
    and ag(x1, a, b);
    not n1(y[1],x1);
    or og(x2, a, b);
    not n2(y[0], x2);
endmodule

module testbench;
            wire [1:0]y;
            reg a , b;
            nandnor g(y, a, b);
            initial 
            begin
                        $dumpfile("dump.vcd");
                         $dumpvars( 0 , testbench );
                         a = 1'b0 ; b = 1'b0  ;
                         #20
                        a = 1'b0 ; b = 1'b1  ;
                         #20
                        a = 1'b1 ; b = 1'b0  ;
                         #20
                        a = 1'b1 ; b = 1'b1  ;
                         #20
                          $finish;
end
endmodule
