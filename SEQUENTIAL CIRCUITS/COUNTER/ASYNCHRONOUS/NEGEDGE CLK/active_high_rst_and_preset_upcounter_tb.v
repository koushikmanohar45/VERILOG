module  asynchronous_negedge_clk_upcounter_tb();
  reg clk,rst,preset;
  wire [3:0]q;
  asynchronous_negedge_clk_upcounter dut(.*);
  always #5 clk=~clk;
  initial begin
    $monitor("TIME=%0t || clk=%b rst=%b preset=%b ||Q=%B",$time,clk,rst,preset,q);
    clk=1;rst=1;preset=0;
    #10 rst=0;
    #155 preset=1;
    #10 preset=0;
    #200 $finish; 
  end
  initial begin
    $dumpfile("asynchronous_negedge_clk_upcounter.vcd");
    $dumpvars(1,asynchronous_negedge_clk_upcounter_tb);
  end 
endmodule   
