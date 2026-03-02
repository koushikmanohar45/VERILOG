//ON for 1.5 clk cycle
// OFF for 1.5 clk cycle
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
      if(count==2'b10) begin
        f_by_3<=~f_by_3;
        count<=2'b00;
        end
       end
   end

  always@(negedge clk) begin
    if(rst) begin
      count<=2'b00;
      f_by_3<=1'b0;
    end
    else begin
      if(count==2'b01) 
        f_by_3<=~f_by_3;
       end
   end
endmodule
