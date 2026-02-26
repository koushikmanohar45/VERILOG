module jk_ff (input j,k,clk,rst,output reg q);
  always @(posedge clk ) begin
    if (rst)
        q <= 1'b0;
    else begin
      case({j,k})
        2'b00: q<=q;
        2'b01: q<=1'b0;
        2'b10: q<=1'b1;
        2'b11: q<=~q;
        default: q<=1'bx;
      endcase
  end
end
endmodule

module jk_to_sr(input s,r,clk,rst,output q);
  wire jin, rin;
  assign jin=(s&r)?1'bx:s;
  assign kin=(s&r)?1'bx:r;
  jk_ff t1(.j(jin),.k(kin),.clk(clk),.rst(rst),.q(q));
endmodule
