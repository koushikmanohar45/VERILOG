module pipo_dff(input [0:3]d,input clk,rst,preset,output reg [0:3]q);
  always @(negedge clk) begin
    if (rst)
        q <= 4'b0000;
    else if(preset)
         q<=4'b1111;
    else
        q <= d;
end
endmodule
