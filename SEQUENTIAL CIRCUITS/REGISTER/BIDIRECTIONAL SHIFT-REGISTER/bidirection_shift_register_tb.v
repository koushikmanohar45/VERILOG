module  bidirection_shiftregister_tb();
  reg sin_r,sin_l,clk,rst,preset;
  reg [1:0]sel;
  wire [3:0]Q;
  bidirection_shiftregister dut(.*);
  always #5 clk=~clk;
  initial begin
    $monitor("TIME=%0t || clk=%b rst=%b preset=%b || sel=%b sin_r=%b sin_l=%b Q=%B",$time,clk,rst,preset,sel,sin_l,sin_r,Q);
    clk=1;rst=1;preset=0;sin_l=1;sin_r=1;sel=2'b01;
    #10 sin_l=1;sin_r=1;rst=0;preset=1;
    #10 sin_l=0;sin_r=1;sel=2'b10;preset=0;
    #10 sin_l=0;sin_r=0;
    #10 sin_l=0;sin_r=1;
    #10 sin_l=1;sin_r=0;
    #10 sin_l=1;sin_r=1;
    #10 sin_l=0;sin_r=0;
    #10 sin_l=0;sin_r=1;
    #10 sin_l=1;sin_r=0;
    #10 sin_l=1;sin_r=1;
    #10 sin_l=0;sin_r=0;
    #10 sin_l=0;sin_r=1;
    #10 sin_l=1;sin_r=0;
    #10 sin_l=1;sin_r=1;sel=2'b01;
    #10 sin_l=0;sin_r=0;
    #10 sin_l=0;sin_r=1;
    #10 sin_l=1;sin_r=0;
    #10 sin_l=1;sin_r=1;
    #10 sin_l=0;sin_r=0;
    #10 sin_l=0;sin_r=1;
    #10 sin_l=1;sin_r=0;
    #10 sin_l=1;sin_r=1;
    #10 $finish;
  end
  initial begin
    $dumpfile("bidirection_shiftregister.vcd");
    $dumpvars(1,bidirection_shiftregister_tb);
  end 
endmodule    
    
