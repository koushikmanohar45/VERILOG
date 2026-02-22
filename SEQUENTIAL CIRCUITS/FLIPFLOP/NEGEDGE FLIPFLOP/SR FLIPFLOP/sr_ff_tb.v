module sr_ff_tb;
reg s,r,clk,rst;
wire q;
sr_ff dut(.s(s),.r(r),.clk(clk),.rst(rst),.q(q));
initial begin
$monitor("TIME=%t  || CLK= %B  RST=%B  || S=%B  R=%B  || Q= %B",$time,clk,rst,s,r,q);
clk=0;rst=0;s=0;r=1;
#15 rst=1;
#11 s=1;r=0;
#15 s=0;r=0;
#4 rst=0;s=0;r=1;
#6 rst=1;
#15 s=1;r=1;
#10 s=0;r=1;
#20 rst=0;
#20 $finish;
end
initial begin
clk=1;
forever #5 clk=~clk;
end
initial begin
$dumpfile("sr_ff.vcd");
$dumpvars(1,sr_ff_tb);
end
endmodule
