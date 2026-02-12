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

module piso_dff(input [3:0]pin,input clk,rst,preset,sel,output sout);
  wire [4:0]q; 
  dff q0(clk,rst,preset,sel?pin[0]:q[1],q[0]);//sel=0 shift s=1 parallel load 
  dff q1(clk,rst,preset,sel?pin[1]:q[2],q[1]);
  dff q2(clk,rst,preset,sel?pin[2]:q[3],q[2]);
  dff q3(clk,rst,preset,sel?pin[3]:1'b0,q[3]);
  assign sout=q[0];
endmodule
