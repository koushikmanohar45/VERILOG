module demux1to8_tb();
  reg y,en;
  reg[2:0]s;
  reg [7:0]I;
  demux1to8 dut(.s(s),.en(en),.y(y),.I(I));
  integer i;
  always@(*) begin
    y=1;en=0;
    s=3'd2;
    $display("TIME=%0t  || Y=%B   ||ENABLE=%B S2=%B S1=%B S0=%B   || I=%B ",$time,y,en,s[2],s[1],s[0],I);
    y=1;en=1;
    for(i=0;i<8;i++) begin
      s=i;#10;
      $display("TIME=%0t  || Y=%B  ||ENABLE=%B S2=%B S1=%B S0=%B   || I=%B ",$time,y,en,s[2],s[1],s[0],I);
    end
    #10 $finish;
  end
  initial begin
    $dumpfile("demux1to8.vcd");
    $dumpvars(0,demux1to8_tb);
  end
endmodule
