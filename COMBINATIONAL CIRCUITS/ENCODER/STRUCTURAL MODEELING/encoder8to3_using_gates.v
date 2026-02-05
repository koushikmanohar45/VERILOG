module encoder8to3_using_gates(input [7:0]D,output[2:0] y);
  or(y[2],D[4],D[5],D[6],D[7]);
  or(y[1],D[2],D[3],D[6],D[7]);
  or(y[0],D[1],D[3],D[5],D[7]);
endmodule 
