module dff(input d,clk,rst,preset,output reg q);
  always @(posedge clk or posedge rst or posedge preset ) begin
    if (rst)
        q<=1'b0;
    else if(preset)
        q<=1'b1;
    else
        q<=d;
end
endmodule
module asynchronous_posedge_clk_up_downcounter(input rst,clk,preset,mode,output reg [3:0]q);
  wire clk1,clk2,clk3;
  assign clk1=mode?q[0]:~q[0];//mode=1 downcounter mode=0 upcounter
  assign clk2=mode?q[1]:~q[1];
  assign clk3=mode?q[2]:~q[2];
  
  dff q0(.d(~q[0]),.clk(clk),.preset(preset),.rst(rst),.q(q[0]));
  dff q1(.d(~q[1]),.clk(clk1),.preset(preset),.rst(rst),.q(q[1]));
  dff q2(.d(~q[2]),.clk(clk2),.preset(preset),.rst(rst),.q(q[2]));
  dff q3(.d(~q[3]),.clk(clk3),.preset(preset),.rst(rst),.q(q[3]));
endmodule
