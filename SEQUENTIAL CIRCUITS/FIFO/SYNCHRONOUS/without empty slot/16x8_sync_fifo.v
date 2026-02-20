module sync_fifo(
  input[7:0] data_in,
  input rd_en,wt_en,clk,rst,
  output reg [7:0] data_out
);
  reg[7:0]mem[15:0];
  reg [4:0] wptr,rptr;
  wire full,empty;
  always@(posedge clk) begin
    if(rst) begin
      wptr<=5'd0;
      data_out<=8'd0;
    end
   else begin
     if(wt_en && !full) begin 
       mem[wptr[3:0]]<=data_in;
           wptr<=wptr+1;
       end
     else
         wptr<=wptr;
      end
   end

 always @(posedge clk) begin
  if(rst)
     rptr<=5'd0;       
  else begin 
    if(rd_en && !empty) begin
      data_out<=mem[rptr[3:0]];
         rptr<=rptr+1;
        end
       else
         rptr<=rptr;
      end
   end
  assign empty=((wptr==rptr) && (rptr[4]==wptr[4]));
  assign full=((wptr[3:0]==rptr[3:0]) && (rptr[4]!=wptr[4]));
endmodule
