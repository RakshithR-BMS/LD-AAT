module m81(out, D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2); 
    output out; 
    input D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2; 
    wire s0bar, s1bar, T1, T2, T3, T4, T5, T6, T7, T8;

    not u1(s1bar, S1);
    not u2(s0bar, S0);
    not u3(s2bar, S2);

    and u4(T1, D0, s0bar, s1bar, s2bar);
    and u5(T2, D1, S0, s1bar, s2bar);
    and u6(T3, D2, s0bar, S1, s2bar);
    and u7(T4, D3, S0, S1, s2bar);
    and u8(T5, D4, s0bar, s1bar, S2);
    and u9(T6, D5, S0, s1bar, S2);
    and u10(T7, D6, s0bar, S1, S2);
    and u11(T8, D7, S0, S1, S2);
    or u12(out, T1, T2, T3, T4, T5, T6, T7, T8);
endmodule


`timescale 1ns/1ps
    module top; 
    wire out;
    reg D0, D1, D2, D3, D4, D5, D6, D7, D8, S0, S1, S2;
    m81 name(.D0(D0), .D1(D1), .D2(D2), .D3(D3), .D4(D4), .D5(D5), .D6(D6), .D7(D7), .S0(S0), .S1(S1), .S2(S2), .out(out)); 
    initial 
    begin
    $dumpfile("dump.vcd");
                $dumpvars(0 , top);
    D0=1'b0; D1=1'b0; D2=1'b0; D3=1'b0; D4=1'b0; D5=1'b0; D6=1'b0; D7=1'b0;S0=1'b0; S1=1'b0; S2=1'b0; 
    #500 $finish; 
    end 
    always #1 D0=~D0;
    always #2 D1=~D1;
    always #3 D2=~D2;
    always #4 D3=~D3;
    always #5 D4=~D4;
    always #6 D5=~D5;
    always #7 D6=~D6;
    always #8 D7=~D7;
    always #9 S0=~S0;
    always #10 S1=~S1;
    always #11 S2=~S2;
    //always@(D0 or D1 or D2 or D3 or D4 or D5 or D6 or D7 or S0 or S1 or S2) 
    //$monitor("At time = %t, Output = %d", $time, out); 
endmodule;
