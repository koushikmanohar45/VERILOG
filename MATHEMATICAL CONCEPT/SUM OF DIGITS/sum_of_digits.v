module sum_of_digits#(parameter N=10,B=5)
(
  input [N-1:0] n,
  output reg [B-1:0]sum
);
  
  reg [N-1:0]temp,digit;
  always@(*) begin
    temp=n;
    sum=0;
    while(temp!=0) begin
      digit=temp%10;
      temp=temp/10;
      sum=sum+digit;
    end
  end
    
endmodule
