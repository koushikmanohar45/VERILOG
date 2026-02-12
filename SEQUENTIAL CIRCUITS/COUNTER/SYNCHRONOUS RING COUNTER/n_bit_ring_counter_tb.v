module n_bit_ring_counter_tb#(parameter n=4);
  reg clk,rst;
  wire [n-1:0] count;
  n_bit_ring_counter dut(.*);
  always# 5 clk=~clk;
  initial begin
    $dumpfile("n_bit_ring_counter.vcd");
    $dumpvars(1,n_bit_ring_counter_tb);
    $monitor("TIME=%0T ||CLK=%B RST=%B || COUNT=%B",$time,clk,rst,count);
    clk=1;rst=0;
    #50 rst=1; 
    #20 rst=0;
    #50 $finish;
  end
endmodule
