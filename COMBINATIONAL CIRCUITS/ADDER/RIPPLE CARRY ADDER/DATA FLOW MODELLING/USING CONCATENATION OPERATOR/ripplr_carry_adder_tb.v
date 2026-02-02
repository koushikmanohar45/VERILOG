module ripplr_carry_adder_tb();
  reg [3:0]a;
  reg [3:0]b;
  reg cin;
  wire[3:0]s;
  wire cout;
   ripple_carry_adder dut(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
  initial begin    
  a=4'b0000;b=4'b0000;cin=1'b0;
    #10 a=4'b0001;b=4'b0010;cin=1'b1;
    #10 a=4'b0011;b=4'b0110;cin=1'b0;
    #10 a=4'b0111;b=4'b1110;cin=1'b1;
    #10 a=4'b1111;b=4'b0001;cin=1'b0;
    #10 a=4'b1000;b=4'b0010;cin=1'b1;
    #10 a=4'b1100;b=4'b0100;cin=1'b0;
    #10 a=4'b1110;b=4'b1000;cin=1'b0;
    #10 a=4'b1111;b=4'b0110;cin=1'b0;
    #10 a=4'b0110;b=4'b0011;cin=1'b0;
    #10 a=4'b0101;b=4'b1001;cin=1'b0;
    
     
  end
  initial begin
    $monitor(" time=%0t  ||A=%b%b%b%b B=%b%b%b%b Cin=%b ||SUM=%b%b%b%b  Cout=%b",$time,a[0],a[1],a[2],a[3],b[0],b[1],b[2],b[3],cin,s[0],s[1],s[2],s[3],cout);
  end
  initial begin
    $dumpfile("ripple_carry_adder.vcd");
    $dumpvars;
  end
endmodule
