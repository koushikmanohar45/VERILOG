module dff(input d,clk,rst,output reg q);
  always @(negedge clk or negedge rst) begin
    if (!rst)
        q <= 1'b0;
    else
        q <= d;
end
endmodule
