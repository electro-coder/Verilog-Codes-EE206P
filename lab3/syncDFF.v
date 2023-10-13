// Synchronous D Flip-Flop
module syncDFF(
	input D,
	input reset,
	input clk,
	output reg q1,
	output reg q2);
always @(posedge clk)
begin
if(reset==1'b0)
q1=1'b0;
else
begin
q2=~D;
q1=D;
end
end
endmodule

//testbench
module L4_Q4_bench();
reg D,clk,reset;
wire q1,q2;
syncDFF dut(.D(D),.clk(clk),.reset(reset),.q1(q1),.q2(q2));
initial
begin
D=1'b0;clk=1'b0;reset=1'b0;
#100 reset=1'b0;
#20;
forever #40 D=~D;
end
always #10 clk=~clk;
endmodule
