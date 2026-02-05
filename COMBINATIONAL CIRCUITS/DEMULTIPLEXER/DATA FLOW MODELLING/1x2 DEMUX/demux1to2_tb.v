module demux1to2_tb();
 reg y,s;
 wire i0,i1;
 demux1to2 dut(.i0(i0),.i1(i1),.s(s),.y(y));
  initial begin 
    y=1;s=0;
    $monitor("TIME=%0t  || Y=%B  || S=%B   || IO=%B I1=%B ",$time,y,s,i0,i1);
    #10 s=1;
    #10 y=0; s=0;
    #10 s=1;
    #10 $finish;
  end
  initial begin
   $dumpfile("demux1to2.vcd");
   $dumpvars(0,demux1to2_tb);
  end
endmodule
