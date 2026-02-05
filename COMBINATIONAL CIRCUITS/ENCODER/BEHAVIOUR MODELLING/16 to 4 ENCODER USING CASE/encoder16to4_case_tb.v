module encoder16to4_case_tb();
  reg [15:0]D;
  wire[3:0]y;
  encoder16to4_case dut(.D(D),.y(y));
  integer i;  
  initial begin
    $monitor("TIME=%0t  ||D[15]=%b  D[14]=%b  D[13]=%b  D[12]=%b D[11]=%b  D[10]=%b  D[9]=%b  D[8]=%b  D[7]=%b  D[6]=%b  D[5]=%b  D[4]=%b D[3]=%b  D[2]=%b  D[1]=%b  D[0]=%b  ||y=%b",$time,D[15],D[14],D[13],D[12], D[11],D[10],D[9],D[8],D[7],D[6],D[5],D[4], D[3],D[2],D[1], D[0],y);
    D = 16'b0000000000001001;#10
    D = 16'b0000001000100001;#10
    
    for (i=0;i<16;i=i+1) begin
      D = 16'b0000000000000001 << i;
      #10;
    end 
    #10 $finish;
    end
  initial begin
    $dumpfile("encoder16to4_case.vcd");
    $dumpvars(0,encoder16to4_case_tb);
  end
endmodule
