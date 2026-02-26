module dff (input d,clk,rst,output reg q);
always @(posedge clk) begin
    if (rst)
        q <= 1'b0;
    else
        q <= d;
end
endmodule

module d_to_sr(input s,r,clk,rst,output q);
  wire din;
  assign din=(s&r)?1'bx:s|(~r&q);
  dff d1(.d(din),.clk(clk),.rst(rst),.q(q));
endmodule
