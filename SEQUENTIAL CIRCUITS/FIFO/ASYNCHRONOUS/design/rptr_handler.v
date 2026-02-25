module rptr_handler #(parameter A)
 (
  input r_clk,r_rst,
  input r_en,
   input[A:0] g_wptr_sync,
   output reg [A:0] g_rptr,b_rptr,
  output reg empty
);
  wire t_empty;
  wire[A:0]b_rptr_nxt,g_rptr_nxt;
  assign b_rptr_nxt=b_rptr+(r_en && !empty);
  assign g_rptr_nxt=(b_rptr_nxt^(b_rptr_nxt>>1));
  always @(posedge r_clk or posedge r_rst) begin
    if(r_rst) begin
      g_rptr<=0;
      b_rptr<=0;
      empty<=1;
    end
    else begin
      g_rptr<=g_rptr_nxt;
      b_rptr<=b_rptr_nxt;
      empty<=t_empty;     
    end
  end
  assign t_empty=(g_rptr_nxt==g_wptr_sync);
endmodule
