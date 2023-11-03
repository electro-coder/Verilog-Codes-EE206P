`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2023 17:47:57
// Design Name: 
// Module Name: JOHNSONCOUNTER
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


module JOHNSONCOUNTER(
            input clk,
            input reset,
            output [3:0] Count_out
    );
    reg [3:0] Count_temp;
    always @(posedge(clk) or reset)
    begin
        if(reset == 1'b1)   begin
            Count_temp = 4'b0000;   end
        else if(clk == 1'b1)  begin
            Count_temp = {Count_temp[2:0],~Count_temp[3]};  end 
    end
    assign Count_out = Count_temp;
endmodule

//method 2
module johnson_counter(
            input clk,
            input reset,
            output reg [3:0] q1
    );
wire y1,y2,y3;
reg [3:0] q2;
always @(posedge clk or reset)
begin
if(reset==1'b1) begin
q2=4'b0000;
assign q1=q2;
end
d_ff dut1(clk,q2,reset,y1);
d_ff dut2(clk,y1,reset,y2);
d_ff dut3(clk,y2,reset,y3);
d_ff dut4(clk,y3,reset,q1);
end
endmodule

module d_ff (
  input clk,    
  input d,      
  input rst,    
  output reg q);
  always @(posedge clk) 
  begin
    if (rst)
      q <= 1'b0;
    else
      q <= d;
  end
endmodule

//testbench
module JOHNSONCOUNTER_TB();
    reg clk;
    reg reset;
    wire [3:0] Count_out;
    JOHNSONCOUNTER uut (
        .clk(clk), 
        .reset(reset), 
        .Count_out(Count_out)
    );
    initial clk = 0; 
    always #10 clk = ~clk;     
    initial begin
        reset = 1; 
        #50;
        reset = 0;
    end
      
endmodule
