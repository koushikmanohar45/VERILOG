module decoder_3to8_using_gates(input [2:0] a,output [7:0]y);
  and(y[0],~a[2],~a[1],~a[0]);
  and(y[1],~a[2],~a[1],a[0]);
  and(y[2],~a[2],a[1],~a[0]);
  and(y[3],~a[2],a[1],a[0]);
  and(y[4],a[2],~a[1],~a[0]);
  and(y[5],a[2],~a[1],a[0]);
  and(y[6],a[2],a[1],~a[0]);
  and(y[7],a[2],a[1],a[0]);
 
endmodule
