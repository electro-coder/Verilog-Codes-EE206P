//AND of all bits
module anddigit #(parameter n=9) (
	input [n-1:0]a,
	output reg y);
integer i;
always @(a)
begin
y=1;
for(i=0;i<n;i=i+1)
begin
	y=y*a[i];
end
end
endmodule

//testbench
module L4_Q3_BENCH();
reg[8:0]a;
wire y;

anddigit dut1 (.a(a), .y(y));
initial 
begin
a= 9'b101010101;
#100 a=9'b111111111;
#100 a=9'b000000000;
end 
endmodule
