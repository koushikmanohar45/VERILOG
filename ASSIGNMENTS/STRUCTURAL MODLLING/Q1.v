// magnitude_comparator_2bit using AND OR NOT
module magnitude_comparator_2bit(
  input [1:0] A,B,
  output A_greater,A_lesser,equal
);
  wire W1,W2,W3,W4,W5,W6,W7,W8,W9,W10;
  //a>b
  and(W1,~B[1],A[1]);
  and(W2,~B[0],A[0]);
  or(W3,~B[1],A[1]);
  and(W4,W3,W2);
  or(A_greater,W1,W4);
  
  //a<b
  and(W5,B[1],~A[1]);
  and(W6,B[0],~A[0]);
  or(W7,B[1],~A[1]);
  and(W8,W6,W7);
  or(A_lesser,W8,W5);
  
  //a=b
  
  /*xnor(W9,A[0],B[0]);
  xnor(W10,A[1],B[1]);
  and(equal,W9,W10);*/
  
  and(W9,~B[0],~A[0],~B[1],~A[1]);
  and(W10,B[0],A[0],~B[1],~A[1]);
  and(W11,~B[0],~A[0],B[1],A[1]);
  and(W12,B[0],A[0],B[1],A[1]);
  or(equal,W9,W10,W11,W12);
endmodule
