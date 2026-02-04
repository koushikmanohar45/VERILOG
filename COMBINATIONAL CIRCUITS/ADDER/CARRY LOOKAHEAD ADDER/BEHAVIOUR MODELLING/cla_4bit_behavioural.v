module cla_4bit_behavioural (
  input  [3:0]a,
  input  [3:0]b,
  input   cin,
  output reg [3:0] s,
  output reg cout
);

  reg [3:0] p,g;
  reg [4:0] c;
  always @(*) begin
    p=a^b;   
    g=a&b;  
    c[0]=cin;
    c[1]=g[0]|(p[0]&c[0]);
    c[2]=g[1]|(p[1]&g[0])|(p[1]&p[0]&c[0]);
    c[3]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&c[0]);
    c[4]=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&c[0])
    s=p^c[3:0];
    cout=c[4];
  end
endmodule
