module synchronous_negedge_clk_downcounter#(parameter n=5)(input clk,rst,output reg[n-1:0] count);
  always @(negedge clk) begin
    if(rst)
      count<={n{1'b1}};
    else begin
      if(count>0)
         count<=count-1;
      else 
        count<={n{1'b1}}; 
    end 
  end
  endmodule
