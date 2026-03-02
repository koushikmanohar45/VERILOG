module clk_divider_tb;
  localparam CLK_PERIOD=20;
  reg clk,rst;
  wire f_by_4;
  clk_divider dut(.*);
  always #(CLK_PERIOD/2) clk=~clk;
  initial begin
    $dumpfile("clk_divider.vcd");
    $dumpvars(1,clk_divider_tb);
    $monitor("Time=%0t clk=%b rst=%b f_by_4=%b",$time,clk,rst,f_by_4);
    clk=0;rst=1;
    #30 rst=0;
    #1000 $finish;
  end
endmodule
