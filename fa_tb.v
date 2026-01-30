module fa_tb;
  reg a,b,cin;
  wire sum,carry;
  full_adder fa(.a(a),.b(b),.cin(cin),.carry(carry),.sum(sum));
  initial begin
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
   $monitor("T=0%t|a=%b,b=%b,cin=%b|sum=%b,carry=%b",$time,a,b,cin,sum,carry);
  end  
endmodule
