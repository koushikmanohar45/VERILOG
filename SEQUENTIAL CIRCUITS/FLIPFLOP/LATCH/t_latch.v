module t_latch (input  t, clk,output reg q);
initial q = 1'b0;   // initialization for simulation
always @(*) begin
    if (clk) begin
        if (t)
            q = ~q;   // toggle
        else
            q = q;    // hold
    end
end
endmodule
