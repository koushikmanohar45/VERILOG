module sr_latch_tb();
  reg s, r, clk;
  wire q;

  sr_latch dut (.s(s), .r(r), .clk(clk), .q(q));

  initial begin
    $monitor("T=%0t clk=%b s=%b r=%b q=%b", $time, clk, s, r, q);

    clk=1; s=0; r=0;
    #7 s=1; r=0;  
    #12 s=0; r=1;   
    #7 s=0; r=0;   
    #18 s=1; r=1;   
    #5 clk=0; s=0; r=0;
    #7 s=1; r=0;   
    #12 s=0; r=1;   
    #10 s=0; r=0;   
    #15 clk=1;
    #10 $finish;
  end
  initial begin
    $dumpfile("sr_latch.vcd");
    $dumpvars;
  end
endmodule
