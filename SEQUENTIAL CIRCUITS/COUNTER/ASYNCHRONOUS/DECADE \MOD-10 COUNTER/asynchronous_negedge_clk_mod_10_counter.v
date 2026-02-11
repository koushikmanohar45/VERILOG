module tff(input t,clk,rst,preset,output reg q);
  always @(negedge clk or negedge rst or negedge preset ) begin
    if (!rst)
        q<=1'b0;
    else if(!preset)
        q<=1'b1;
    else begin
      case(t)
        1'b0:q<=q;
        1'b1:q<=~q;
        default:q<=q;
      endcase
    end
end
endmodule
module asynchronous_mod_10_counter(input rst,clk,preset,output [3:0] q);
  wire mod_rst;
  
  tff q0(.t(1'b1),.clk(clk),.preset(preset),.rst(rst&mod_rst),.q(q[0]));
  tff q1(.t(1'b1),.clk(q[0]),.preset(preset),.rst(rst&mod_rst),.q(q[1]));
  tff q2(.t(1'b1),.clk(q[1]),.preset(preset),.rst(rst&mod_rst),.q(q[2]));
  tff q3(.t(1'b1),.clk(q[2]),.preset(preset),.rst(rst&mod_rst),.q(q[3]));
  nand(mod_rst,~q[2],~q[0],q[3],q[1]);
endmodule
