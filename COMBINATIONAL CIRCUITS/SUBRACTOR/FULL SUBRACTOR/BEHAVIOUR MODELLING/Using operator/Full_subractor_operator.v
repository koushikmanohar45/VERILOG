module full_subractor(input a,b,bin,output reg d,br);
always@(*)begin
{br,d}=a-b-bin;
end
endmodule
