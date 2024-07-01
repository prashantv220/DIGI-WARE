module sr_latch (
  input S,
  input R,
  output reg Q,
  output reg Qbar);

  always @(S or R)
  begin
    if (S && !R)    // Set condition
      begin
        Q <= 1;
        Qbar <= 0;
      end
    else if (!S && R)   // Reset condition
      begin
        Q <= 0;
        Qbar <= 1;
      end
    else                // Hold condition
      begin
        // No change
      end
  end

endmodule
