module full_adder(input a,b,cin,output sum,carry);
  assign sum=a^b^cin;
  assign carry=(a&b)|(cin&(a^b));
endmodule


module multiplier(input[3:0] a,b,output[7:0] p);
  assign p=a*b;
endmodule


module divider(input[3:0] a,b,output[7:0] q);
  assign q=(b==0)?8'bxxxxxxxx:a/b;
endmodule


module ALU_4bit(
  input  [3:0] a,b,
  input  [2:0] s,
  output [7:0] out
);
  wire [7:0] add, sub, mul, div;
  wire [7:0] w_and, w_or, w_xor, w_xnor;
  wire c1,c2,c3,c4;
  wire d1,d2,d3,d4;
                 //arthmetic operation

  // ADD
  full_adder fa1(a[0],b[0],1'b0,add[0],c1);
  full_adder fa2(a[1],b[1],c1,add[1],c2);
  full_adder fa3(a[2],b[2],c2,add[2],c3);
  full_adder fa4(a[3],b[3],c3,add[3],c4);
  assign add[7:4] = {3'b000,c4};
  // SUB 
  full_adder fs1(a[0],~b[0],1'b1,sub[0],d1);
  full_adder fs2(a[1],~b[1],d1,sub[1],d2);
  full_adder fs3(a[2],~b[2],d2,sub[2],d3);
  full_adder fs4(a[3],~b[3],d3,sub[3],d4);
  assign sub[7:4] = 4'b0000;
  // multiplier
  multiplier m1(a,b,mul);
  //divider
  divider d5(a,b,div);

                  // logical operation
  assign w_and={4'b0000,a&b};
  assign w_or={4'b0000,a|b};
  assign w_xor={4'b0000,a^b};
  assign w_xnor={4'b0000,~(a^b)};
  
                  // selection
  wire s0,s1,s2,s3,s4,s5,s6,s7;

  assign s0 =~s[2]&~s[1]&~s[0];
  assign s1 =~s[2]&~s[1]&s[0];
  assign s2 =~s[2]&s[1]&~s[0];
  assign s3 =~s[2]&s[1]&s[0];
  assign s4 =s[2]&~s[1]&~s[0];
  assign s5 =s[2]&~s[1]& s[0];
  assign s6 =s[2]&s[1]&~s[0];
  assign s7 =s[2]&s[1]&s[0];
                    
  assign out =({8{s0}} & add )|({8{s1}} & sub )|({8{s2}} & mul )|
      ({8{s3}} & div )|({8{s4}} & w_and)|({8{s5}} & w_or)|({8{s6}} & w_xor)|({8{s7}} & w_xnor);

endmodule
