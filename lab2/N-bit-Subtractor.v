module L2_Q5(a,b,y1);
parameter n=8;
wire [n:0]c;
assign c[0]=0;
input [n-1:0]a;
input [n-1:0]b;
output [n-1:0]y1;
wire y2;
genvar i;
generate
  for(i=0;i<n;i=i+1)
  begin
    L1_Q6 dut(a[i],~b[i],c[i],y1[i],c[i+1]);
  end
endgenerate
assign y2=c[8];
endmodule


//testbench
module L2_Q5_bench();
parameter M=8;
reg [M-1:0] a,b;
reg s;
wire [M-1:0] Y;
L2_Q5 x1(.a(a), .b(b), .y1(Y));
initial 
begin
#100 a=123; b=123;
end
endmodule
