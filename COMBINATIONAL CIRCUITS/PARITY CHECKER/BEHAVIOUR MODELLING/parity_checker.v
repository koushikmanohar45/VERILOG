module parity_checker(
input[7:0]data,
input parity_bit,
input mode,
output reg error
);
 always@(*)begin
   if(mode)
     error=~(^data^parity_bit);
   else 
     error=(^data^parity_bit);
  end
 endmodule
