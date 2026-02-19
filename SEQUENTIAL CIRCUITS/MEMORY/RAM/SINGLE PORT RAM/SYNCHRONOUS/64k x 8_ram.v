module single_port_ram(
  input [7:0] data,
  input [15:0] addr,
  input w_e,clk,
  output reg [7:0]q   
);
  reg [7:0] mem[65535:0];
  always @(posedge clk) begin
    if(w_e)
      mem[addr]<=data;
    else
      q<=mem[addr];
  end
endmodule 
