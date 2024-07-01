module t_flipflop (
  input T,
  input CLK,
  output reg Q);

always @(posedge CLK)
  begin
    if (T)
      Q <= ~Q;  // Toggle the output on each rising edge of the clock when T is 1
  end

endmodule
