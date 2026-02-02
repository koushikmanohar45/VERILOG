module mux4to1_tb();
  reg I0,I1,I2,I3,s0,s1;
  wire y;
  mux4to1 dut(.i0(I0),.i1(I1),.i2(I2),.i3(I3),.s1(s1),.s0(s0),.y(y));
  initial begin 
    I0=1; I1=0;I2=0; I3=1; s1=0;s0=0;
    $monitor("Time=%0t || I0=%b I1=%b I2=%b I3=%b || S1=%b S0=%b || Y=%b",$time,I0,I1,I2,I3,s1,s0,y);
    #10 s1=0;s0=1;
    #10 s1=1;s0=0;I2=1;I3=0;
    #10 s1=1;s0=1;
    #10 $finish;
  end
  initial begin
    $dumpfile("mux4to1.vcd");
    $dumpvars(1,mux4to1_tb);
  end
endmodule
