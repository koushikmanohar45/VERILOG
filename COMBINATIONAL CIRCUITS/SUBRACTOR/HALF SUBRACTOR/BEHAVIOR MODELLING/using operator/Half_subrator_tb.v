module half_subractor_tb();
reg a,b;
wire d,br;
half_subractor dut(.a(a),.b(b),.d(d),.br(br));
initial begin
a=0;b=0;
#10 a=0;b=1;
#10 a=1;b=0;
#10 a=1;b=1;
#10 $finish;
end
initial begin
$monitor("time=%0t A=%b B=%b D=%b Br=%b",$time,a,b,d,br);
end
endmodule
