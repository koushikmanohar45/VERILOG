module demux1to4(input y,en,input [1:0]s,output reg [3:0]I);
 always@(*) begin
   I= 4'b0000;
   if(en) begin
      case(s)
        2'b00:I[0]=y;
        2'b01:I[1]=y;
        2'b10:I[2]=y;
        2'b11:I[3]=y;
        default:I=4'bxxxx;
      endcase
   end
    else
      I=4'b0000;  
 end
endmodule
