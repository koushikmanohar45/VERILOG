module parity_generator_tb;
reg[2:0]x;
wire even_p,odd_p;
parity_generator dut(.*);
initial begin
$dumpfile("parity.vcd");
$dumpvars(0,parity_generator_tb);
$monitor("X=%b even=%b odd=%b",x,even_p,odd_p);
x=3'b000;
#10 x=3'b001;
#10 x=3'b010;
#10 x=3'b011;
#10 x=3'b100;
#10 x=3'b101;
#10 x=3'b110;
#10 x=3'b111;
#10 $finish;
end
endmodule

