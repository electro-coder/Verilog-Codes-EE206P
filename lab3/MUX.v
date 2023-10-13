//create a 4:1 mux using 2:1 mux
module twoMux(input a,b,s, output y);
assign y=s*a + (~s)*b;
endmodule

module fourMux(input a,b,c,d,s1,s2, output y);
wire y1,y2;
twoMux uut1(a,b,s1,y1);
twoMux uut2(c,d,s1,y2);
twoMux uut3(y1,y2,s2,y);
endmodule


//testbench
module L1q1 ();
reg a1,b1,c1,d1,s11,s01;
wire y;
fourMux dut1 (.a(a1), .b(b1), .c(c1), .d(d1), .s1(s11), .s2(s01), .y(y) );
initial 
begin
     a1=1'b0; b1= 1'b0; c1= 1'b0; d1 =1'b0; s11=1'b0; s01 =1'b0;
#100 a1=1'b0; b1= 1'b1; c1= 1'b0; d1 =1'b0; s11=1'b1; s01 =1'b0;
#100 a1=1'b0; b1= 1'b0; c1= 1'b1; d1 =1'b0; s11=1'b0; s01 =1'b1;
#100 a1=1'b1; b1= 1'b0; c1= 1'b0; d1 =1'b0; s11=1'b1; s01 =1'b1;
end
endmodule
