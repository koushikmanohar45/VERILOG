//ON for 1.5 clk cycle
//OFF for 4.5 clk cycle
module clk_divider(
  input clk,rst,
  output reg f_by_6
);
  reg[2:0] count;

  always @(posedge clk) begin  //toggle at count=5 (0->1->2->3->4->5(toggle)->0(repeat))
    if(rst) begin
      count<=3'b000;
      f_by_6<=1'b1;
    end
    else begin
      if(count==3'b101) begin
        f_by_6<=~f_by_6;
        count<=3'b000;
      end
      else  
        count<=count+1;
        end
      end
  
  
  always @(negedge clk) begin  //toggle at count=1 (0->1(toggle)->2->3->4->5->0(repeat))
    if(rst) begin
      count<=3'b000;
      f_by_6<=1'b1;
    end
    else begin
    if(count==3'b001) 
        f_by_6<=~f_by_6;
      end
    end
  
endmodule
