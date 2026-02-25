module asynchronus_fifo #(parameter depth=32,width=8)
  (
    input [width-1:0]data_in,
    input w_clk,r_clk,
    input w_rst,r_rst,
    input w_en,r_en,
    output [width-1:0] data_out,
    output full,empty
  );
  localparam addr=$clog2(depth);
  wire [addr:0]b_wptr,b_rptr;
  wire [addr:0]g_wptr,g_rptr;
  wire [addr:0]b_wptr_nxt,b_rptr_nxt;
  wire [addr:0]g_wptr_nxt,g_rptr_nxt;
  wire [addr:0]g_wptr_sync,g_rptr_sync; 
   
  synchronizer_2ff #(.A(addr)) m1(.clk(w_clk),.rst(w_rst),.data_in(g_rptr),.data_out(g_rptr_sync));
  synchronizer_2ff #(.A(addr)) m2(.clk(r_clk),.rst(r_rst),.data_in(g_wptr),.data_out(g_wptr_sync));
  wptr_handler #(.A(addr)) m3(.w_clk(w_clk),.w_rst(w_rst),.g_rptr_sync(g_rptr_sync),.w_en(w_en),.g_wptr(g_wptr),.b_wptr(b_wptr),.full(full));
  rptr_handler#(.A(addr)) m4(.r_clk(r_clk),.r_rst(r_rst),.g_wptr_sync(g_wptr_sync),.g_rptr(g_rptr),.b_rptr(b_rptr),.r_en(r_en),.empty(empty));
  fifo_memory#(.W(width),.D(depth),.A(addr)) m5(.data_in(data_in),.w_clk(w_clk),.r_clk(r_clk),.w_rst(w_rst),.r_rst(r_rst),.w_en(w_en),.r_en(r_en),.full(full),.empty(empty),.b_wptr(b_wptr),.b_rptr(b_rptr),.data_out(data_out)); 

endmodule
