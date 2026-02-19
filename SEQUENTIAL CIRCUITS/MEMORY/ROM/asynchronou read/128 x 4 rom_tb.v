module rom_tb();
  reg [6:0] addr;
  reg en,clk;
  wire  [3:0]q;  
  rom dut(.*);
  initial begin
    $dumpfile("rom.vcd");
    $dumpvars(1,rom_tb);
    clk=1;
    forever #5 clk=~clk;
  end
  initial begin
    $monitor("time=%0t addr=%b en=%b  || q=%b ",$time,addr,en,q);
    en=1;addr=7'd127;
    #10 addr=7'd124;
    #10 addr=7'd1;
    #10 addr=7'd12;
    #10 addr=7'd13;
    #10 addr=7'd5;
    #10 addr=7'd78;
    #10 addr=7'd46;
    #10 en=0;addr=7'd43;
    #10 addr=7'd65;
    #10 en=1;addr=7'd32;
    #10 addr=7'd46;
    #10 addr=7'd76; 
    #10 $finish;
  end
endmodule
