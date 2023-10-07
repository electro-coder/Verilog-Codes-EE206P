module L1_Q4a(input a,b,c,d,s1,s0, output y);
wire y1,y2,y3,y4,y5,y6,y7;
not(y1,s1);
not(y2,s0);
and(y3,y1,y2,a);
and(y4,y1,s0,b);
and(y5,s1,y2,c);
and(y6,s1,s0,d);
or(y7,y3,y4,y5,y6);
endmodule

module L1_Q4b(input a,b,c,d,s1,s0, output y);
assign y=(~s1)*(~s0)*a + (~s1)*s0*b + s1*(~s0)*c + s1*s0*d;
endmodule

module L1_Q4c(input a,b,c,d,s1,s0, output reg y);
always @(s1 or s0)
begin
if(s1==0 && s0==0) assign y=a;
else if(s1==0 && s0==1) assign y=b;
else if(s1==1 && s0==0) assign y=c;
else assign y=d;
end
endmodule


//testbench
module L1_Q4_bench();
reg a1,b1,c1,d1,s11,s01; 
wire y1; 
L1_Q4b dut1 (.a(a1),.b(b1),.c(c1),.d(d1),.s1(s11),.s0(s01),.y(y1));
initial  
begin
	      a1=1'b0;b1=1'b0;c1=1'b0;d1=1'b0;s11=1'b0;s01=1'b0;
#100    a1=1'b0;b1=1'b0;c1=1'b0;d1=1'b1;s11=1'b0;s01=1'b1;
#100    a1=1'b0;b1=1'b0;c1=1'b1;d1=1'b0;s11=1'b1;s01=1'b0; 
#100    a1=1'b0;b1=1'b0;c1=1'b1;d1=1'b1;s11=1'b1;s01=1'b1;   
end
endmodule
