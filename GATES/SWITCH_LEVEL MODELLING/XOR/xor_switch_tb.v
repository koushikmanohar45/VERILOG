module xor_switch_tb ();
  reg a,b;
  wire y;
  xor_switch dut(.a(a),.b(b),.y(y));
  initial begin
    a=0;b=0;
    #2 a=0;b=1;
    #2 a=1;b=0;
    #2 a=1;b=1;
    #10 $finish;
  end
  initial begin
    $monitor(" time=%0t  ||A=%b B=%b  ||Y=%b",$time,a,b,y);
  end
  initial begin
    $dumpfile("xor_switch.vcd");
    $dumpvars(1,xor_switch_tb);
    #20
    $finish;
  end
endmodule
