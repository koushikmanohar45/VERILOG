module t_ff_tb;
    reg t,clk,rst;
    wire q;
  t_ff dut (.t(t),.clk(clk),.rst(rst),.q(q));
    initial begin
      $monitor("TIME=%0t  || CLK= %B  RST=%B  || T=%B  || Q= %B",$time,clk,rst,t,q);
        clk=0;rst=0;t=1;
        #12 rst=1; 
        #18 t=0;
        #17 t=1;
        #4 rst=0;t=0;
        #6 rst=1; 
        #4 t=1;
        #13 rst=0;
        #2 $finish;
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
