module full_adder (input a, b ,cin, output sum, carry );
  assign sum= a^b^cin;
  assign carry=(c&(a^b))+a&b;
endmodule  
