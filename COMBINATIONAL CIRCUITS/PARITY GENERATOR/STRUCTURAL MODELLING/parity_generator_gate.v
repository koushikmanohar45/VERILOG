module parity_generator_gate(input [2:0] x,output p);
  xor (p,x[2],x[1],x[0]);
endmodule
