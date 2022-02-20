module encoder4to2(b0, b1, d0, d1, d2, d3);
 output b0,b1;
 input d0, d1, d2, d3;
 wire t0, t1, t2, t3, t4, t5, t6, t7;
 not n0(t0, d0);
 not n1(t1, d1);
 not n2(t2, d2);
 not n3(t3, d3);
 and a0(t4, t0, t1, d2, t3);
 and a1(t5, t0, t1, t2, d3);
 and a2(t6, t0, d1, t2, t3);
 and a3(t7, t0, t1, t2, d3);
 or o0(b0, t4, t5);
 or o1(b1, t6, t7);
endmodule


module test;
 wire b0, b1;
 reg d0, d1, d2, d3;
 encoder4to2 encg(b0, b1, d0, d1, d2, d3);
 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars(0, test);
 d0 = 1; d1 = 0; d2 = 0; d3 = 0;
 #40
 d0 = 0; d1 = 1; d2 = 0; d3 = 0;
 #40
 d0 = 0; d1 = 0; d2 = 1; d3 = 0;
 #40
 d0 = 0; d1 = 0; d2 = 0; d3 = 1;
 #40
 $finish;
 end
endmodule