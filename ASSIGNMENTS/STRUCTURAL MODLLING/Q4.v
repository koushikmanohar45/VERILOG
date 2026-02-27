// 8x1 MUX using 4x1 MUX
//a) design
module mux4to1(input i0,i1,i2,i3,s0,s1,output y);
  assign y=s1?(s0?i3:i2):(s0?i1:i0);
endmodule 
module mux8to1_using_mux4to1(input i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,output y );
     wire y1,y2;
  mux4to1 m1(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.s0(s0),.s1(s1),.y(y1));
  mux4to1 m2(.i0(i4),.i1(i5),.i2(i6),.i3(i7),.s0(s0),.s1(s1),.y(y2));
  mux4to1 m3(.i0(y1),.i1(y2),.i2(1'b0),.i3(1'b0),.s0(s2),.s1(1'b0),.y(y));
endmodule 


//b)testbench
module mux8to1_using_mux4to1_tb();
 reg i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2;
 wire y;
  mux8to1_using_mux4to1 dut(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7),.s0(s0),.s1(s1),.s2(s2),.y(y));
  initial begin 
    i0=0;i1=1;i2=0;i3=1;i4=0;i5=1;i6=0;i7=1;s2=0;s1=0;s0=0;
    $monitor("TIME=%0t  || IO=%B I1=%B I2=%B I3=%B I4=%B I5=%B I6=%B I7=%B || S2=%B S1=%B S0=%b  ||  Y=%B",$time,i0,i1,i2,i3,i4,i5,i6,i7,s2,s1,s0,y);
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
    $dumpfile("mux8to1_using_mux4to1.vcd");
    $dumpvars(1,mux8to1_using_mux4to1_tb);
  end
endmodule
