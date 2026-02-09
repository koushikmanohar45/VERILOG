module pipo_dff_tb;
  reg[0:3] d;
  reg clk,rst,preset;
  wire[0:3] q;
  pipo_dff dut (.d(d),.clk(clk),.rst(rst),.q(q),.preset(preset));
    initial begin
      $monitor("TIME=0%t  || CLK= %B  RST=%B PRESET=%B  || D=%B  || Q= %B",$time,clk,rst,preset,d,q);
        rst=1;preset=0;d=4'b0001;
        #15 rst=0; 
        #10 d=4'b1100;
        #10 d=4'b1100;
        #10 d=4'b1110;
        #10 d=4'b1111;
        #10 d=4'b0111;
        #10 preset=1;
        #10 $finish;
    end
  initial begin
     clk=1;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("pipo_dff.vcd");
    $dumpvars(1,pipo_dff_tb);
  end

endmodule
