module mux_16to1(input [15:0] I,input[3:0]s,input en,output reg y);
  always@(*) begin
    if(!en)
      y=1'b0;
    else begin
    case (s)  
      4'd0: y= I[0];
      4'd1: y= I[1];
      4'd2: y= I[2];
      4'd3: y= I[3];
      4'd4: y= I[4];
      4'd5: y= I[5];
      4'd6: y= I[6];
      4'd7: y= I[7];
      4'd8: y= I[8];
      4'd9: y= I[9];
      4'd10: y= I[10];
      4'd11: y= I[11];
      4'd12: y= I[12];
      4'd13: y= I[13];
      4'd14: y= I[14];
      4'd15: y= I[15];
      default: y=1'bx;
      endcase
   end
  end
endmodule 
