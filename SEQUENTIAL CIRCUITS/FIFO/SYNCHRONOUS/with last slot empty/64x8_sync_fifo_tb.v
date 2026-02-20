module sync_fifo_tb();
  reg[7:0]data_in;
  reg rd_en,wt_en,clk,rst;
  wire[7:0]data_out;
  sync_fifo dut(.*);
 initial begin
  clk=0;forever #10 clk=~clk;
 end
initial begin
  $dumpfile("sync_fifo.vcd");
  $dumpvars(0,sync_fifo_tb);
  rst=1;
  rd_en=0;
  wt_en=0;
  data_in=8'd0;
  #20 rst=0;
  data_in=8'd10;
  wt_en=1;
  rd_en=0;
  #20
  data_in=8'd20;
  wt_en=1;
  rd_en=0;
  #20
  wt_en=0;
  rd_en=1;
  #20
  wt_en=1;
  data_in=8'd30;
  rd_en=1;
  #20
  wt_en=0;
  rd_en=1;
  #20
  wt_en=1;
  data_in=8'd40;
  rd_en=0;
  #20
  wt_en=0;
  rd_en=1;
  #20
  wt_en=1;
  data_in=8'd50;
  rd_en=1;
  #20
  wt_en=0;
  rd_en=1;
  #20
   data_in=8'd30;
   rd_en=0;
   wt_en=1;
  #20
   data_in=8'd45;
   rd_en=0;
   wt_en=1;
  #20
   data_in=8'd18;
   rd_en=0;
   wt_en=1;
  #20
   data_in=8'd0;
   rd_en=1;
   wt_en=1;
  
  $finish;
 end
 initial begin     $monitor("time=%0t|clk=%b|rst=%b|data_in=%d|wt_en=%b|rd_en=%b|data_out=%d",$time,clk,rst,data_in,wt_en,rd_en,data_out);
  end
 endmodule
