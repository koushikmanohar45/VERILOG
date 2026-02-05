module decoder_3to8_using_gates_tb();
  reg  [2:0]a;
  wire [7:0]y;
  decoder_3to8_using_gates dut (.a(a),.y(y));
  initial begin
    $monitor("Time=%0t || a=%b || y=%b",$time,a,y);
    a = 3'b000; #10;
    a = 3'b001; #10;
    a = 3'b010; #10;
    a = 3'b011; #10;
    a = 3'b100; #10;
    a = 3'b101; #10;
    a = 3'b110; #10;
    a = 3'b111; #10;
    $finish;
  end
  initial begin
    $dumpfile("decoder_3to8_using_gates.vcd");
    $dumpvars(0,decoder_3to8_using_gates_tb);
  end
endmodule
