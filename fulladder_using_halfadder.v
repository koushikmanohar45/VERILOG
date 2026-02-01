module full_adder ( input a,b,cin,output sum, carry);
  wire s1,c1,c2;
  half_adder h1(.a(a),.b(b),.s(s1),.c(c1));
  half_adder h2(.a(s1),.b(cin),.s(sum),.c(c2));
  or (carry,c1,c2);
endmodule
