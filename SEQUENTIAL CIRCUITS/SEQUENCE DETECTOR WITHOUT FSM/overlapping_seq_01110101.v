module seq_detector#(parameter seq=8'b01110101)(
  input clk,rst,x,
  output reg y
);
  reg[7:0] temp_register;
  always@(posedge clk or posedge rst) begin
    if(rst)begin
       temp_register<=8'd0;
       y<=1'b0;
    end
    else begin
      temp_register<={temp_register[6:0],x};
      if(temp_register==seq) begin
        y<=1'b1;
      end
      else
        y<=1'b0;
    end
  end     
endmodule
