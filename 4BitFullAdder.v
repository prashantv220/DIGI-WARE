module full_adder_1bit (
  input A,
  input B,
  input Cin,
  output Sum,
  output Cout);

  assign Sum = A ^ B ^ Cin;   // Sum bit
  assign Cout = (A & B) | (B & Cin) | (A & Cin);   // Carry bit

endmodule

module full_adder_4bit (
  input [3:0] A,
  input [3:0] B,
  input Cin,
  output [3:0] Sum,
  output Cout);

  wire [3:0] sum_bits;
  wire c4;

  // Instantiate four 1-bit full adders
  full_adder_1bit fa0 (.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(sum_bits[0]), .Cout(c4));
  full_adder_1bit fa1 (.A(A[1]), .B(B[1]), .Cin(c4), .Sum(sum_bits[1]), .Cout(c4));
  full_adder_1bit fa2 (.A(A[2]), .B(B[2]), .Cin(c4), .Sum(sum_bits[2]), .Cout(c4));
  full_adder_1bit fa3 (.A(A[3]), .B(B[3]), .Cin(c4), .Sum(sum_bits[3]), .Cout(Cout));

  assign Sum = sum_bits;

endmodule
