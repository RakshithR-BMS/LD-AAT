module boolean(y, a, b, c);
    input a, b, c;
    output y;
    not n1(a1, a);
    not n2(b1, b);
    not n3(c1, c);
    and ag1(o1, a1, c1);
    and ag2(o2, a1, c);
    and ag3(o3, a, b1);
    or og1(y, o1, o2, o3);
endmodule

module testbench;
    reg a, b, c;
    wire y;
    boolean bo(y, a, b, c);
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);
        a=0;b=0;c=0;
        #5
        a=0;b=0;c=1;
        #5
        a=0;b=1;c=0;
        #5
        a=0;b=1;c=1;
        #5
        a=1;b=0;c=0;
        #5
        a=1;b=0;c=1;
        #5
        a=1;b=1;c=0;
        #5
        a=1;b=1;c=1;
        #5
        $finish;
    end
endmodule