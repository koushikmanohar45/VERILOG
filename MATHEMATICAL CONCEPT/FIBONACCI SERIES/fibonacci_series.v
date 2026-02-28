module fibonacci_series
(
  input [3:0] N,
  output reg [31:0]out[0:15]
);
  integer i;
  always@(*) begin
    
    for (i=2;i<N;i++) begin
      out[i]=0;
    end
    
    if(N>1)begin
      out[0]=0;
      out[1]=1;  
      for (i=2;i<=N;i++) begin
        out[i]=out[i-1]+out[i-2];
      end   
    end
  end
endmodule
