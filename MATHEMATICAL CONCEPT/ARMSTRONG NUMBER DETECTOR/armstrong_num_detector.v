module armstrong_num
(
  input [9:0] n,
  output reg out
);
  
  reg [9:0]temp,digit,sum;
  always@(*) begin
    temp=n;
    sum=0;
    while(temp!=0) begin
      digit=temp%10;
      temp=temp/10;
      sum=sum+(digit*digit*digit);
    end
    if(sum==n)
      out=1;
    else
      out=0;
  end
endmodule
