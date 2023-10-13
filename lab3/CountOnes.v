//count the number of ones 
module onecount(
	input [8:0]a,
	output reg [3:0]y);
integer i;
assign i=4'd0;
always @(a)
begin
y=y+a[i];
i=i+1;
end
endmodule

//testbench
module L4_Q2_BENCH();
reg[8:0]a;
wire [3:0]y;
onecount dut1 (.a(a), .y(y));
initial 
begin
a= 9'b101010101;
#100 a=9'b111111111;
#100 a=9'b000000000;
end 
endmodule
