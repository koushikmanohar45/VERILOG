module sr_ff(input s,r,clk,rst,output reg q);
 always@(negedge clk or posedge rst)begin
   if(rst)
      q<=1'b0;
   else begin
     if(s)begin
       if(r)
         q<=1'bx;
       else
         q<=1'b1;
      end
   else begin
     if(r)
        q<=1'b0;
     else
        q<=q;
    end
  end
end
endmodule
