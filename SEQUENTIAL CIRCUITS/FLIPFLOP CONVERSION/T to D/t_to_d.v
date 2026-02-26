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

module t_to_d(input d,clk,rst,output q);
  t_ff t1(.t(d^q),.clk(clk),.rst(rst),.q(q));
endmodule
