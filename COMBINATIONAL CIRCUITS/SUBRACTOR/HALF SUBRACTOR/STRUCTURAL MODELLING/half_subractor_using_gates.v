module  half_subractor_using_gates (input a,b,output d,br);
  wire y;
  xor(d,a,b);
  not(y,a);
  and(br,y,b);
endmodule
