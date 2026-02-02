module  full_subractor (input a,b,bin,output d,br);
  assign d=a^b^bin;
  assign br=((~a)&b)|((~(a^b))&bin) ;
endmodule
