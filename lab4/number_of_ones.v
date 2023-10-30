`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2023 16:47:47
// Design Name: 
// Module Name: number_of_ones
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


module number_of_ones(
    input [8:0] in,
    output [3:0] out
    );
    wire [2:0] s0;
    wire [2:0] c0;
    
    FA fa1(in[0], in[1], in[2], s0[0], c0[0]);
    FA fa2(in[3], in[4], in[5], s0[1], c0[1]);
    FA fa3(in[6], in[7], in[8], s0[2], c0[2]);
    
    wire [1:0] s1;
    wire [1:0] c1;
    
    FA fa4(s0[1], s0[2], 0, s1[0], c1[0]);
    FA fa5(c0[2], c0[1], c1[0], s1[1], c1[1]);
    
    wire [1:0] c2;
    
    FA fa6(s0[0], s1[0], 0, out[0], c2[0]);
    FA fa7(c0[0], s1[1], c2[0], out[1], c2[1]);
    FA fa8(c1[1], 0, c2[1], out[2], out[3]);
    
endmodule
