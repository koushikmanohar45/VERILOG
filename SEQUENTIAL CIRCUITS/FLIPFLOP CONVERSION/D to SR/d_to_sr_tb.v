module d_to_sr_tb;
    reg s,r,clk,rst;
    wire q;
  d_to_sr dut (.s(s),.r(r),.clk(clk),.rst(rst),.q(q));
    initial begin
      $monitor("TIME=%0t  || CLK= %B  RST=%B  || S=%B  R=%B  || Q= %B",$time,clk,rst,s,r,q);
        clk=0;rst=1;s=0;r=1;
        @(negedge clk) rst=0; 
        @(negedge clk) s=1;r=0;
        @(negedge clk) s=0;r=0;
        @(negedge clk)   s=0;r=1;
        @(negedge clk)   rst=0; 
        @(negedge clk) s=1;r=1;
        @(negedge clk) s=1;r=0;
        @(negedge clk) $finish;
    end
  initial begin
     clk=1;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("d_to_sr.vcd");
    $dumpvars(1,d_to_sr_tb);
  end

endmodule
