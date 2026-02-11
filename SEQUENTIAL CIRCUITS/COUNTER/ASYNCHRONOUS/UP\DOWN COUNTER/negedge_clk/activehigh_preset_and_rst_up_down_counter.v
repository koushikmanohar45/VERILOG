module tff(input t,clk,rst,preset,output reg q);
  always @(negedge clk or posedge rst or posedge preset ) begin
    if (rst)
        q<=1'b0;
    else if(preset)
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
module asynchronous_negedge_clk_up_downcounter(input rst,clk,preset,mode,output reg [3:0]q);
  wire clk1,clk2,clk3;
  assign clk1=mode?~q[0]:q[0];//mode=1 downcounter mode=0 upcounter
  assign clk2=mode?~q[1]:q[1];
  assign clk3=mode?~q[2]:q[2];
  
  tff q0(.t(1'b1),.clk(clk),.preset(preset),.rst(rst),.q(q[0]));
  tff q1(.t(1'b1),.clk(clk1),.preset(preset),.rst(rst),.q(q[1]));
  tff q2(.t(1'b1),.clk(clk2),.preset(preset),.rst(rst),.q(q[2]));
  tff q3(.t(1'b1),.clk(clk3),.preset(preset),.rst(rst),.q(q[3]));
endmodule
