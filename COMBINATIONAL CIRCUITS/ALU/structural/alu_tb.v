module ALU_4bit_tb();
  reg [3:0]a,b;
  reg [2:0]s;
  wire [7:0]out;
  integer i;
  ALU_4bit dut(.*);
  initial begin
    for (i=0;i<2048;i=i+1) begin
      {s,a,b}=i[10:0]; 
      #10;
    end
  end
  initial begin
    $dumpfile("A_4bit.vcd");
    $dumpvars(1, ALU_4bit_tb);
    $monitor("time=%0t  s=%b  a=%b  b=%b  out=%b",$time,s,a,b,out);
  end
endmodule
