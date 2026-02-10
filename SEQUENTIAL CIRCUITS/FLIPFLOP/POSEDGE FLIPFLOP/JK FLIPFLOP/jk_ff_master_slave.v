module jk_latch (input j,k,clk, output reg q);
always @(*) begin
  if (clk) begin
    case ({j,k})
      2'b00:q=q;
      2'b01:q=1'b0;
      2'b10:q=1'b1;
      2'b11:q=~q;
    endcase
  end
end
endmodule
module jk_master_slave (input j,k,clk,output q);
  wire qm;
  jk_latch master (.j(j),.k(k),.clk(clk),.q(qm));
  jk_latch slave  (.j(qm),.k(~qm),.clk(~clk),.q(q));
endmodule

