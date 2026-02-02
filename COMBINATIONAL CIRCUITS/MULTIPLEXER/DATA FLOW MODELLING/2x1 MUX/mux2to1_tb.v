module mux2to1_tb();
  reg I0,I1,s;
  wire y;
  mux2to1 dut(.i0(I0),.i1(I1),.s(s),.y(y));
  initial begin 
    I0=1; I1=0; s=0;
    $monitor("Time=%0t || I0=%b I1=%b  || S=%b || Y=%b",$time,I0,I1,s,y);
    #10 s=1;
    #10 $finish;
  end
  initial begin
    $dumpfile("mux2to1.vcd");
    $dumpvars(1,mux2to1_tb);
  end
endmodule
