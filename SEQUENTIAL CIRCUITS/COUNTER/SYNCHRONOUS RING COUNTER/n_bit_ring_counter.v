module n_bit_ring_counter#(parameter n=4)(input clk,rst,output reg[n-1:0] count={{n-1{1'b0}},1'b1});
  always @(negedge clk) begin
    if(rst)
      count<={{n-1{1'b0}},1'b1};
    else begin
      count<={count[n-2:0],count[3]};
    end
  end
endmodule
