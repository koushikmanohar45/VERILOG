module demux2to1(input y,s,en,output i0,i1);
  assign i0=~s&y&en;
  assign i1= s&y&en;
endmodule 
module demux4to1_using_demux2to1(input y,s1,s0,output i0,i1,i2,i3);
  demux2to1 d1(.y(y),.s(s0),.en(~s1),.i0(i0),.i1(i1));
  demux2to1 d2(.y(y),.s(s0),.en(s1),.i0(i2),.i1(i3));
endmodule
