module nor_switch (input a,b,output y);
  supply0 gnd;
  supply1 vdd;
  wire pd1;
  pmos p1(pd1,vdd,b);
  pmos p2(y,pd1,a);
  nmos n1( y,gnd,a);
  nmos n2( y,gnd,b);
  
endmodule
