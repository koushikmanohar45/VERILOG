module t_latch_tb;
  reg t, clk;
  wire q;
  t_latch dut (.t(t), .clk(clk), .q(q));
  initial begin
    $monitor("T=%0t clk=%b t=%b q=%b", $time, clk, t, q);
    clk = 1; t = 0;
    #15 t = 1;
    #10 t = 0;
    #12 clk = 0;
    #10 t = 1;
    #16 clk = 1;
    #10 t = 1;
    #12 t = 0;
    #15 $finish;
  end
  initial begin
    $dumpfile("t_latch.vcd");
    $dumpvars(1, t_latch_tb);
  end
endmodule

