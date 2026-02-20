module sync_fifo_tb();
  reg [7:0]data_in;
  reg rd_en,wt_en,clk,rst;
  wire [7:0]data_out;
  sync_fifo dut(.*);
  initial begin
    clk=0;
    forever #10 clk =~clk;
  end
  initial begin
    $dumpfile("sync_fifo.vcd");
    $dumpvars(0, sync_fifo_tb);

    rst=1;rd_en=0;wt_en=0;data_in=0;
    #20 rst=0;

    repeat (16) begin
      #20
      wt_en=1;rd_en=0;
      data_in= data_in+8'd5;
    end
    #20 wt_en=0;
    repeat (16) begin
      #20
      rd_en=1;wt_en=0;
    end
    #20 rd_en=0;
    repeat (8) begin
      #20
      wt_en=1;
      rd_en=1;
      data_in=$random;
    end
    #20 wt_en=0;rd_en=0;
    #40 $finish;
  end
  initial begin
    $monitor("time=%0t || clk=%b rst=%b wt_en=%b rd_en=%b data_in=%d || data_out=%d",$time,clk,rst,wt_en,rd_en,data_in,data_out);
  end
endmodule
