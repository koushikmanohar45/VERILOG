module jk_ff (input j,k,clk,rst,preset,output reg q);
  always @(posedge clk or posedge rst or posedge preset ) begin
    if (rst)
        q<=1'b0;
    else if(preset)
         q<=1'b1;
    else begin
      case({j,k})
        2'b00: q<=q;
        2'b01: q<=1'b0;
        2'b10: q<=1'b1;
        2'b11: q<=~q;
        default: q<=q;
      endcase
  end
end
endmodule
module asynchronous_posedge_ff_upcounter#(parameter n=4)(input rst,clk,preset,output [n-1:0]q);
  jk_ff q0(.j(1'b1),.k(1'b1),.clk(clk),.preset(preset),.rst(rst),.q(q[0]));
  jk_ff q1(.j(1'b1),.k(1'b1),.clk(~q[0]),.preset(preset),.rst(rst),.q(q[1]));
  jk_ff q2(.j(1'b1),.k(1'b1),.clk(~q[1]),.preset(preset),.rst(rst),.q(q[2]));
  jk_ff q3(.j(1'b1),.k(1'b1),.clk(~q[2]),.preset(preset),.rst(rst),.q(q[3]));
endmodule
  
