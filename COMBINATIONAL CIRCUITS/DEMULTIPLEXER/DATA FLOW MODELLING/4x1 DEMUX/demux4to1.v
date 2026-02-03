module demux4to1(input y,s1,s0,output i0,i1,i2,i3);
  assign i0=(~s1)&(~s0)&y;
  assign i1=(~s1)&(s0)&y;
  assign i2= (s1)&(~s0)&y;
  assign i3=(s1)&(s0)&y;
endmodule 
 
