module and_bench();
reg a1,b1; // representation of inputs and int variables
wire y1; //represents outputs
and_gate dut (.a(a1),.b(b1),.y(y1));
initial  //one time execution
begin
	a1=1'b0;b1=1'b0;   //1' denotes 1 bit assign, b0 is binary 0
#100    a1=1'b0;b1=1'b1;   //#100 denotes delay of 100ms
#100    a1=1'b1;b1=1'b0;
#100    a1=1'b1;b1=1'b1;
end
endmodule
