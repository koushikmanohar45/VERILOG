module demux8to1_tb();
 reg y,s2,s1,s0;
 wire i0,i1,i2,i3,i4,i5,i6,i7;
  demux8to1 dut(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7),.s2(s2),.s1(s1),.s0(s0),.y(y));
  initial begin 
   y=1; s2=0;s1=0;s0=0;
    $monitor("TIME=%0t  || Y=%B  ||S2=%B S1=%B S0=%B   || IO=%B I1=%B I2=%B I3=%B I4=%B I5=%B I6=%B I7=%B",$time,y,s2,s1,s0,i0,i1,i2,i3,i4,i5,i6,i7);
    #10 s2=0;s1=0;s0=1;
    #10 s2=0;s1=1;s0=0;
    #10 s2=0;s1=1;s0=1;
    #10 s2=1;s1=0;s0=0;
    #10 s2=1;s1=0;s0=1;
    #10 s2=1;s1=1;s0=0;
    #10 s2=1;s1=1;s0=1;
    
    #10 $finish;
  end
  initial begin
    $dumpfile("demux8to1.vcd");
    $dumpvars(0,demux8to1_tb);
  end
endmodule
