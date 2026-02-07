module half_adder_tb();
  reg a, b;
  wire sum, carry;
  half_adder_using_case dut (.a(a),.b(b),.sum(sum),.carry(carry));
  initial begin
    $monitor("T=%0t a=%b b=%b | sum=%b carry=%b",
              $time, a, b, sum, carry);

    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
    #10 $finish;
  end
  initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(1, half_adder_tb);
  end
endmodule
