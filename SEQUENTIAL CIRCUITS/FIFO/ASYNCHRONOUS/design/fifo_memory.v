module fifo_memory#(parameter W,D,A)
(
  input [W-1:0]data_in,
    input w_clk,r_clk,
    input w_rst,r_rst,
    input w_en,r_en,
    input full,empty,
    input[A:0] b_wptr,b_rptr,
  output reg [W-1:0] data_out
);
  reg [W-1:0]mem[0:D-1];
  always@(posedge w_clk or posedge w_rst) begin
   if(w_en && !full) 
     mem[b_wptr[A-1:0]]<=data_in; 
    end
  always@(posedge r_clk or posedge r_rst) begin
    if(r_en && !empty) 
      data_out<=mem[b_rptr[A-1:0]]; 
    end
endmodule
