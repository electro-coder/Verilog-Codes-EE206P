`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2023 10:44:54 PM
// Design Name: 
// Module Name: counterDP
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


module counterDP(
input clk,

output reg [1:0] counter
    );
    
    
reg [20:0]count = 0; 
   always @(posedge clk) begin
   
   if(count > 100_0000)begin
    count<=0;
   end
   else begin
        count = count+1;
   end
   
   if(count < 25_0000)begin
    counter <= 2'b00;
   end
   else if(count > 25_0000 && count < 50_0000 )begin
   counter <= 2'b01;
   end
   else if(count > 50_0000 && count <75_0000)begin 
   counter <= 2'b10;
   end
   else begin
   counter <= 2'b11;
   end
  
   end 
    
endmodule
