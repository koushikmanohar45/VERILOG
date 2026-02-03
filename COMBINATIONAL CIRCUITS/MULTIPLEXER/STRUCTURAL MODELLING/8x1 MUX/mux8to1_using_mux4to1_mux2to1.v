module mux2to1(input i0,i1,s,output y);
  assign y=s?i1:i0;
endmodule 
module mux4to1(input i0,i1,i2,i3,s0,s1,output y);
  assign y=s1?(s0?i3:i2):(s0?i1:i0);
endmodule 
module mux8to1_using_mux4to1_mux2to1(input i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,output y );
     wire y1,y2;
  mux4to1 m1(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.s0(s0),.s1(s1),.y(y1));
  mux4to1 m2(.i0(i4),.i1(i5),.i2(i6),.i3(i7),.s0(s0),.s1(s1),.y(y2));
  mux2to1 m3(.i0(y1),.i1(y2),.s(s2),.y(y));
endmodule 
