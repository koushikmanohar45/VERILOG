module bcd_8421_to_5421(input  [3:0] bcd_8421,output reg [3:0] bcd_5421);
    always @(*) begin
      if (bcd_8421 < 5)
            bcd_5421 = bcd_8421;
        else
            bcd_5421 = bcd_8421 + 4'b011;
    end
endmodule
