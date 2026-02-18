module mod_7_counter_tb();
  reg clk,rst;
  wire [2:0] y;
  mod_7_counter dut(.*);
  always #5 clk=~clk;
  initial begin
    $dumpfile("mod_7_counter.vcd");
    $dumpvars(1,mod_7_counter_tb);
    $monitor("TIME=%0T || CLK=%B RST=%B ||Y=%B || ",$time,clk,rst,y);
    clk=1;rst=1;
    #10 rst=0;
    #100 rst=1;
    #10 rst=0;
    #100 $finish;
  end
endmodule    
