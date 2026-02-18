module alu_tb();
  reg clk,rst;
  reg signed [3:0]data1,data2;
  reg[3:0]sel_in;
  wire signed [15:0] out;
  integer i;
  alu dut(.*);
  always #5 clk=~clk;
  initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0,alu_tb);
    $display("          clk  rst  data1     data2         sel     output");
    $monitor("TIME=%0T ||  %B   %B   %B         %B         %B     || %b  ",$time,clk,rst,data1,data2,sel_in,out);
    clk=0;rst=0;data1=4'b0111;data2=4'b0110;
    for(i=0;i<16;i++) begin
      #10
      sel_in=i;
    end
    #10 data1=4'b1001;data2=4'b1010;
    for(i=0;i<16;i++) begin
      #10
      sel_in=i;
    end
    #10 $finish;
  end
endmodule
