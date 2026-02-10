module d_latch (input d,clk, output reg q);
always @(*) begin
  if (clk)
    q=d;
end
endmodule

module d_master_slave (input d,clk,output q);
  wire qm;
  d_latch master (.d(d),.clk(clk),.q(qm));
  d_latch slave  (.d(qm),.clk(~clk),.q(q));
endmodule
