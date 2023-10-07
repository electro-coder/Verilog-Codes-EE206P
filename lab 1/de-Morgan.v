module L1_Q3_1(input a,b, output y);
reg a1,b1;
wire y1;
nor_gate uut(a,b,y);
endmodule

module L1_Q3_2(input a,b, output y);
reg a1,b1;
wire y1,y2,y3;
not_gate uut1 (a,y1);
not_gate uut2 (b,y2);
and_gate uut3 (y1,y2,y);
endmodule


//testbench
module L1_Q3_bench();
reg a1,b1,a2,b2; 
wire y1,y2; 
L1_Q3_1 dut1 (.a(a1),.b(b1),.y(y1));
L1_Q3_2 dut2 (.a(a2),.b(b2),.y(y2));
initial  
begin
	      a1=1'b0;b1=1'b0;  a2=1'b0;b2=1'b0;
#100    a1=1'b1;b1=1'b0;  a2=1'b1;b2=1'b0; 
#100    a1=1'b0;b1=1'b1;  a2=1'b0;b2=1'b1;
#100    a1=1'b1;b1=1'b1;  a2=1'b1;b2=1'b1;  
end
endmodule
