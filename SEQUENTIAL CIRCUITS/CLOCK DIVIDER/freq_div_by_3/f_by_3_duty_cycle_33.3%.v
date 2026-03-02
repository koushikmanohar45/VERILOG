module clk_divider(
  input clk,rst,
  output reg f_by_3
);
  reg[1:0] count;
  always@(posedge clk) begin
    if(rst) begin
      count<=2'b00;
      f_by_3<=1'b0;
    end
    else begin
      count<=count+1;
      if(count==2'b00) 
        f_by_3<=1'b0;
      else if(count==2'b10) begin
        f_by_3<=1'b1;
        count<=2'b00;
        end
       end
   end
endmodule
