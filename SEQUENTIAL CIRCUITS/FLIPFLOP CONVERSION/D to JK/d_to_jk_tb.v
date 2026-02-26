module d_to_jk_tb;
    reg j,k,clk,rst;
    wire q;
   d_to_jk dut (.j(j),.k(k),.clk(clk),.rst(rst),.q(q));
    initial begin
      $monitor("TIME=%0t  || CLK= %B  RST=%B  || J=%B  K=%B  || Q= %B",$time,clk,rst,j,k,q);
        clk=0;rst=1;j=0;k=1;
        @(negedge clk) rst=0; 
        @(negedge clk) j=1;k=0;
        @(negedge clk) j=0;k=0;
        @(negedge clk) rst=1;j=0;k=1;
        @(negedge clk) rst=0; 
        @(negedge clk) j=1;k=1;
        @(negedge clk) j=0;k=1;
        @(negedge clk) rst=1;
        @(negedge clk) $finish;
    end
  initial begin
     clk=1;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("d_to_jk.vcd");
    $dumpvars(1,d_to_jk_tb);
  end

endmodule
