`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2023 04:36:33 PM
// Design Name: 
// Module Name: display_bcd_7segment_4digit
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


module display_bcd_7segment_4digit( 
     bcd,
     seg, digit_sel, DP, clk  );
     
  
  //Declare inputs,outputs and internal variables.
     input clk;
   
     wire [1:0]dp_sel;  // Select lines for Display   
     input [15:0] bcd;    //Inputs from switches 13 to 0 
     output [6:0] seg;   // Seven Segment display pins 
       
    output [3:0]digit_sel;   // Selecting one of the four seven segment dislays 
    output DP;               // point LED; Enable for fractions numbers display 
    
   wire [6:0]seg1, seg2, seg3, seg4;
    
    bcd_segment7_1digit  BCD1 (.bcd(bcd[3:0]), .seg(seg1));
    bcd_segment7_1digit  BCD2 (.bcd(bcd[7:4]), .seg(seg2)); 
    bcd_segment7_1digit  BCD3 (.bcd(bcd[11:8]), .seg(seg3));  
    bcd_segment7_1digit  BCD4 (.bcd(bcd[15:12]), .seg(seg4)); 
  
  counterDP uut (.clk(clk),.counter(dp_sel));
  assign digit_sel = dp_sel[1]?(dp_sel[0]?4'b1000:4'b0100):(dp_sel[0]?4'b0010:4'b0001);  
  assign seg = dp_sel[1]?(dp_sel[0]?seg4:seg3):(dp_sel[0]?seg2:seg1);
  assign DP = dp_sel[1]?(dp_sel[0]?1'b1:1'b0):(dp_sel[0]?1'b1:1'b1);
  
  
endmodule
