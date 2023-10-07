//full adder implementation using set of half adders and or gate
module L1_Q6(input a,b,c, output y1,y2);
wire y3,y4;
L1_Q5a uut1(a,b,y3,y4);
L1_Q5a uut2(y3,c,y1,y5);
or(y2,y4,y5);
endmodule


//testbench
module L1_Q6_bench();
reg a1,b1,c1; 
wire ya,yb; 
L1_Q6 dut1 (.a(a1),.b(b1),.c(c1),.y1(ya),.y2(yb));
initial  
begin
	      a1=1'b0;b1=1'b0;c1=1'b0;  
#100    a1=1'b0;b1=1'b0;c1=1'b1;  
#100    a1=1'b0;b1=1'b1;c1=1'b0; 
#100    a1=1'b0;b1=1'b1;c1=1'b1;
#100    a1=1'b1;b1=1'b0;c1=1'b0;
#100    a1=1'b1;b1=1'b0;c1=1'b1;
#100    a1=1'b1;b1=1'b1;c1=1'b0;
#100    a1=1'b1;b1=1'b1;c1=1'b1;   
end
endmodule
