module encoder16to4_case(input [15:0]D,output reg [3:0] y);
  always @(*) begin 
    case(D)
      16'd1:  y=4'b0000;
      16'd2:  y=4'b0001;
      16'd4:  y=4'b0010;
      16'd8:  y=4'b0011;
      16'd16: y=4'b0100;
      16'd32: y=4'b0101;
      16'd64: y=4'b0110;
      16'd128:y=4'b0111;
      16'd256:y=4'b1000;
      16'd512:y=4'b1001;
      16'd1024:y=4'b1010;
      16'd2048:y=4'b1011;
      16'd4096:y=4'b1100;
      16'd8192:y=4'b1101;
      6'd16384:y=4'b1110;
      16'd32768:y=4'b1111;
      default:y=4'bxxxx;
    endcase
  end
endmodule
