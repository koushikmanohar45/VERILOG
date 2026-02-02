module cla_block1(output p,g,input a,b);
  assign p=a^b;
  assign g=a&b;
endmodule

module carry_block2(
  input  [3:0] p,g,
  input cin,
  output [3:0] s,
  output [3:0] c
);
  assign c[0] =g[0]|(p[0] & cin);
  assign c[1] =g[1]|(p[1]&g[0])|(p[1]&p[0]&cin);
  assign c[2] =g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin);
  assign c[3] =g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&cin);

  assign s[0] =p[0]^cin;
  assign s[1] =p[1]^c[0];
  assign s[2] =p[2]^c[1];
  assign s[3] =p[3]^c[2];
endmodule


module carry_lookahead_adder(
  input [3:0]a,b,
  input cin, 
  output [3:0]s,
  output cout
);
  wire [3:0] p,g,c;

  cla_block1 u1(p[0],g[0],a[0],b[0]);
  cla_block1 u2(p[1],g[1],a[1],b[1]);
  cla_block1 u3(p[2],g[2],a[2],b[2]);
  cla_block1 u4(p[3],g[3],a[3],b[3]);

  carry_block2 u5(p,g,cin,s,c);

  assign cout =c[3];
endmodule
