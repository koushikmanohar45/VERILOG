module digital_clk_tb;
  localparam CLK_PERIOD=20;
  reg clk,rst;
  wire[4:0] hours;
  wire [5:0] minutes;
  wire [5:0] seconds;
  digital_clk dut(.*);
  always #(CLK_PERIOD/2) clk=~clk;
  initial begin
    $dumpfile("digital_clk.vcd");
    $dumpvars(1,digital_clk_tb);
    $monitor("Time=%0t clk=%b rst=%b ||%0d:%0d:%0d ",$time,clk,rst,hours,minutes,seconds);
    clk=0;rst=1;
    #20 rst=0;
    #5900000000 $finish;
  end
endmodule
