module ripple_carry_adder(input [3:0]a,
                          input[3:0]b,
                          input cin,
                          output[3:0]sum,
                          output cout);
  wire c[2:0];
  full_adder f1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.carry(c[0]));
  full_adder f2(.a(a[1]),.b(b[1]),.cin(c[0]),.sum(sum[1]),.carry(c[1]));
  full_adder f3(.a(a[2]),.b(b[2]),.cin(c[1]),.sum(sum[2]),.carry(c[2]));
  full_adder f4(.a(a[3]),.b(b[3]),.cin(c[2]),.sum(sum[3]),.carry(cout));
endmodule
