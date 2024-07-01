module top_module (
     input clk,
     input reset,
     output [3:1] ena,
     output [15:0] q);
     wire [3:0] q0,q1,q2,q3;
     wire [3:0] enable ;
     assign enable[0] = 1'b1;
     assign enable[1] = enable[0] && q0 == 4'd9;
     assign enable[2] = enable[1] && q1 == 4'd9;
     assign enable[3] = enable[2] && q2 == 4'd9;
     assign q = {q3,q2,q1,q0};
     assign ena = enable[3:1];
     bcd-10cnt a0(clk, reset,enable[0],q0);
     bcd-10cnt a1(clk, reset,enable[1],q1);
     bcd-10cnt a2(clk, reset,enable[2],q2);
     bcd-10cnt a3(clk, reset,enable[3],q3);
endmodule

module bcd_10cnt(
    input clk,
    input reset,
    input enable,
    output reg [3:0] q);

    always @(posedge clk) begin 
       if(reset)
            q<=0;
            else begin
                if(enable)  begin
                  if (q<4'd9)
                     q<=q+1;
                  else
                     q<=0;
                end 
                else 
                   q <= q;
            end
        end
endmodule                            