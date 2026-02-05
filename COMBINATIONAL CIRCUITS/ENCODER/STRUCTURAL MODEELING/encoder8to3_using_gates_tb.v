module encoder8to3_using_gates_tb();
  reg [7:0]D;
  wire[2:0]y;
  encoder8to3_using_gates dut(.D(D),.y(y));
  integer i;  
  initial begin
    $monitor("TIME=%0t  ||D[7]=%b  D[6]=%b  D[5]=%b  D[4]=%b D[3]=%b  D[2]=%b  D[1]=%b  D[0]=%b  ||y=%b",$time,D[7],D[6],D[5],D[4], D[3],D[2],D[1], D[0],y);
    
  for (i=0;i<8;i=i+1) begin
      D = 8'b00000001 << i;
      #10;
    end 
    #10 $finish;
    end
  initial begin
    $dumpfile("encoder4to2.vcd");
    $dumpvars(0,encoder8to3_using_gates_tb);
  end
endmodule
