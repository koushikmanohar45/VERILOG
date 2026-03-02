// ON for 2.5 clk cycle
//OFF for 1.5 clk cycle
module clk_divider(
  input clk,rst,
  output reg f_by_4
);
  reg[1:0] count;
  always@(posedge clk) begin
    if(rst) begin
      count<=2'b00;
      f_by_4<=1'b0;
    end
    else begin
     if(count==2'b11) begin
        f_by_4<=~f_by_4;
        count<=2'b00;
       end
      else
        count=count+1;
        end
      end
  always@(negedge clk) begin
    if(rst) begin
      count<=2'b00;
      f_by_4<=1'b0;
    end
    else begin
      if(count==2'b01)
        f_by_4<=~f_by_4;
     end
    end
endmodule
