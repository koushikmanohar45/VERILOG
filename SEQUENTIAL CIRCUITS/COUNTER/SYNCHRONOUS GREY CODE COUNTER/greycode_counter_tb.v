module greycode_counter_tb();
  reg clk,rst;
  wire [3:0] count;
  greycode_counter dut(.*);
  always #5 clk=~clk;
  initial begin
    $dumpfile("graycode_counter.vcd");
    $dumpvars(1,greycode_counter_tb);
    $monitor("TIME=%0T || CLK=%B RST=%B ||COUNT=%B || ",$time,clk,rst,count);
    clk=1;rst=1;
    #15 rst=0;
    #160 rst=1;
    #20 rst=0;
    #200 $finish;
  end
endmodule  
