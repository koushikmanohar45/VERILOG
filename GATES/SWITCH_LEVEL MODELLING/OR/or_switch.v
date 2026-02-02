module or_switch (input a,b,output y);
  supply0 gnd;
  supply1 vdd;
  wire pd1,y1;
  pmos p1(pd1,vdd,b);
  pmos p2(y1,pd1,a);
  nmos n1( y1,gnd,a);
  nmos n2( y1,gnd,b);
  pmos p3 (y,vdd,y1);
  nmos n3(y,gnd, y1);
  
endmodule
