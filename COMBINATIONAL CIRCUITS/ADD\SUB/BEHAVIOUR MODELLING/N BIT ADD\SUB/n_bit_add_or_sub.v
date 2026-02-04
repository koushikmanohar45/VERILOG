module n_bit_add_or_sub #(parameter n= 16)
  (
  input[n-1:0]a,
  input[n-1:0]b,
  input cin, 
    output  reg [n-1:0]s_or_d,
  output reg cout_or_bor
  );
  reg[n:0]c;
  reg [n-1:0] sel;
  integer i;
  always @(*) begin
    sel =b^{n{cin}};
    c[0] =cin;
    for (i=0;i<n;i=i+1) begin
      s_or_d[i]= a[i]^sel[i]^c[i];
      c[i+1]   =(a[i]&sel[i])|(c[i]&a[i])|(c[i]&sel[i]);
    end
    cout_or_bor = c[n];
  end

endmodule
