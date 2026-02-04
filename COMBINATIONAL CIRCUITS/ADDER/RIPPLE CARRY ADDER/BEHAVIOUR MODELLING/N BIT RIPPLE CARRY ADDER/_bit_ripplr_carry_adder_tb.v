module n_bit_ripplr_carry_adder_tb();
  reg [15:0]a;
  reg [15:0]b;
  reg cin;
  wire[15:0]s;
  wire cout;
   n_bit_ripple_carry_adder dut(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
  initial begin    
        a=16'b0000111100001111;b=16'b0000101010101010;cin=1'b0;
    #10 a=16'b0001010101011010;b=16'b0010000000001111;cin=1'b1;
    #10 a=16'b0011110011001100;b=16'b0110100101011001;cin=1'b0;
    #10 a=16'b0111000001000001;b=16'b1110000001000001;cin=1'b1;
    #10 a=16'b1111000000001000;b=16'b0001000000000100;cin=1'b0;
    #10 a=16'b0000010000101000;b=16'b0000010000010010;cin=1'b1;
    #10 a=16'b0000010000001100;b=16'b0000000000000100;cin=1'b0;
    #10 a=16'b0000000001001110;b=16'b0000001000001000;cin=1'b0;  
  end
  initial begin
    $monitor(" time=%0t  ||A=%b B=%b Cin=%b ||SUM=%b Cout=%b",$time,a,b,cin,s,cout);
  end
  initial begin
    $dumpfile("n_bit_ripple_carry_adder.vcd");
    $dumpvars;
  end
endmodule
