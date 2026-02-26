module dff(input d,clk,rst,output reg q);
always @(posedge clk) begin
    if (rst)
        q <= 1'b0;
    else
        q <= d;
end
endmodule

module d_to_jk(input j,k,clk,rst,output q);
  dff d1(.d((~q&j)|(q&~k)),.clk(clk),.rst(rst),.q(q));
endmodule
