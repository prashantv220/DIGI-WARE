//3 Bit Comparator using Behavioral modelling
module 3_Mag_Comp(input [2:0]a,b,
                  output equal, greater, lower);

reg greater, equal, lower; 
initial greater = 0, equal = 0, lower = 0;

always @ (a or b)
    begin 
        if (a < b)
            begin
            greater = 0; equal = 0; lower = 1;
            end   
        else if (a == b)
            begin
            greater = 0; equal = 1; lower = 0;
            end
        else
            begin
            greater = 1; equal = 0; lower = 0;
            end
end  
endmodule