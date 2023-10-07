//Write a single Verilog HDL code that can perform N-bit addition, N-bit subtraction and N-bit comparison.

module n_bit_arithmetic_compare #(parameter N=8)(
  input [N-1:0] A,
  input [N-1:0] B,
  input [1:0] operation, // 2-bit control signal: 00 for addition, 01 for subtraction, 10 for comparison
  output [N-1:0] result,
  output equal,
  output less_than,
  output greater_than
);

  wire [N-1:0] addition_result;
  wire [N-1:0] subtraction_result;
  
  // Adder for N-bit addition
  assign addition_result = A + B;
  // Subtractor for N-bit subtraction
  assign subtraction_result = A - B;
  // Mux for selecting the operation result
  assign result = (operation == 2'b00) ? addition_result :
                 (operation == 2'b01) ? subtraction_result :
                                      0; 
  // Comparator for N-bit comparison
  assign equal = (operation == 2'b10) ? (A == B) : 0;
  assign less_than = (operation == 2'b10) ? (A < B) : 0;
  assign greater_than = (operation == 2'b10) ? (A > B) : 0;
endmodule


//testbench
module testbench();
  reg [3:0] A;
  reg [3:0] B;
  reg [1:0] operation;
  wire [3:0] result;
  wire equal;
  wire less_than;
  wire greater_than;
  n_bit_arithmetic_compare uut (
    .A(A),
    .B(B),
    .operation(operation),
    .result(result),
    .equal(equal),
    .less_than(less_than),
    .greater_than(greater_than)
  );

  // Initialize test values
  initial begin
    A = 4'b0110;
    B = 4'b0101;
    
    // Test addition
    operation = 2'b00;
    #10;
    $display("Addition Result: %b", result);
    // Test subtraction
    operation = 2'b01;
    #10;
    $display("Subtraction Result: %b", result);
    // Test comparison
    operation = 2'b10;
    #10;
    $display("Equal: %b", equal);
    $display("Less Than: %b", less_than);
    $display("Greater Than: %b", greater_than);
  end
endmodule

