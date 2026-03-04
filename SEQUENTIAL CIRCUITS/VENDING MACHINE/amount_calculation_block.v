module amt_calculation#(parameter A)
(
  input[A-1:0]a,b,
  output reg [A-1:0] bal,
  output reg valid
);
  always@(*) begin
    if(a>=b) begin
      bal=a-b;
      valid=1'b1;
     end
    else
      valid=1'b0;
     end
endmodule
