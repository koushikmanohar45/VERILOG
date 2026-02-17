module sequence_generator_110110_tb();
  reg clk,rst;
  wire y;
  sequence_generator_110110 dut(.*);
  always #5 clk=~clk;
  initial begin
    $dumpfile("sequence_generator_110110.vcd");
    $dumpvars(1,sequence_generator_110110_tb);
    $monitor("TIME=%0T || CLK=%B RST=%B || Y=%b || ",$time,clk,rst,y);
    clk=1;rst=1;
    #20 rst=0;
    #1000$finish;
  end
endmodule 
