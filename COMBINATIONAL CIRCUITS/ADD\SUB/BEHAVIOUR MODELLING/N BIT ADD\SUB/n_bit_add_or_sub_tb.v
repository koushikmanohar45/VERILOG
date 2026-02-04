module n_bit_add_or_sub_tb();
  reg [15:0]a;
  reg [15:0]b;
  reg cin;
  wire[15:0]s_or_d;
  wire cout_or_bor;
   n_bit_add_or_sub dut(.a(a),.b(b),.cin(cin),.s_or_d(s_or_d),.cout_or_bor(cout_or_bor));
  initial begin    
        a=16'b0000000011001101;b=16'b0000101010101010;cin=1'b0;
    #10 a=16'b0001010101011010;b=16'b0010000000001111;cin=1'b1;
    #10 a=16'b0000110011001100;b=16'b0110100101011001;cin=1'b0;
    #10 a=16'b0001000001000001;b=16'b1100000001000001;cin=1'b1;
    #10 a=16'b1001000000001000;b=16'b0001000000000100;cin=1'b0;
    #10 a=16'b0000010000101000;b=16'b0000010010010010;cin=1'b1;
    #10 a=16'b0000010000001100;b=16'b0000000000000100;cin=1'b0;
    #10 a=16'b0000001001001110;b=16'b0000001001001000;cin=1'b0;  
    #10 $finish;    
  end
  always@(a or b or cin) begin
    if(cin==0) begin
      $monitor(" time=%0t  ||A=%b B=%b Cin=%b ||SUM=%b Cout=%b", $time,a,b, cin,s_or_d,cout_or_bor);
    end
    else begin
      $monitor(" time=%0t  ||A=%b B=%b Cin=%b ||DIFFERENCE=%b BORROW=%b", $time,a,b, cin,s_or_d,cout_or_bor);
    end  
  end
  initial begin
    $dumpfile("n_bit_add_or_sub.vcd");
    $dumpvars;
  end
endmodule
