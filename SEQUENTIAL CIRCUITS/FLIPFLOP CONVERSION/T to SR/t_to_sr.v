module t_ff (input t,clk,rst,output reg q);
  always @(posedge clk ) begin
    if (rst)
        q <= 1'b0;
    else begin
      if(!t)
        q<=q;
      else
        q<=~q;
    end
  end
endmodule 

module t_to_sr(input s,r,clk,rst,output q);
  wire tin;
  assign tin=(s&~q)|(r&q);
  t_ff t1(.t(tin),.clk(clk),.rst(rst),.q(q));
endmodule
