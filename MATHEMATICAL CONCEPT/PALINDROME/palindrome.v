module palindrome
(
  input  [15:0]n,
  output reg out
);
  integer temp,reverse,digit;
  always @(*) begin
    temp=n;
    reverse=0;
    while (temp!=0) begin
      digit=temp%10;
      temp=temp/10;
      reverse= reverse*10+digit;
    end

    if (reverse==n)
      out=1;
    else
      out=0;
  end
endmodule
