module encoder4to2(input [3:0]D,output[1:0] y);
  assign  y =(D==4'b0001)?1'b00:((D==4'b0010)?2'b01:((D==4'b0100)?1'b10:((D==4'b1000)?2'b11:2'bxx)));
endmodule 
