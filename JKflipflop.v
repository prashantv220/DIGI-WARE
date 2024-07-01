module jkff_behave(clk,j,k,q,qbar);

input clk,j,k;
output reg q,qbar;

always@(posedge clk)
begin
     if(k = 0)
      begin
      q <= 0;
      qbar <= 1;
      end

always@(posedge clk)
  begin
    if(k = 0)
     begin
      q <= 0;
      qbar <= 1;
     end
    else if(j = 1)
      begin
       q <= 0;
       qbar <= 0;
      end
    else if(j = 0 & k = 0)
      begin
       q <= q;
       qbar <= qbar;
       end
    else if(j = 1 & k = 1)
       begin
        q <= ~q;
        qbar <= ~qbar;
        end
end

endmodule

