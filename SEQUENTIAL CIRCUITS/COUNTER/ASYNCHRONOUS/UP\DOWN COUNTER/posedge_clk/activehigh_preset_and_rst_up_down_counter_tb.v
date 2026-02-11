module  asynchronous_posedge_clk_up_downcounter_tb();
  reg clk,rst,preset,mode;
  wire [3:0]q;
  asynchronous_posedge_clk_up_downcounter dut(.*);
  always #5 clk=~clk;
  initial begin
    $monitor("TIME=%0t || clk=%b rst=%b preset=%b ||Q=%B",$time,clk,rst,preset,q);
    clk=1;rst=1;preset=0;mode=0;
    #20 rst=0;
    #160 preset=1;
    #10 preset=0;mode=1;
    #180 $finish; 
  end
  initial begin
    $dumpfile("asynchronous_posedge_clk_up_downcounter.vcd");
    $dumpvars(1,asynchronous_posedge_clk_up_downcounter_tb);
  end 
endmodule    
