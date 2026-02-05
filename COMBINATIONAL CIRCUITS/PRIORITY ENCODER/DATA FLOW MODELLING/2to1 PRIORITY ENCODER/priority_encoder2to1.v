module priority_encoder2to1(input [1:0]D,output reg y);
  assign y=D[1]?(D[0]?1'b1:1'b1):(D[0]?1'b0:1'bx); 
endmodule 
