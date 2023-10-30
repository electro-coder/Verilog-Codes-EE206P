`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IITT
// Engineer: Subham Mohanty and Divyam Tiwari
// 
// Create Date: 20.10.2023 16:52:07
// Design Name: AND Gate
// Module Name: and1
// Project Name: Lab 5
// Target Devices: edgeA7
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


module and1(
a,b,c
    );
    input a,b;
    output c;
    
    assign c = a & b;
endmodule
