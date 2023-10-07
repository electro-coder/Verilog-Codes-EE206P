module L2_Q6 #(parameter n=8)(
  input [n-1:0] A,
  input [n-1:0] B,
  output equal,
  output less_than,
  output greater_than
);

assign equal = (A == B);
assign less_than = (A < B);
assign greater_than = (A > B);
endmodule


//testbench
module L2_Q6_bench;
  reg [3:0] A;
  reg [3:0] B;
  wire equal, less_than, greater_than;

  L2_Q6 comparator (
    .A(A),
    .B(B),
    .equal(equal),
    .less_than(less_than),
    .greater_than(greater_than)
  );

  initial begin
    A = 4'b0110;
    B = 4'b0101;
    #10;
    $display("A == B: %b", equal);
    $display("A < B: %b", less_than);
    $display("A > B: %b", greater_than);
  end
endmodule

