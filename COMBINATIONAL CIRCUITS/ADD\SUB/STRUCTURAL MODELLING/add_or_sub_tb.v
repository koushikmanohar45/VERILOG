module add_or_sub_tb();
  reg [3:0]a;
  reg [3:0]b;
  reg cin;
  wire[3:0]s;
  wire cout;
   add_or_sub dut(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
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
  always@(a or b or cin) begin
    if(cin==0) begin
      $monitor(" time=%0t  ||A=%b B=%b Cin=%b ||SUM=%b Cout=%b", $time,a,b, cin,s,cout);
    end
    else begin
      $monitor(" time=%0t  ||A=%b B=%b Cin=%b ||DIFFERENCE=%b BORROW=%b", $time,a,b, cin,s,cout);
    end  
  end
  initial begin
    $dumpfile("ripple_carry_adder.vcd");
    $dumpvars;
  end
endmodule
