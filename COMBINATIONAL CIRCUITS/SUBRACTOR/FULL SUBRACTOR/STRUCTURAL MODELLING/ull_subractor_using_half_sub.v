module  half_subractor (input a,b,output d,br);
  assign d=a^b;
  assign br=(~a)&b;
endmodule


module  full_subractor_using_half_sub (input a,b,bin,output d,br);
  wire d1,br1,br2;
  half_subractor h1(.a(a),.b(b),.d(d1),.br(br1));
  half_subractor h2(.a(d1),.b(bin),.d(d),.br(br2));
  or (br,br1,br2);
endmodule
