module t_ff_tb();
 reg t,clk,rst;
 wire q;
 t_ff dut(.t(t),.clk(clk),.rst(rst),.q(q));
 initial begin
  $monitor("TIME=%t  || CLK= %B  RST=%B  || T=%B  || Q= %B",$time,clk,rst,t,q);
  clk=0;rst=0;t=0;
  #15 rst=1;
  #11 t=1;
  #15 t=0;
  #4 rst=0;t=1;
  #6 rst=1;
  #15 t=1;
  #10 t=0;
  #20 rst=0;
  #20 $finish;
 end
 initial begin
  clk=1;
  forever #5 clk=~clk;
 end
 initial begin
  $dumpfile("t_ff.vcd");
  $dumpvars(1,t_ff_tb);
 end
endmodule
