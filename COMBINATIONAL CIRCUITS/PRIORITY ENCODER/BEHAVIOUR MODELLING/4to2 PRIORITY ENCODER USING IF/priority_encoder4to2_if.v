module priority_encoder4to2_if(input [3:0]D,output reg [1:0] y);
  always @(*) begin 
    if(D[3])
      y=2'b11;
    else if(D[2])
      y=2'b10;
    else if(D[1])
       y=2'b01;
    else if(D[0])
       y=2'b00;
    else
      y=2'bxx;
  end
endmodule 
