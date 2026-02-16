module jhonson_counter_tb();
  reg clk,rst;
  wire [3:0] q;
  jhonson_counter dut(.*);
  always #5 clk=~clk;
  initial begin
    $dumpfile("Jhonson_counter.vcd");
    $dumpvars(1,jhonson_counter_tb);
    $monitor("TIME=%0T || CLK=%B RST=%B ||Q=%B ",$time,clk,rst,q);
    clk=1;rst=1;
    #10 rst=0;
    #80 rst=1;
    #20 rst=0;
    #100 $finish;
  end
endmodule
