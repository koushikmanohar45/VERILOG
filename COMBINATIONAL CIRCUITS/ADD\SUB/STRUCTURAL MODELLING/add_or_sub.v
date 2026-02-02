module full_adder (input a, b ,cin, output sum, carry );
  assign sum= a^b^cin;
  assign carry=(cin&(a^b))|a&b;
endmodule 
module add_or_sub(input[3:0]a,
                          input[3:0]b,
                          input cin,
                          output [3:0]s,
                          output cout);
  wire[2:0]c;
  wire [3:0]sel;
  assign {sel}= {b}^{4{cin}};
  full_adder fa1 (.a(a[0]),.b(sel[0]),.cin(cin),.sum(s[0]),.carry(c[0]));
  full_adder fa2 (.a(a[1]),.b(sel[1]),.cin(c[0]),.sum(s[1]),.carry(c[1]));
  full_adder fa3 (.a(a[2]),.b(sel[2]),.cin(c[1]),.sum(s[2]),.carry(c[2]));
  full_adder fa4 (.a(a[3]),.b(sel[3]),.cin(c[2]),.sum(s[3]),.carry(cout));
endmodule
  
