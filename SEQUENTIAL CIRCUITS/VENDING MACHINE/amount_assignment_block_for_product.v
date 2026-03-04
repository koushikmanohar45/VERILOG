module amt_assignment#(parameter A)
(
  input[15:0]sel,
  output reg [A-1:0] y
);
  always @(*)begin
    casex(sel)
      16'B1XXXXXXXXXXXXXXX:y=5'd10;
      16'B01XXXXXXXXXXXXXX:y=5'd12;
      16'B001XXXXXXXXXXXXX:y=5'd10;
      16'B0001XXXXXXXXXXXX:y=5'd15;
      16'B00001XXXXXXXXXXX:y=5'd10;
      16'B000001XXXXXXXXXX:y=5'd20;
      16'B0000001XXXXXXXXX:y=5'd10;
      16'B00000001XXXXXXXX:y=5'd5;
      16'B000000001XXXXXXX:y=5'd10;
      16'B0000000001XXXXXX:y=5'd12;
      16'B00000000001XXXXX:y=5'd10;
      16'B000000000001XXXX:y=5'd12;
      16'B0000000000001XXX:y=5'd10;
      16'B00000000000001XX:y=5'd10;
      16'B000000000000001X:y=5'd10;
      16'B0000000000000001:y=5'd12;
      default:y=5'd0;
      endcase
  end
endmodule
