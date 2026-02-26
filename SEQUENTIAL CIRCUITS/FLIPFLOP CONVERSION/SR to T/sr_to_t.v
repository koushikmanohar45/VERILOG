module sr_ff (input s,r,clk,rst,output reg q);
  always @(posedge clk ) begin
    if (rst)
        q <= 1'b0;
    else begin
      case({s,r})
        2'b00: q<=q;
        2'b01: q<=1'b0;
        2'b10: q<=1'b1;
        2'b11: q<=1'bx;
        default: q<=q;
      endcase
  end
end
endmodule

module sr_to_t(input t,clk,rst,output q);
  sr_ff sr1(.s(t&~q),.r(t&q),.clk(clk),.rst(rst),.q(q));
endmodule
