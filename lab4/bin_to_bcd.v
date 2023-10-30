`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2023 15:53:15
// Design Name: 
// Module Name: bin_to_bcd
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


module bin_to_bcd(
    input [3:0] in,
    output [7:0] out
    );
    
    wire check;
    wire [3:0] six;

    
    assign check = in[3] & (in[2] | in[1]);
    assign six[0] = 0;
    assign six[1] = check;
    assign six[2] = check;
    assign six[3] = 0;
    
    wire [2:0] carry;
    
    FA fa1(in[0], six[0], 0, out[0], carry[0]);
    FA fa2(in[1], six[1], carry[0], out[1], carry[1]);
    FA fa3(in[2], six[2], carry[1], out[2], carry[2]);
    FA fa4(in[3], six[3], carry[2], out[3], out[4]);
    
    assign out[7] = 0;
    assign out[6] = 0;
    assign out[5] = 0;
     
endmodule

module bin2bcd(
   input [13:0] bin,
   output reg [15:0] bcd
   );
   
integer i;
	
always @(bin) begin
    bcd=0;		 	
    for (i=0;i<14;i=i+1) begin					//Iterate once for each bit in input number
        if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
	if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
	if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
	if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
	bcd = {bcd[14:0],bin[13-i]};				//Shift one bit, and shift in proper bit from input 
    end
end
endmodule
