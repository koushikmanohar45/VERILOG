  module dual_port_ram(
  input [15:0] data1,data2,
  input [13:0] addr1,addr2,
  input w_e1,w_e2,clk,
  output  [15:0]q1,q2   
);
  reg [15:0] mem[16383:0];
  reg [13:0] addr_reg1;
  reg [13:0] addr_reg2;
    always @(posedge clk ) begin
    addr_reg1<=addr1;
    if(w_e1)
      mem[addr1]<=data1;
    else
      addr_reg1<=addr1;
  end
  always @(posedge clk) begin
    addr_reg2<=addr2;
    if(w_e2 && !(w_e1 && addr1==addr2)) begin  //PORT1 is given PRIORITY
      mem[addr2]<=data2;
    end
    else
      addr_reg2<=addr2;
  end     
  assign q1=mem[addr_reg1];
  assign q2=mem[addr_reg2];
endmodule
