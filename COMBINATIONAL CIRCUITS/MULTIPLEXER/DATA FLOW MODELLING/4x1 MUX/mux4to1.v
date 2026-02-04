module mux4to1(input i0,i1,i2,i3,s0,s1,en,output y);
  wire w1;
  assign w1=s1?(s0?i3:i2):(s0?i1:i0);
  assign y= en & w1;
  
endmodule 
