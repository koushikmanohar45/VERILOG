module binary_to_gray_using_gates_tb;
  reg  [3:0] b;
  wire [3:0] g;
  bbinary_to_gray_using_gates dut (.b(b), .g(g));
  initial begin
    b = 4'b0110;
    #10 b = 4'b0011;
    #10 b = 4'b0110;
    #10 b = 4'b1100;
    #10 b = 4'b0111;
    #10 b = 4'b1110;
    #10 $finish;
  end
  initial begin
    $monitor("T=%0t | binary=%b | gray=%b",$time, b, g);
  end
initial begin
  $dumpfile("binary_to_gray_using_gates.vcd");
  $dumpvars(0,binary_to_gray_using_gates);
end
endmodule
