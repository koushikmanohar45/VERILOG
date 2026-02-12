module sipo_dff_tb();
  reg d,clk,rst,preset;
  wire [3:0] q;
  sipo_dff dut (.d(d),.clk(clk),.rst(rst),.preset(preset),.q(q));
  initial begin
    clk=1;
    forever #5 clk=~clk;
  end
  initial begin
    $monitor("TIME=%0t || CLK=%b RST=%b PREST=%b|| D=%b ||Q=%b",$time,clk,rst,preset,d,q);    
    rst=1;preset=0;
    d=0;
    #10 rst=0;d=1;
    #10 d=0;
    #10 d=0;
    #10 d=1;
    #10 d=0;
    #10 d=1;
    #10 d=1;
    #10 d=1;
    #10 d=0;
    #10 d=1;
    #10 d=0;
    #10 d=1;
    #10 preset=1;
    #10 preset=0;
    #10 $finish;
  end
  initial begin
    $dumpfile("sipo_dff.vcd");
    $dumpvars(1,sipo_dff_tb);
  end
endmodule
