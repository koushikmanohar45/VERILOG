module mux8to1_tb();
  reg I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2;
  wire y;
  mux8to1 dut(.i0(I0),.i1(I1),.i2(I2),.i3(I3),.i4(I4),.i5(I5),.i6(I6),.i7(I7),.s2(s2),.s1(s1),.s0(s0),.y(y));
  initial begin 
    I0=1; I1=0;I2=0; I3=1;I4=0;I5=0; I6=1;I7=0;s2=0;s1=0;s0=0;
    $monitor("Time=%0t || I0=%b I1=%b I2=%b I3=%b I4=%b I5=%b I6=%b I7=%b || s2=%b S1=%b S0=%b || Y=%b",$time,I0,I1,I2,I3,I4,I5,I6,I7,s2,s1,s0,y);
    #10 s2=0;s1=0;s0=1;
    #10 s2=0;s1=1;s0=0;
    #10 s2=0;s1=1;s0=1;
    #10 s2=1;s1=0;s0=0;I4=1;I5=1; I6=0;I7=1;
    #10 s2=1;s1=0;s0=1;
    #10 s2=1;s1=1;s0=0;
    #10 s2=1;s1=1;s0=1;
    #10 $finish;
  end
  initial begin
    $dumpfile("mux8to1.vcd");
    $dumpvars(1,mux8to1_tb);
  end
endmodule
