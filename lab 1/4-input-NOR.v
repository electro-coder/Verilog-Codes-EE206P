//4 input NOR gate using 2 input NOR gates
module L1_Q2(input a,b,c,d, output y);
wire w1,w2,w3,w4;
nor(w1,a,b);
nor(w2,c,d);
nor(w3,w1,w1);
nor(w4,w2,w2);
nor(y,w3,w4);
endmodule


//testbench
module L1_Q2_bench();
reg a1,b1,c1,d1; 
wire y1; 
L1_Q2 dut (.a(a1),.b(b1),.c(c1),.d(d1),.y(y1));
initial  
begin
	      a1=1'b0;b1=1'b0;c1=1'b0;d1=1'b0;   
#100    a1=1'b0;b1=1'b0;c1=1'b0;d1=1'b1; 
#100    a1=1'b0;b1=1'b0;c1=1'b1;d1=1'b0;
#100    a1=1'b0;b1=1'b0;c1=1'b1;d1=1'b1; 
#100    a1=1'b0;b1=1'b1;c1=1'b0;d1=1'b0; 
#100    a1=1'b0;b1=1'b1;c1=1'b0;d1=1'b1; 
#100    a1=1'b0;b1=1'b1;c1=1'b1;d1=1'b0; 
#100    a1=1'b0;b1=1'b1;c1=1'b1;d1=1'b1; 
#100    a1=1'b1;b1=1'b0;c1=1'b0;d1=1'b0; 
#100    a1=1'b1;b1=1'b0;c1=1'b0;d1=1'b1; 
#100    a1=1'b1;b1=1'b0;c1=1'b1;d1=1'b0; 
#100    a1=1'b1;b1=1'b0;c1=1'b1;d1=1'b1; 
#100    a1=1'b1;b1=1'b1;c1=1'b0;d1=1'b0; 
#100    a1=1'b1;b1=1'b1;c1=1'b0;d1=1'b1; 
#100    a1=1'b1;b1=1'b1;c1=1'b1;d1=1'b0; 
#100    a1=1'b1;b1=1'b1;c1=1'b1;d1=1'b1;  
end
endmodule
