module mux4to1_using_gates_tb();
 reg i0,i1,i2,i3,s0,s1;
 wire y;
  mux4to1_using_gates dut(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.s0(s0),.s1(s1),.y(y));
  initial begin 
    i0=0;i1=1;i2=0;i3=1;s0=0;s1=0;
    $monitor("TIME=%0t  || IO=%B I1=%B I2=%B I4=%B  || S0=%B S1=%B  ||  Y=%B",$time,i0,i1,i2,i3,s0,s1,y);
    #10 s0=1;s1=0;
    #10 s0=0;s1=1;
    #10 s0=1;s1=1;
    #10 $finish;
  end
  initial begin
   $dumpfile("mux4to1_using_gates.vcd");
   $dumpvars(1,mux4to1_using_gates_tb);
  end
endmodule
