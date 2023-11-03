`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2023 16:25:54
// Design Name: 
// Module Name: JKFF
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module JKFF(
       input J,
       input K,
	   input reset,
	   input clk,
	   output q1,
	   output q2);
reg Q;
always @(posedge clk)
begin
if(reset==1'b0)
    Q<=1'b0;
if (J==0 && K==0)
    Q<=Q;
else if (J==0 && K==1)
    Q<=0;
else if (J==1 && K==0)
    Q<=1;
else
    Q<=~Q;
end
assign q1=Q;
assign q2=~Q;
endmodule

//testbench
module JKFF_TestBench();
reg J,K,clk,reset;
wire q1,q2;
JKFF dut(.J(J),.K(K),.clk(clk),.reset(reset),.q1(q1),.q2(q2));
initial
begin
clk=1'b0;reset=1'b0;
#100 reset=1'b0;
#10 J=1'b0; K=1'b0;
#20 J=1'b0; K=1'b1;
#20 J=1'b1; K=1'b0;
#20 J=1'b1; K=1'b1;
end
always #10 clk=~clk;
endmodule
