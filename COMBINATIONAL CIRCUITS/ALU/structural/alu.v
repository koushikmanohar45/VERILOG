module full_adder (input a, b ,cin, output sum, carry );
  assign sum= a^b^cin;
  assign carry=(cin&(a^b))|a&b;
endmodule 

module multiplier #(parameter n)(input[n-1:0] a,b,output[2*n-1:0]p);
  assign p=a*b;
endmodule

module divider #(parameter n)(input [n-1:0]a,b,output [n-1:0]Q);
  assign Q=(b==0)? 1'bx:a/b;
endmodule
  
module Alu_4bit(
  input [3:0] a,b,
  input[2:0] s,
  output [7:0] out
);
  
  wire [7:0]w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11;
  wire s0,s1,s2,s3,s4,s5,s6,s7;
  wire [7:0]w12,w13,w14,w15,w16,w17,w18,w19;
  
                               // arthmetic operations
  // add
  full_adder f1(.a(a[0]),.b(b[0]^1'b0),.cin(1'b0),.sum(w1[0]),.carry(w2[0]));
  full_adder f2(.a(a[1]),.b(b[1]^1'b0),.cin(w2[0]),.sum(w1[1]),.carry(w2[1]));
  full_adder f3(.a(a[2]),.b(b[2]^1'b0),.cin(w2[1]),.sum(w1[2]),.carry(w2[2]));
  full_adder f4(.a(a[3]),.b(b[3]^1'b0),.cin(w2[2]),.sum(w1[3]),.carry(w2[3]));
  assign w3={3'b000,w2[3],w1[3],w1[2],w1[1],w1[0]};
  //sub
  full_adder f5(.a(a[0]),.b(b[0]^1'b1),.cin(1'b1),.sum(w4[0]),.carry(w5[0]));
  full_adder f6(.a(a[1]),.b(b[1]^1'b1),.cin(w5[0]),.sum(w4[1]),.carry(w5[1]));
  full_adder f7(.a(a[2]),.b(b[2]^1'b1),.cin(w5[1]),.sum(w4[2]),.carry(w5[2]));
  full_adder f8(.a(a[3]),.b(b[3]^1'b1),.cin(w5[2]),.sum(w4[3]),.carry(w5[3]));
  assign w4[7:4]=4'b0000;

  // mul
  multiplier #(.n(4)) m1 (.a(a),.b(b),.p(w6));
  //div
  divider #(.n(4)) d1 (.a(a),.b(b),.Q(w7));
  assign w7[7:4]=4'b0000;
                                 // logical operations
  // and
  and(w8[0],a[0],b[0]);
  and(w8[1],a[1],b[1]);
  and(w8[2],a[2],b[2]);
  and(w8[3],a[3],b[3]);
  //or
  or(w9[0],a[0],b[0]);
  or(w9[1],a[1],b[1]);
  or(w9[2],a[2],b[2]);
  or(w9[3],a[3],b[3]);
  //xor
  xor(w10[0],a[0],b[0]);
  xor(w10[1],a[1],b[1]);
  xor(w10[2],a[2],b[2]);
  xor(w10[3],a[3],b[3]);
  //xnor
  xnor(w11[0],a[0],b[0]);
  xnor(w11[1],a[1],b[1]);
  xnor(w11[2],a[2],b[2]);
  xnor(w11[3],a[3],b[3]);
  
  assign w8[7:4]  = 4'b0000;
  assign w9[7:4]  = 4'b0000;
  assign w10[7:4] = 4'b0000;
  assign w11[7:4] = 4'b0000;
  
                             // selction
  and(s0,~s[0],~s[1],~s[2]);
  and(s1,~s[0],~s[1],s[2]);
  and(s2,~s[0],s[1],~s[2]);
  and(s3,~s[0],s[1],s[2]);
  and(s4,s[0],~s[1],~s[2]);
  and(s5,s[0],~s[1],s[2]);
  and(s6,s[0],s[1],~s[2]);
  and(s7,s[0],s[1],s[2]);
  
  and(w12[0],w3[0],s0);
  and(w12[1],w3[1],s0);
  and(w12[2],w3[2],s0);
  and(w12[3],w3[3],s0);
  and(w12[4],w3[4],s0);
  
  and(w13[0],w4[0],s1);
  and(w13[1],w4[1],s1);
  and(w13[2],w4[2],s1);
  and(w13[3],w4[3],s1);
  
  and(w14[0],w6[0],s2);
  and(w14[1],w6[1],s2);
  and(w14[2],w6[2],s2);
  and(w14[3],w6[3],s2);
  and(w14[4],w6[4],s2);
  and(w14[5],w6[5],s2);
  and(w14[6],w6[6],s2);
  and(w14[7],w6[7],s2);
  
  and(w15[0],w7[0],s3);
  and(w15[1],w7[1],s3);
  and(w15[2],w7[2],s3);
  and(w15[3],w7[3],s3);
  
  and(w16[0],w8[0],s4);
  and(w16[1],w8[1],s4);
  and(w16[2],w8[2],s4);
  and(w16[3],w8[3],s4);
  
  and(w17[0],w9[0],s5);
  and(w17[1],w9[1],s5);
  and(w17[2],w9[2],s5);
  and(w17[3],w9[3],s5);
  
  and(w18[0],w10[0],s6);
  and(w18[1],w10[1],s6);
  and(w18[2],w10[2],s6);
  and(w18[3],w10[3],s6);
  
  and(w19[0],w11[0],s7);
  and(w19[1],w11[1],s7);
  and(w19[2],w11[2],s7);
  and(w19[3],w11[3],s7);
  
  assign w12[7:5] = 3'b000;
  assign w13[7:4] = 4'b0000;
  assign w15[7:4] = 4'b0000;
  assign w16[7:4] = 4'b0000;
  assign w17[7:4] = 4'b0000;
  assign w18[7:4] = 4'b0000;
  assign w19[7:4] = 4'b0000;
  
 
 
  or(out[0],w12[0],w13[0],w14[0],w15[0],w16[0],w17[0],w18[0],w19[0]);
  or(out[1],w12[1],w13[1],w14[1],w15[1],w16[1],w17[1],w18[1],w19[1]);
  or(out[2],w12[2],w13[2],w14[2],w15[2],w16[2],w17[2],w18[2],w19[2]);
  or(out[3],w12[3],w13[3],w14[3],w15[3],w16[3],w17[3],w18[3],w19[3]);
  or(out[4],w12[4],w13[4],w14[4],w15[4],w16[4],w17[4],w18[4],w19[4]);
  or(out[5],w12[5],w13[5],w14[5],w15[5],w16[5],w17[5],w18[5],w19[5]);
  or(out[6],w12[6],w13[6],w14[6],w15[6],w16[6],w17[6],w18[6],w19[6]);
  or(out[7],w12[7],w13[7],w14[7],w15[7],w16[7],w17[7],w18[7],w19[7]);
  
endmodule
  
