module decoder_4to16(input [3:0] a,output reg [15:0]y);
  always@(*) begin
    case(a)
      4'd0: y=16'd1;
      4'd1: y=16'd2;
      4'd2: y=16'd4;
      4'd3: y=16'd8;
      4'd4: y=16'd16;
      4'd5: y=16'd32;
      4'd6: y=16'd64;
      4'd7: y=16'd128;
      4'd8: y=16'd256;
      4'd9: y=16'd512;
      4'd10:y=16'd1024;
      4'd11:y=16'd2048;
      4'd12:y=16'd4096;
      4'd13:y=16'd8192;
      4'd14:y=16'd16384;
      4'd15:y=16'd32768;
      default:y=16'bxxxxxxxxxxxxxxxx;
    endcase
  end
endmodule
