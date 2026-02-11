module dff(input d,clk,rst,preset,output reg q);
  always @(negedge clk or posedge rst or posedge preset ) begin
    if (rst)
        q <= 1'b0;
    else if(preset)
        q<=1'b1;
    else
        q <= d;
end
endmodule
module asynchronous_negedge_clk_upcounter#(parameter n=4)(input rst,clk,preset,output [n-1:0]q);
  dff q0(.d(~q[0]),.clk(clk),.preset(preset),.rst(rst),.q(q[0]));
  dff q1(.d(~q[1]),.clk(q[0]),.preset(preset),.rst(rst),.q(q[1]));
  dff q2(.d(~q[2]),.clk(q[1]),.preset(preset),.rst(rst),.q(q[2]));
  dff q3(.d(~q[3]),.clk(q[2]),.preset(preset),.rst(rst),.q(q[3]));
endmodule
