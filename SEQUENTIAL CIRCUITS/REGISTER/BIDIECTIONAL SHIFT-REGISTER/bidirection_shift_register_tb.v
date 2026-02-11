module  bidirection_shift_register_tb();
  reg sin,clk,rst,preset;
  reg [1:0] sel;
  wire [3:0]Q;
  bidirection_shiftregister dut(.*);
  always #5 clk=~clk;
  initial begin
    $monitor("TIME=%0t || clk=%b rst=%b preset=%b || sel=%b din=%b",$time,clk,rst,preset,sel,sin);
    clk=1;rst=1;preset=0;sin=1;sel=01;
    #10 sin=0;rst=0;
    #10 sin=1;
    #10 sin=0;
    #10 sin=1;
    #10 sin=1;
    #10 sin=1;
    #10 sin=0;sel=10;
    #10 sin=1;
    #10 sin=0;
    #10 sin=0;
    #10 sin=1;
    #10 preset=1; sin=0;
    #10 $finish;
  end
  initial begin
    $dumpfile("bidirection_shiftregister.vcd");
    $dumpvars(1,bidirection_shift_register_tb);
  end 
endmodule 
