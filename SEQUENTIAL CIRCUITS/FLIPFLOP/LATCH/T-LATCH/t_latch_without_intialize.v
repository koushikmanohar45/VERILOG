module t_latch (input  t, clk,output reg q);
always @(*) begin
    if (clk) begin
        if (t)
            q = ~q;   
        else
            q = q;    
    end
end
endmodule
