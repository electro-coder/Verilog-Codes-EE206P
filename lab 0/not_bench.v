module not_bench();
reg a1;
wire y1;
not_gate dut (.a(a1),.y(y1));
initial
begin
	a1=1'b0;
#100    a1=1'b1;
end
endmodule
