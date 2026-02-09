module d_latch (input  d, clk,output reg q);
    always @(d or clk) begin
    if (clk) begin
        q <= d;
    end
end
endmodule
