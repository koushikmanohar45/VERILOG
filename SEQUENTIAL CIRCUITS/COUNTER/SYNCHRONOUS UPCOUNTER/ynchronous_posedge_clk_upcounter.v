module synchronous_posedge_clk_counter(input clk,rst,output reg[3:0] count);
  always @(posedge clk) begin
    if(rst)
      count<=0;
    else begin
      if(count<=15)
         count<=count+1;
      else
        count<=4'b0000;
    end 
  end
  endmodule
