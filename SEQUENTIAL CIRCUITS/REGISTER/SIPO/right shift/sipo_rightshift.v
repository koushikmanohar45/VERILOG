module sipo_dff#(parameter n=4)( input d,clk,rst,preset,output reg [n-1:0]q);
  always @(posedge clk) begin
    if(rst)
      q<={n{1'b0}};
    else if(preset)
      q<={n{1'b1}};
    else
      q<={d,q[n-1:1]};
  end  
endmodule
