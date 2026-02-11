module  universal_shiftregister_tb();
  reg sin_r,sin_l,clk,rst,preset;
  reg [3:0]p_in;
  reg [1:0]sel;
  wire [3:0]Q;
  universal_shiftregister dut(.*);
  always #5 clk=~clk;
  initial begin
    $monitor("TIME=%0t || clk=%b rst=%b preset=%b || sel=%b sin_r=%b sin_l=%b p_in=%b ",$time,clk,rst,preset,sel,sin_l,sin_r,p_in);
    clk=1;rst=1;preset=0;sin_l=1;sin_r=1;sel=2'b01;
    #10 sin_l=1;sin_r=1;p_in=4'b0001;rst=0;preset=1;
    #10 sin_l=0;sin_r=1;p_in=4'b0011;sel=2'b00;preset=0;
    #10 sin_l=0;sin_r=0;p_in=4'b0111;
    #10 sin_l=0;sin_r=1;p_in=4'b1111;
    #10 sin_l=1;sin_r=0;p_in=4'b0000;
    #10 sin_l=1;sin_r=1;p_in=4'b1000;
    #10 sin_l=0;sin_r=1;p_in=4'b1100;sel=2'b01;
    #10 sin_l=1;sin_r=0;p_in=4'b1110;
    #10 sin_l=1;sin_r=0;p_in=4'b1010;
    #10 sin_l=0;sin_r=1;p_in=4'b1001;
    #10 sin_l=1;sin_r=0;p_in=4'b0101;
    #10 sin_l=0;sin_r=1;p_in=4'b0011;
    #10 sin_l=0;sin_r=0;p_in=4'b0111;sel=2'b10;
    #10 sin_l=0;sin_r=1;p_in=4'b1111;
    #10 sin_l=1;sin_r=0;p_in=4'b0000;
    #10 sin_l=1;sin_r=1;p_in=4'b1000;
    #10 sin_l=0;sin_r=1;p_in=4'b1100;
    #10 sin_l=1;sin_r=0;p_in=4'b1110;sel=2'b11;
    #10 sin_l=1;sin_r=0;p_in=4'b1010;
    #10 sin_l=0;sin_r=1;p_in=4'b1001;
    #10 sin_l=1;sin_r=0;p_in=4'b0101;
    #10 $finish;
  end
  initial begin
    $dumpfile("universal_shiftregister.vcd");
    $dumpvars(1,universal_shiftregister_tb);
  end 
endmodule    
    
