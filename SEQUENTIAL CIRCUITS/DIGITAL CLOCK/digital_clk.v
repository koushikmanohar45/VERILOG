module digital_clk(
  input clk,rst,
  output reg [4:0] hours,
  output reg [5:0] minutes,
  output reg [5:0] seconds
);
  always@(posedge clk) begin
    if(rst)begin
       hours<=5'd0;
       minutes<=6'd0;
       seconds<=6'd0;
    end
    else begin
    if(seconds==6'd59 && minutes== 6'd59 && hours==5'd23) begin
        hours<=5'd0;
        minutes<=6'd0;
        seconds<=6'd0;
       end 
    else if(seconds==6'd59 && minutes==6'd59) begin
        seconds<=6'd0;
        minutes<=6'd0;
        hours<= hours+1'b1;
       end
    else if(seconds==6'd59) begin
        seconds<=6'd0;
        minutes<=minutes+1'b1;
       end
      else
        seconds<=seconds+1;
    end
  end     
endmodule
