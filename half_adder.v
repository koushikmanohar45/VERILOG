module half_adder(input a,b, output s,c);
  assign sum= a^b;
  assign carry= a&b;
endmodule  
  
