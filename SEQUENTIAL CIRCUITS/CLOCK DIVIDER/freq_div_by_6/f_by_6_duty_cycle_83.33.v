module clk_divider(
  input clk,rst,
  output reg f_by_6
);
  reg[2:0] count;
  always@(posedge clk) begin
    if(rst) begin
      count<=3'b000;
      f_by_6<=1'b0;
    end
    else begin
      count<=count+1;
      if(count==3'b001) 
        f_by_6<=~f_by_6;
      else if(count==3'b110) begin
        f_by_6<=~f_by_6;
        count<=3'b001;
       end
      else  
        f_by_6<=f_by_6;
        end
      end
endmodule
