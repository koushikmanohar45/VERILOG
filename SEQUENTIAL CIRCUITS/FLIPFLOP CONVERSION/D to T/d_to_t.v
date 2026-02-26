module d_ff(input d,clk,rst,output reg q);
always @(posedge clk) begin
    if (rst)
        q <= 1'b0;
    else
        q <= d;
end
endmodule

module d_to_t(input t,clk,rst,output q);
  d_ff d1(.d(t^q),.clk(clk),.rst(rst),.q(q));
endmodule
