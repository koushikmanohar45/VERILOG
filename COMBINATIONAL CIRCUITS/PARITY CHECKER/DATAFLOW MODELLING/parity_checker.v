module parity_checker(
  input[7:0]data,
  input parity_bit,
  input mode,
  output error
);
  wire even_error,odd_error;
  assign even_error=^data^parity_bit;
  assign odd_error=~(^data^parity_bit);
  assign error=mode?odd_error:even_error;
endmodule
