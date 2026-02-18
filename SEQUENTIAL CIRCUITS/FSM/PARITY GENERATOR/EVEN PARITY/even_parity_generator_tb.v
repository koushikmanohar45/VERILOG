module parity_generator_tb();
  reg clk,rst;
  reg [2:0]x;
  wire y;
  integer i;
  parity_generator dut(.*);
  always #5 clk=~clk;
  initial begin
    $dumpfile("parity_generator.vcd");
    $dumpvars(1,parity_generator_tb);
    $monitor("TIME=%0T || CLK=%B RST=%B X=%B||Y=%B || ",$time,clk,rst,x,y);
    clk=1;rst=1;x=3'b000;
    #10 rst=0;
    for(i=0;i<8;i++) begin
      x=i;
      #10;
    end   
    #10 $finish;
  end
endmodule 
