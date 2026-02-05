module priority_encoder4to2_if_tb();
  
  reg [3:0]D;
  wire[1:0] y;
  priority_encoder4to2_if dut(.D(D),.y(y));
  initial begin
    $monitor("TIME=%0t  ||D[3]=%b  D[2]=%b  D[1]=%b  D[0]=%b   ||y=%b",$time,D[3],D[2],D[1],D[0],y);         
    D=4'd0;
    #10 D=4'd1;
    #10 D=4'd2;
    #10 D=4'd3;
    #10 D=4'd4;
    #10 D=4'd5;
    #10 D=4'd6;
    #10 D=4'd7;
    #10 D=4'd8;
    #10 D=4'd9;
    #10 D=4'd10;
    #10 D=4'd11;
    #10 D=4'd12;
    #10 D=4'd13;
    #10 D=4'd14;
    #10 D=4'd15;
    #10 $finish;
  end
  initial begin
    $dumpfile("priority_encoder4to2_if.vcd");
    $dumpvars(0,priority_encoder4to2_if_tb);
  end
endmodule
