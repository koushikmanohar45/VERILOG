module parity_generator_gate_tb;
reg[2:0]x;
wire p;
integer i;
parity_generator_gate dut(x,p);
initial begin
$dumpfile("parity.vcd");
$dumpvars(0);
for(i=0;i<8;i=i+1)begin
   x=i;
   #10;
 end
$finish;
 end
endmodule
