module jk_latch (input  j, k, clk,output reg q);
always @(*) begin
    if (clk) begin
        if (~j & ~k)
            q = q;       
        else if (~j & k)
            q = 1'b0;    
        else if (j & ~k)
            q = 1'b1;    
        else
            q = ~q;     
    end
end
endmodule
