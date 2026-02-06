module jk_ff_tb;
    reg j,k,clk,rst;
    wire q;
  jk_ff dut (.j(j),.k(k),.clk(clk),.rst(rst),.q(q));
    initial begin
      $monitor("TIME=%t  || CLK= %B  RST=%B  || J=%B  K=%B  || Q= %B",$time,clk,rst,j,k,q);
        clk=0;rst=0;j=0;k=1;
        #15 rst=1; 
        #11 j=1;k=0;
        #15 j=0;k=0;
        #4 rst=0;j=0;k=1;
        #6 rst=1; 
        #15 j=1;k=1;
        #10 j=0;k=1;
        #20 rst=0;
        #20 $finish;
    end
  initial begin
     clk=1;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("jk_ff.vcd");
    $dumpvars(1,jk_ff_tb);
  end

endmodule
