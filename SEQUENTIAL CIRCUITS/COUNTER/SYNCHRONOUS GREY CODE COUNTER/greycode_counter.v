module greycode_counter(input clk,rst,output reg [3:0]count);
  reg [3:0] bin;

  always @(posedge clk or posedge rst) begin
    if(rst) begin
      bin   <=4'b0000;
      count <=4'b0000;
    end
    else begin
      bin <=bin+1; 
      count <=(bin>>1)^bin;    
    end
  end
endmodule
