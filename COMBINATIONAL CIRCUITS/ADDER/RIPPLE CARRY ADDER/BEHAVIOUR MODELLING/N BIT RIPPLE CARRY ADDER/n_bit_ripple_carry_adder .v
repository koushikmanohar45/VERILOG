module n_bit_ripple_carry_adder #( parameter n = 16)
  (input [n-1:0]a,input[n-1:0]b,input cin,output reg [n-1:0]s,output reg cout);
  reg [n-1:0]c;
  integer i;
  always @(a or b or cin) begin
    c[0]=cin;
     for(i=0; i< n;i++) begin
      s[i]= a[i]^b[i]^c[i];
       c[i+1]=(c[i]& a[i])|(c[i]&b[i])|(b[i]&a[i]);
    end
    cout=c[n];
  end 
endmodule 
