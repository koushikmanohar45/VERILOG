module sr_to_d_tb;
    reg d,clk,rst;
    wire q;
    sr_to_d dut (.d(d),.clk(clk),.rst(rst),.q(q));
    initial begin
      $monitor("TIME=0%t  || CLK= %B  RST=%B  || D=%B  || Q= %B",$time,clk,rst,d,q);
         clk=0;rst=1;d=0;
         @(negedge clk) rst=0; 
         @(negedge clk) d=1;
         @(negedge clk) d=0;
         @(negedge clk) d=1; 
         @(negedge clk) d=0;
         @(negedge clk) d=1;
         @(negedge clk) rst=0;
         @(negedge clk) $finish;
    end
  initial begin
     clk=1;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("sr_to_d.vcd");
    $dumpvars(0,sr_to_d_tb);
  end

endmodule
