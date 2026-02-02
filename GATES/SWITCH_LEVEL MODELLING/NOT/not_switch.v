module  not_switch(input a,output y);
  supply1 VDD;
  supply0 gnd;  
  nmos n1(y,gnd,a);
  pmos p1(y,VDD,a);
  endmodule
