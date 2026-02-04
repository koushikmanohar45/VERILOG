module mux2to1_tb();
  reg I0,I1,s,en;
  wire y;
  mux2to1 dut(.i0(I0),.i1(I1),.s(s),.en(en),.y(y));
  initial begin 
    I0=1; I1=0; s=0;en=1;
    $monitor("Time=%0t || I0=%b I1=%b  || en =%b S=%b || Y=%b",$time,I0,I1,s,en,y);
    #10 s=1;
    #10 en=0;
    #10 $finish;
  end
  initial begin
    $dumpfile("mux2to1.vcd");
    $dumpvars(1,mux2to1_tb);
  end
endmodule
