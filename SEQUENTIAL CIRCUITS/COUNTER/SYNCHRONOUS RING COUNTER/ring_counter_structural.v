module dff (input clk,rst,preset,d,output reg q);
always @(posedge clk) begin
    if (rst)
        q<=1'b0;
    else if(preset)
        q<=1'b1;
    else
        q<=d;
end
endmodule

module ring_counter(input clk,input rst,output [3:0] count);
  wire [3:0]q;
  dff q0(clk,1'b0,rst,q[3],q[0]); 
  dff q1(clk,rst,1'b0,q[0],q[1]);
  dff q2(clk,rst,1'b0,q[1],q[2]);
  dff q3(clk,rst,1'b0,q[2],q[3]);
  assign count=q;
endmodule
