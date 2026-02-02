module not_switch_tb ();
  reg a;
  wire y;
  not_switch dut(.a(a),.y(y));
  initial begin
    a=0;
    #2 a=1;
    #2 $finish;
  end
  initial begin
    $monitor(" time=%0t  ||A=%b   ||Y=%b",$time,a,y);
  end
  initial begin
    $dumpfile("not_switch.vcd");
    $dumpvars(1,not_switch_tb);
    #20
    $finish;
  end
endmodule
