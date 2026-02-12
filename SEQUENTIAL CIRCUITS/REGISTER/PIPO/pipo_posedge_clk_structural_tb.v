module pipo_dff_tb;
  reg[3:0] pin;
  reg clk,rst,preset;
  wire[3:0] pout;
  pipo_dff dut (.pin(pin),.clk(clk),.rst(rst),.pout(pout),.preset(preset));
    initial begin
      $monitor("TIME=%0t  || CLK= %B  RST=%B PRESET=%B  || PIN=%B  || POUT= %B",$time,clk,rst,preset,pin ,pout);
        rst=1;preset=0;pin=4'b0001;
        #15 rst=0; 
        #10 pin=4'b1100;
        #10 pin=4'b1100;
        #10 pin=4'b1110;
        #10 pin=4'b1111;
        #10 pin=4'b0111;
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
