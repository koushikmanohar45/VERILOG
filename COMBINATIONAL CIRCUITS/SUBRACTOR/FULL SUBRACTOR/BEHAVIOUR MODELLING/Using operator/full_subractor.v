module full_subractor_tb();
reg a,b,bin;
wire d,br;
full_subractor dut(.a(a),.b(b),.bin(bin),.d(d),.br(br));
initial begin
a=0;b=0;bin=0;
#10 a=0;b=0;bin=1;
#10 a=0;b=1;bin=0;
#10 a=0;b=1;bin=1;
#10 a=1;b=0;bin=0;
#10 a=1;b=0;bin=1;
#10 a=1;b=1;bin=0;
#10 a=1;b=1;bin=1;
#10 $finish;
end
initial begin
$monitor("time=%0t A=%b B=%b Bin=%b D=%b Br=%b",$time,a,b,bin,d,br);
end
endmodule
