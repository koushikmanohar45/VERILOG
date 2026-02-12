module smodule synchronous_negedge_clk_downcounter_tb#(parameter n=5);
  reg clk,rst;
  wire [n-1:0] count;
  synchronous_negedge_clk_downcounter dut(.*);
  always# 5 clk=~clk;
  initial begin
    $dumpfile("synchronous_negedge_clk_downcounter.vcd");
    $dumpvars(1,synchronous_negedge_clk_downcounter_tb);
    $monitor("TIME=%0T ||CLK=%B RST=%B || COUNT=%B",$time,clk,rst,count);
     clk=1;
    rst=1;
    #20 rst=0; 
    #400 rst=1;
    #30 rst=0;
    #300 $finish;
  end
endmodule#(parameter n=5)(input clk,rst,output reg[n-1:0] count);
  always @(negedge clk) begin
    if(rst)
      count<={n{1'b0}};
    else begin
      if(count>0)
         count<=count-1;
      else 
        count<={n{1'b1}}; 
    end 
  end
  endmodule
