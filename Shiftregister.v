       //4-bit shift register
module shift_register (       
  input SI,                 // Serial input
  input CLK,                // Clock input
  input SRCLR,              // Shift register clear input                            
  output reg SO,            // Serial output
  output reg [3:0] P        // Parallel output
);

reg [3:0] shift_reg; // 4-bit shift register

always @(posedge CLK or posedge SRCLR)
  begin
    if (SRCLR)
      shift_reg <= 4'b0000; // Clear the shift register when SRCLR is asserted
    else
      shift_reg <= {shift_reg[2:0], SI}; // Shift left, new data from SI
  end

assign P = shift_reg; // Parallel output is the content of the shift register

always @(posedge CLK)
    SO <= shift_reg[3]; // Serial output is the MSB of the shift register

endmodule