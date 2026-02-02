module ripple_carry_adder_tb();
  reg[3:0] a; 
  reg[3:0]b;
  reg cin;
  wire [3:0]sum;
  wire cout;
  ripple_carry_adder dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
  initial begin 
    a[0]=0;a[1]=1;a[2]=1;a[3]=0; b[0]=1;b[1]=1;b[2]=1;b[3]=0;cin =0;
    #10  cin =1;
    #10  a[0]=1;a[3]=1;b[2]=0;b[3]=1;cin =0;
    #10  a[0]=0;a[3]=1; b[0]=0;b[1]=0;b[2]=1;b[3]=1;cin =1;
  end
  initial begin
    $monitor("time=0%t|A=%b%b%b%b B=%b%b%b%b cin=%b|sum=%b%b%b%b carry=%b",$time,a[0],a[1],a[2],a[3],b[0],b[1],b[2],b[3],cin,sum[0],sum[1],sum[2],sum[3],cout);
  end
endmodule
