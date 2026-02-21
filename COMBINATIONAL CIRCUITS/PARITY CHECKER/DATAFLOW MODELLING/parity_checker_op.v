module parity_checker(
input[7:0]data,
input parity_bit,
input m,
output error
);
   assign error=m?~(^data^parity_bit):(^data^parity_bit);
 endmodule
