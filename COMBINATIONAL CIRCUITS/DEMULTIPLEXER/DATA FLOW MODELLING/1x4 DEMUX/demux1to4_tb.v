module demux1to4_tb();
 reg y,s1,s0;
 wire i0,i1,i2,i3;
  demux1to4 dut(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.s1(s1),.s0(s0),.y(y));
  initial begin 
    y=0;s1=0;s0=0;
    $monitor("TIME=%0t  || Y=%B  || S1=%B S0=%B   || IO=%B I1=%B I2=%B I4=%B",$time,y,s1,s0,i0,i1,i2,i3);
    #10 s1=0;s0=1;
    #10 s1=1;s0=0;
    #10 s1=1;s0=1;
    #10 y=1;s1=0;s0=0;
    #10 s1=0;s0=1;
    #10 s1=1;s0=0;
    #10 s1=1;s0=1;
    
    #10 $finish;
  end
  initial begin
   $dumpfile("demux1to4.vcd");
   $dumpvars(0,demux1to4_tb);
  end
endmodule
