module priority_encoder2to1_tb();
  reg [1:0]D;
  wire y;
  priority_encoder2to1 dut(.D(D),.y(y));
  initial begin
    $monitor("TIME=%0t  || D[1]=%b  D[0]=%b  ||y=%b",$time,D[1],D[0],y);           D=2'b00;
    #10 D=2'b01;
    #10 D=2'b10;
    #10 D=2'b11;
    #10 $finish;
  end
  initial begin
    $dumpfile("priority_encoder2to1.vcd");
    $dumpvars(0,priority_encoder2to1_tb);
  end
endmodule
