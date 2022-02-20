module s_andornot(a,b,y);
    input a,b;
    output [2:0]y;
    and ag(y[2],a,b);
    or og(y[1],a,b);
    not ng(y[0],a);
endmodule


module tb_andornot;
    reg a,b;
    wire [2:0]y;
    s_andornot ob(a,b,y);
    initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars(0,tb_andornot);
        a=1'b0;b=1'b0;
        #20
        a=1'b0;b=1'b1;
        #20
        a=1'b1;b=1'b0;
        #20
        a=1'b1;b=1'b1;
        #20
        $finish;

    end
endmodule
