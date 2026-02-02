module  half_adder_using_gates (input a,b,output sum,carry);
  xor(sum,a,b);
  and(carry,a,b);
endmodule
