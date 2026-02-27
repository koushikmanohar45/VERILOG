//full adder using half adder
module full_adder ( input a,b,cin,output sum, carry);
  wire s1,c1,c2;
  half_adder h1(.a(a),.b(b),.s(s1),.c(c1));
  half_adder h2(.a(s1),.b(cin),.s(sum),.c(c2));
  or (carry,c1,c2);
endmodule

//test bench
module full_adder_tb();
  reg a,b,cin;
  wire sum,carry;
  full_adder f(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
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
    $monitor("time=0%t|a=%b b=%b cin=%b|sum=%b carry=%b",$time,a,b,cin,sum,carry);
  end
endmodule
