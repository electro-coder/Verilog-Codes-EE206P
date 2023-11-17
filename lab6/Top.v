`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2023 11:27:52 PM
// Design Name: 
// Module Name: Top
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
module Top(
input clk,
input rst,
output DP,
output [3:0] digit_sel,
output [6:0]seg
    );
 
    wire [13:0]bin;
    wire [15:0]bcd;
    wire [7:0] bcd1;
    wire [7:0] bcd2;
    wire [6:0]sec, min, hour;
    wire [13:0] sec_b, min_b;
    
    time_gen uut1 (.clk(clk), .rst(rst), .second(sec), .minute(min),.hour(hour));
    //CountOnes uut4(bin_num,bin);
    assign sec_b = {{7{1'b0}}, sec};
    assign min_b = {{7{1'b0}}, min};
    bin2bcd uut2 (.bin(min_b),.bcd(bcd1));
    bin2bcd uut4 (.bin(sec_b),.bcd(bcd2));
    
   
    assign bcd  = {bcd1[7:0], bcd2[7:0]};
    
    display_bcd_7segment_4digit uut3 (.bcd(bcd),
 .seg(seg), .digit_sel(digit_sel), .DP(DP), .clk(clk) );
    
endmodule
