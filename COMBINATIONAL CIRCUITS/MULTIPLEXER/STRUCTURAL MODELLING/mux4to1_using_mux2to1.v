module mux2to1(input i0,i1,s,output y);
  assign y=s?i1:i0;
endmodule 
module mux4to1_using_mux2to1(input i0,i1,i2,i3,s0,s1,output y );
     wire y1,y2;
     mux2to1 m1(.i0(i0),.i1(i1),.s(s0),.y(y1));
     mux2to1 m2(.i0(i2),.i1(i3),.s(s0),.y(y2));
     mux2to1 m3(.i0(y1),.i1(y2),.s(s1),.y(y));
endmodule 
