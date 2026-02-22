module t_ff(input t,clk,rst,output reg q);
 always@(negedge clk)begin
  if(!rst)
    q<=1'b0;
  else begin
    if(t)
      q<=~q;
    else
      q<=q;
  end
 end
endmodule
