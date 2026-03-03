module seq_det_000_or_111_overlapping_tb;
  reg clk,rst,x;
  wire y;
  seq_det_000_or_111_overlapping dut(.*);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $monitor("time=%0t  clk=%B rst=%B x=%B y=%B",$time,clk,rst,x,y);
    rst=1;x=0;
    @(negedge clk) rst=0; x=1;
    @(negedge clk) x=1;
    @(negedge clk) x=1;
    @(negedge clk) x=1;
    @(negedge clk) x=1;
    @(negedge clk) x=1;
    @(negedge clk) x=0;
    @(negedge clk) x=1;
    @(negedge clk) x=0;
    @(negedge clk) x=1;
    @(negedge clk) x=0;
    @(negedge clk) x=0;
    @(negedge clk) x=0;
    @(negedge clk) x=0;
    @(negedge clk) x=0;
    @(negedge clk) x=0;
    #20 $finish;
  end
  initial begin
    $dumpfile("seq_det_000_or_111_overlapping.vcd");
    $dumpvars(1,seq_det_000_or_111_overlapping_tb);
  end
endmodule
