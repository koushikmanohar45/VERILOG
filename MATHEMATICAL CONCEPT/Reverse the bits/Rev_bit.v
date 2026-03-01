module rev_bits
(
input[31:0]n,
output reg[31:0]out
);
integer i;
always@(*)begin
 out=0;
 for(i=0;i<32;i=i+1) begin
   out[i]=n[31-i];
  end
 end
endmodule
