module mux2to1(input i0,i1,s,en,output y);
  wire y1;
  assign y1=s?i1:i0;
  assign y= en & y1;
endmodule 
