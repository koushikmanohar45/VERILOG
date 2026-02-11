module  asynchronous_mod_10_counter_tb();
  reg clk,rst,preset;
  wire [3:0]q;
  asynchronous_mod_10_counter dut(.*);
  always #5 clk=~clk;
  initial begin
    $monitor("TIME=%0t || clk=%b rst=%b preset=%b ||Q=%B",$time,clk,rst,preset,q);
    clk=1;rst=0;preset=1;
    #20  rst=1;
    #2800 $finish; 
  end
  initial begin
    $dumpfile("asynchronous_mod_10_counter.vcd");
    $dumpvars(1,asynchronous_mod_10_counter_tb);
  end 
endmodule    
