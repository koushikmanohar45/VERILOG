module mux_16to1_tb();
  reg [15:0] I;
  reg[3:0]s;
  reg en;
  wire y;
  mux_16to1 dut(.I(I),.s(s),.en(en),.y(y));
  initial begin 
    $monitor("Time=%0t || I=%b || en= %b s=%b || Y=%b",$time,I,en,s,y);
    I=16'b1100111111110010;
    en=0;s=4'd5; #10
    en=1;s=4'd0; #10
    s=4'd1; #10
    s=4'd2; #10
    s=4'd3; #10
    s=4'd4; #10
    s=4'd5; #10
    s=4'd6; #10
    s=4'd7; #10
    s=4'd8; #10
    I=16'b1011000010101010;
    s=4'd9; #10
    s=4'd10; #10
    s=4'd11; #10
    s=4'd12; #10
    s=4'd13; #10
    s=4'd14; #10
    s=4'd15; #10
    #10 $finish;
  end
  initial begin
    $dumpfile("mux_16to1.vcd");
    $dumpvars(1,mux_16to1_tb);
  end
