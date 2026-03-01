module rev_digits(
input[31:0]n,
output reg[31:0]out
);
reg[31:0]temp,digit;
always@(*)begin
  temp=n;out=0;
  while(temp!=0)begin
     digit=temp%10;
     out=(out*10)+digit;
     temp=temp/10;
   end
 end
endmodule
