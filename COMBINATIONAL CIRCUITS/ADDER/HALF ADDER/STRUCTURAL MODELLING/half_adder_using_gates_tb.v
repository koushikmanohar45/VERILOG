module half_adder_using_gates_tb();
  reg a,b;
  wire sum,carry;
  half_adder_using_gates dut(.a(a),.b(b),.sum(sum),.carry(carry));
  initial begin
    a=0;b=0;
    #10 a=0;b=1;
    #10 a=1;b=0;
    #10 a=1;b=1;
    #10 $finish;
  end
  initial begin
    $monitor(" time=%0t  ||A=%b B=%b  ||SUM=%b CARRY=%b",$time,a,b,sum,carry);
  end
  initial begin
    $dumpfile("half_adder_using_gates.vcd");
    $dumpvars(1,half_adder_using_gates_tb);
    #100
    $finish;
  end
endmodule
