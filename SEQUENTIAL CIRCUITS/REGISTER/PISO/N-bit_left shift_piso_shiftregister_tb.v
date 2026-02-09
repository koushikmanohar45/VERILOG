module piso_dff_tb();
  reg[3:0] d;
  reg clk,rst,preset,sel;
  wire[3:0] q,Q;
  piso_dff dut (.*);
    initial begin
      $monitor("TIME=%0t  || CLK= %B  RST=%B PRESET=%B SEL=%B || D=%B  || q= %B ||Q=%b",$time,clk,rst,preset,,sel,d,q,Q);
        rst=1;preset=0;sel=0;d=4'b0001;
        #40 rst=0;
        #10 sel=1;
        #40 sel=0;d=4'b1100;
        #40 sel=1;
        #40 d=4'b1110;
        #40 sel=0;
        #40 sel=1;d=4'b0111;
        #40 preset=1;
        #40 $finish;
    end
  initial begin
     clk=1;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("piso_dff.vcd");
    $dumpvars(1,piso_dff_tb);
  end

endmodule
