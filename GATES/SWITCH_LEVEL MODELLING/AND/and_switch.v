module and_switch (input a,b,output y);
  supply0 gnd;
  supply1 vdd;
  wire ns1,y1;
  pmos p1(y1,vdd,b);
  pmos p2(y1,vdd,a);
  nmos n1( y1,ns1,a);
  nmos n2( ns1,gnd,b);
  pmos p3( y,vdd,y1);
  nmos n3(y,gnd,y1);
endmodule
