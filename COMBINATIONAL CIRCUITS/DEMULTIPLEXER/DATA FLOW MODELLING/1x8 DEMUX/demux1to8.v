module demux8to1(input y,s2,s1,s0,output i0,i1,i2,i3,i4,i5,i6,i7);
  assign i0=(~s2)&(~s1)&(~s0)&y;
  assign i1=(~s2)&(~s1)&(s0)&y;
  assign i2=(~s2)&(s1)&(~s0)&y;
  assign i3=(~s2)&(s1)&(s0)&y;
  assign i4=(s2)&(~s1)&(~s0)&y;
  assign i5=(s2)&(~s1)&(s0)&y;
  assign i6=(s2)&(s1)&(~s0)&y;
  assign i7=(s2)&(s1)&(s0)&y;
endmodule 
