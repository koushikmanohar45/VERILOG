module rev_bits_tb;
 reg[31:0]n;
 wire[31:0]out;
 rev_bits dut(.n(n),.out(out));
initial begin
  $dumpfile("rev_bits.vcd");
  $dumpvars(0,rev_bits_tb);
  n=32'd1234;
  #10 n=32'd10;
  #10 n=32'd305;
  #10 $finish;
 end
initial begin
  $monitor("TIME=%0t n=%0d rev_bits=%b",$time,n,out);
 end
endmodule
