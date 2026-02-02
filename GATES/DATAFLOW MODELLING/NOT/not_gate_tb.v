module not_gate_tb ();
  reg a;
  wire y;
  not_gate dut(.a(a),.y(y));
  initial begin
    a=0;
    #2 a=1;
    #2 $finish;
  end
  initial begin
    $monitor(" time=%0t  ||A=%b   ||Y=%b",$time,a,y);
  end
  initial begin
    $dumpfile("not_gate.vcd");
    $dumpvars(1,not_gate_tb);
    #10
    $finish;
  end
endmodule
