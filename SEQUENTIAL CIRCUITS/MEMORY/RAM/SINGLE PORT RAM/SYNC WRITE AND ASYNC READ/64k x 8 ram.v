module single_port_ram(
  input [7:0] data,
  input [15:0] addr,
  input w_e,clk,
  output reg [7:0]q   
);
  reg [7:0] mem[65535:0];
  reg [15:0] addr_reg;
  always @(posedge clk) begin
    if(w_e)
      mem[addr]<=data;
    else
      addr_reg<=addr;
  end
  assign q=mem[addr_reg];
endmodule 
