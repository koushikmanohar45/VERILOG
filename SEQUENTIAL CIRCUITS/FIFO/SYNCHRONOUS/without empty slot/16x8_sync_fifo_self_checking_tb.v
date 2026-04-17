module sync_fifo_tb;

reg [7:0] data_in;
reg rd_en,wt_en,clk,rst;
wire [7:0] data_out;
wire empty,full;

reg [7:0] mem [15:0];
reg [3:0] wptr,rptr;
reg [7:0] expected;

sync_fifo dut(.*);

always #5 clk=~clk;


task write_fifo(input [7:0] din);
begin
 @(posedge clk);
 if(!full) begin
   wt_en=1; rd_en=0;
   data_in=din;
   mem[wptr]=din;
   wptr=wptr+1;
 end
end
endtask
  
  

task read_fifo;
begin
 @(posedge clk);
 if(!empty) begin
   wt_en=0;
   rd_en=1;
   expected=mem[rptr];
   rptr=rptr+1;

   #1;
   if(data_out==expected)
      $display("PASS expected=%0d got=%0d",expected,data_out);
   else
      $display("FAIL expected=%0d got=%0d",expected,data_out);
 end
end
endtask
  
  

initial begin
  clk=0;rst=1; wt_en=0;rd_en=0;
 wptr=0;rptr=0;

 #20 rst=0;
  repeat(20) begin
    write_fifo($urandom); 
  end

  #1
  repeat(20) begin
   read_fifo();
  end
 #50 $finish;
end

endmodule
