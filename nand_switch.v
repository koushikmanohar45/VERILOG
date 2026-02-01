module nand_switch (input a,b,output y);
  supply0 gnd;
  supply1 vdd;
  wire ns1,y1;
  pmos p1(y,vdd,b);
  pmos p2(y,vdd,a);
  nmos n1( y,ns1,a);
  nmos n2( ns1,gnd,b);
endmodule
