module full_subractor(input a,b,bin,output reg d,br);
always@(*)begin
case({a,b,bin})
3'b000:{br,d}=2'b00;
3'b001:{br,d}=2'b11;
3'b010:{br,d}=2'b11;
3'b011:{br,d}=2'b10;
3'b100:{br,d}=2'b01;
3'b101:{br,d}=2'b00;
3'b110:{br,d}=2'b00;
3'b111:{br,d}=2'b11;
endcase
end
endmodule
