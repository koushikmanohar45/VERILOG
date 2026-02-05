module demux1to2(input y,s,output i0,i1);
  assign i0=~s&y;
  assign i1= s&y;
endmodule 
