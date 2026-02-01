module ha_tb;
  reg a,b;
  wire sum,carry;
  half_adder ha(.a(a),.b(b),.carry(carry),.sum(sum));
  initial begin
    a=0;b=0;
    #10 a=0;b=1;
    #10 a=1;b=0;
    #10 a=1;b=1;
  end
  initial begin 
   $monitor("T=0%t|a=%b,b=%b|sum=%b,carry=%b",$time,a,b,sum,carry);
  end  
endmodule
