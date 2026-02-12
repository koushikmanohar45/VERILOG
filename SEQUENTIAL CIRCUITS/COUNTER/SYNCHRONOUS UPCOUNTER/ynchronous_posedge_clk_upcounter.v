module synchronous_posedge_clk_counter_tb();
  reg clk,rst;
  wire [3:0] count;
  synchronous_posedge_clk_counter dut(.*);
  always# 5 clk=~clk;
  initial begin
    $dumpfile("synchronous_posedge_clk_counter.vcd");
    $dumpvars(1,synchronous_posedge_clk_counter_tb);
    $monitor("TIME=%0T ||CLK=%B RST=%B || COUNT=%B",$time,clk,rst,count);
     clk=0;
    rst=1;
    #20 rst=0; 
    #200 rst=1;
    #20 rst=0;
    #200 $finish;
  end
endmodule
