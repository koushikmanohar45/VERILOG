module add_or_sub(input[3:0]a,
                          input[3:0]b,
                          input cin,
                          output [3:0]s,
                          output cout);
  wire[2:0]c;
  wire [3:0]sel;
  assign {sel}= {b}^{4{cin}};
  assign c[0]=(a[0]&sel[0])|(a[0]&cin)|(sel[0]&cin);
  assign c[1]=(a[1]&sel[1])|(a[1]&c[0])|(sel[1]&c[0]);
  assign c[2]=(a[2]&sel[2])|(a[2]&c[1])|(sel[2]&c[1]);
  assign cout=(a[3]&sel[3])|(a[3]&c[2])|(sel[3]&c[2]);
  assign s[0]=a[0]^sel[0]^cin;
  assign s[1]=a[1]^sel[1]^c[0];
  assign s[2]=a[2]^sel[2]^c[1];
  assign s[3]=a[3]^sel[3]^c[2];
  
  
endmodule
