module sync_fifo(
  input[7:0] data_in,
  input rd_en,wt_en,clk,rst,
  output reg [7:0] data_out
);
  reg[7:0]mem[63:0];
  reg [5:0] wptr,rptr;
  wire full,empty;
  always@(posedge clk) begin
    if(rst) begin
      wptr<=6'd0;
      data_out<=8'd0;
    end
   else begin
     if(wt_en && !full) begin 
           mem[wptr]<=data_in;
           wptr<=wptr+1;
       end
     else
         wptr<=wptr;
      end
   end

 always @(posedge clk) begin
  if(rst)
     rptr<=6'd0;       
  else begin 
    if(rd_en && !empty) begin
         data_out<=mem[rptr];
         rptr<=rptr+1;
        end
       else
         rptr<=rptr;
      end
   end

  assign empty=(wptr==rptr);
  assign full=(rptr==(wptr+1'b1));
endmodule
