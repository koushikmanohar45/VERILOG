module seq_detector_tb;
  localparam CLK_PERIOD=10;
  reg clk,rst,x;
  wire y;
  seq_detector dut(.*);
  always #(CLK_PERIOD/2) clk=~clk;
  initial begin
    $dumpfile("seq_detector.vcd");
    $dumpvars(0,seq_detector_tb);
    $monitor("Time=%0t clk=%b rst=%b ||X=%b  Y=%b",$time,clk,rst,x,y);
    clk=0;rst=1;x=1;
    @(negedge clk) rst=0;x=1;
    @(negedge clk) x=0;
    @(negedge clk) x=1;
    @(negedge clk) x=0;
    @(negedge clk) x=1;
    @(negedge clk) x=1;
    @(negedge clk) x=1;
    @(negedge clk) x=0;
    @(negedge clk) x=1;
    @(negedge clk) x=0;
    @(negedge clk) x=1;
    @(negedge clk) x=0;
    @(negedge clk) x=1;
    @(negedge clk) x=0;
    @(negedge clk) x=1;
    @(negedge clk) x=1;
    @(negedge clk) x=1;
    @(negedge clk) x=0;
    @(negedge clk) x=1;
    @(negedge clk) x=0;
    @(negedge clk) x=1;
    @(negedge clk) x=1;
    @(negedge clk) x=1;
    @(negedge clk) x=0;
    @(negedge clk) x=1;
    @(negedge clk) x=0;
    @(negedge clk) x=1;
    @(negedge clk) x=0;
    @(negedge clk) x=1;
    @(negedge clk) x=1;
    
    #40$finish;
  end
endmodule
