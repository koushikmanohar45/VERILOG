module half_subractor(input a,b,output reg d,br);
always@(*)begin
case({a,b})
2'b00:{br,d}=2'b00;
2'b01:{br,d}=2'b11;
2'b10:{br,d}=2'b01;
2'b11:{br,d}=2'b00;
endcase
end
endmodule
