module jk_ff (input j,k,clk,rst,output reg q);
  always @(negedge clk ) begin
    if (!rst)
        q <= 1'b0;
    else begin
      if(j)begin
        if(k)
          q<=~q;
        else
          q<=1'b1;
      end
      else begin
        if(k)
          q<=1'b0;
        else
          q<=q;
      end
     end
  end
endmodule
