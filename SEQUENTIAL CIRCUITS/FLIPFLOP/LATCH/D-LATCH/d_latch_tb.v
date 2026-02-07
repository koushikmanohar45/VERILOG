module d_latch_tb;
  reg d, clk;
  wire q;
  d_latch dut (.d(d), .clk(clk), .q(q));
  initial begin
    $monitor("T=%0t clk=%b d=%b q=%b", $time, clk, d, q);
    clk=1; d=0;
    #2 d=1;
    #4 d=0;
    #10 clk=0;
    #5 d=1;
    #10 clk=1;
    #10 d=0;
    #10 $finish;
  end
  initial begin
    $dumpfile("d_latch.vcd");
    $dumpvars(1,d_latch_tb);
  end
endmodule
