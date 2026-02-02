module  xnor_switch(input a,b,output y);
  supply1 VDD;
  supply0 gnd;
  wire ns1,pd1,pd2,y1;
  nmos n1(y1,ns1,a);
  nmos n2(y1,ns1,~b);
  nmos n3(ns1,gnd,~a);
  nmos n4(ns1,gnd,b);
  pmos p1(y1,pd1,~b);
  pmos p2(y1,pd2,b);
  pmos p3(pd1,VDD,a);
  pmos p4(pd2,VDD,~a);
  
  nmos n5(y,gnd,y1);
  pmos p5(y,VDD,y1);
  endmodule
