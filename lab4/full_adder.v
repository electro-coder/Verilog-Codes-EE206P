`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2023 16:47:47
// Design Name: 
// Module Name: full_adder
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


module FA(
input a,b,
input cin,
output o, cout
    );
    
    wire w1, w2, c1;
    
    HA ha_1(a, b, w1, w2);
    HA ha_2(w1, cin, o, c1);
    assign cout = w2 + c1;
    
endmodule
