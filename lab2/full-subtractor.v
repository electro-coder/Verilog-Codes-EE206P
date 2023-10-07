//implementation using half subtractor
module L2_Q2_half(input a,b, output y1,y2);  //half subtractor
xor(y1,a,b);
and(y2,~a,b);
endmodule

//full subtractor
module L2_Q2(input a,b,c, output y1,y2);
wire y3,y4,y5;
L2_Q2_half x(a,b,y3,y4);
L2_Q2_half n(c,y3,y1,y5);
or(y2,y4,y5);
endmodule


//testbench
module L2_Q2_bench();
reg a1,b1,c1; 
wire ya,yb; 
L2_Q2 dut1 (.a(a1),.b(b1),.c(c1),.y1(ya),.y2(yb));
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
