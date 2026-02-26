module sr_to_t_tb;
    reg t,clk,rst;
    wire q;
  sr_to_t dut (.clk(clk),.rst(rst),.t(t),.q(q));
    initial begin
      $monitor("TIME=%0t  || CLK= %B  RST=%B  || T=%B  || Q= %B",$time,clk,rst,t,q);
         clk=0;rst=1;t=1;
         @(negedge clk) rst=0; 
         @(negedge clk) t=0;
         @(negedge clk) t=1;
         @(negedge clk) t=0;
         @(negedge clk) rst=1; 
         @(negedge clk) rst=0;t=1;
         @(negedge clk) rst=0;
         @(negedge clk) $finish;
    end
  initial begin
     clk=1;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("sr_to_t.vcd");
    $dumpvars(1,sr_to_t_tb);
  end
endmodule
