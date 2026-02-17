module tlc_tb();
  reg clk,rst;
  wire [2:0]NS,EW,P_NS,P_EW;
  tlc dut(.*);
  always #5 clk=~clk;
  initial begin
    $dumpfile("tlc.vcd");
    $dumpvars(1,tlc_tb);
    $monitor("TIME=%0T || CLK=%B RST=%B || NS=%B EW=%B P_NS=%B P_EW=%B || ",$time,clk,rst,NS,EW,P_NS,P_EW);
    clk=1;rst=1;
    #20 rst=0;
    #1000$finish;
  end
endmodule 
