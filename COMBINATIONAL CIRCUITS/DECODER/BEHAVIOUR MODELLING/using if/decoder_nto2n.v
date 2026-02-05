module decoder_nto2n #(parameter in=4,out=16)(input [in-1:0] a,output reg [out-1:0]y);
  always@(*) begin
    y={out{1'b0}};
    if(a<out)
      y[a]=1'b1;
    else
      y={out{1'bx}};
  end
endmodule
