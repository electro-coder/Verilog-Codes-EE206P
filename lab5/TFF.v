`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2023 16:50:00
// Design Name: 
// Module Name: TFF
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


module TFF(
        input T,
        input clk,
        input reset,
        output q1,
        output q2
    );
 
wire j,k;
assign j=T;
assign k=T;
JKFF dut(.J(j),.K(k),.clk(clk),.reset(reset),.q1(q1),.q2(q2));

endmodule


//testbench
module TFF_TestBench();
reg T,clk,reset;
wire q1,q2;
TFF dut(.T(T),.clk(clk),.reset(reset),.q1(q1),.q2(q2));
initial
begin
clk=1'b0;reset=1'b0;
#100 reset=1'b0;
#10 T=1'b0;
#20 T=1'b1;
end
always #10 clk=~clk;
endmodule
