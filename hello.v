module q5ii();
   reg A,B,C;
  wire D= ~B;
   initial begin
     A = 1;
     В = 0;
     с = 1;
    $strobe(" s:",A,B,C,D);
     A = B;
    $display("d1:",A,B,C,D);
     В <= A;
    $display("d2:",A,B,C,D);
     с <= B;
   end
 endmodule
