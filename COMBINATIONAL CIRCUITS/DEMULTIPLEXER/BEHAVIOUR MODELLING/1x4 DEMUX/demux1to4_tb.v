module demux1to4_tb();
  reg y,en;
  reg[1:0]s;
  reg [3:0]I;
  demux1to4 dut(.s(s),.en(en),.y(y),.I(I));
  integer i;
  always@(*) begin
    y=1;en=0;
    s=3'd2;
    $display("TIME=%0t  || Y=%B   ||ENABLE=%B S1=%B S0=%B   || I=%B ",$time,y,en,s[1],s[0],I);
    y=1;en=1;
    for(i=0;i<4;i++) begin
      s=i;#10;
      $display("TIME=%0t  || Y=%B  ||ENABLE=%B S1=%B S0=%B   || I=%B ",$time,y,en,s[1],s[0],I);
    end
    #10 $finish;
  end
  initial begin
    $dumpfile("demux1to4.vcd");
    $dumpvars(0,demux1to4_tb);
  end
endmodule
