module full_adder_using_if_tb();
  reg a,b,cin;
  wire sum,carry;
  full_adder_using_if fa(.a(a),.b(b),.cin(cin),.carry(carry),.sum(sum));
  initial begin     $monitor("T=0%t|a=%b,b=%b,cin=%b|sum=%b,carry=%b",$time,a,b,cin,sum,carry);
        a=0;b=0;cin=0;
    #10 a=0;b=0;cin=1;
    #10 a=0;b=1;cin=1;
    #10 a=0;b=1;cin=0;
    #10 a=1;b=0;cin=0;
    #10 a=1;b=0;cin=1;
    #10 a=1;b=1;cin=0;
    #10 a=1;b=1;cin=1;
    
  end
  initial begin 
    $dumpfile("full_adder_using_if.vcd");
    $dumpvars(1,full_adder_using_if_tb);
  end  
endmodule
