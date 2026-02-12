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

module pipo_dff(input [3:0]pin,clk,rst,preset,output [3:0] pout);
  dff q0(clk,rst,preset,pin[0],pout[0]); 
  dff q1(clk,rst,preset,pin[1],pout[1]);
  dff q2(clk,rst,preset,pin[2],pout[2]);
  dff q3(clk,rst,preset,pin[3],pout[3]);
endmodule
