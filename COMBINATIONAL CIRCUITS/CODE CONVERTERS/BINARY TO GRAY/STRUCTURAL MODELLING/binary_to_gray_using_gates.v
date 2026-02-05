module binary_to_gray_using_gates(input  [3:0] b,output [3:0] );
  buf  (g[3], b[3]);
  xor  (g[2], b[3], b[2]);
  xor  (g[1], b[2], b[1]);
  xor  (g[0], b[1], b[0]);
endmodule
