module d_latch (input  d, clk,output reg q);
always @(*) begin
    if (clk) begin
        q <= d;
    end
end
endmodule
