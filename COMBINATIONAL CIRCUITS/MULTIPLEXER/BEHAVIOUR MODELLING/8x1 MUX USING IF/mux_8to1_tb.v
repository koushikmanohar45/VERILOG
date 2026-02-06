module mux_8to1_tb ;
  reg [7:0] I;
  reg[2:0]s;
  reg en;
  wire y;
  mux_8to1 dut(.I(I),.s(s),.en(en),.y(y));
  initial begin 
    $monitor("Time=%0t || I=%b || en= %b s=%b || Y=%b",$time,I,en,s,y);
     I=8'b01001111;
    en=0;s=3'b111; #10
    en=1;s=3'b000; #10
    s=3'b001; #10
    s=3'b010; #10
    s=3'b011; #10
    I=8'b10110000;
    s=3'b100; #10
    s=3'b101; #10
    s=3'b110; #10
    s=3'b111; #10
    #10 $finish;
  end
  initial begin
    $dumpfile("mux_8to1.vcd");
    $dumpvars(1,mux_8to1_tb);
  end
endmodule
