module priority_encoder8to3_case_tb();
  reg [7:0]D;
  wire[2:0]y;
  priority_encoder8to3_case dut(.D(D),.y(y));
  integer i;  
  initial begin
    $monitor("TIME=%0t  ||D[7]=%b  D[6]=%b  D[5]=%b  D[4]=%b D[3]=%b  D[2]=%b  D[1]=%b  D[0]=%b  ||y=%b",$time,D[7],D[6],D[5],D[4], D[3],D[2],D[1], D[0],y);
    D=8'd0;#10
    D=8'd1;#10
    D=8'd2;#10
    D=8'd3;#10
    D=8'd7;#10
    D=8'd8;#10
    D=8'd20;#10
    D=8'd35;#10
    D=8'd42;#10
    D=8'd56;#10
    D=8'd100;#10
    D=8'd125;#10
    D=8'd150;#10
    D=8'd200;#10
    D=8'd255;#10
    D=8'd256;#10
    
    #10 $finish;
    end
  initial begin
    $dumpfile("priority_encoder8to3_case.vcd");
    $dumpvars(0,priority_encoder8to3_case_tb);
  end
endmodule
