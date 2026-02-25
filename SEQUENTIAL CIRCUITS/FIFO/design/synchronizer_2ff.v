module synchronizer_2ff #(parameter A)
(
  input clk,rst,
  input[A:0]data_in,
  output reg[A:0] data_out
);
  reg[A:0]temp;
  always@(posedge clk) begin
    if(rst) begin 
      temp<=0;
      data_out<=0;
    end
    else begin
      temp<=data_in;
      data_out<=temp;
    end
  end
endmodule
