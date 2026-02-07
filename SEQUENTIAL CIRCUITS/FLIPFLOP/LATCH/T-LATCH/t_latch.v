module t_latch (input  t, clk,output reg q);
initial q = 1'b0;   // initialization for simulation only 
always @(*) begin
    if (clk) begin
        if (t)
            q = ~q;   
        else
            q = q;    
    end
end
endmodule
