module binary_to_gray_tb();
  wire [0:3]g;
  reg[3:0]b;
  binary_to_gray ins(b,g);
  initial begin
    $monitor("T=0%t|binary=%b|gray=%b",$time,b,g);
    b[0]=0;b[1]= 1;b[2]=1;b[3]=0;
    #10 b=4'd0; 
    #10 b=4'd1;
    #10 b=4'd2;
    #10 b=4'd3;
    #10 b=4'd4;
    #10 b=4'd5; 
    #10 b=4'd6;
    #10 b=4'd7;
    #10 b=4'd8;
    #10 b=4'd9;
    #10 b=4'd0; 
    #10 b=4'd10;
    #10 b=4'd11;
    #10 b=4'd12;
    #10 b=4'd13;
    #10 b=4'd14; 
    #10 b=4'd15;
    
  end
  initial begin   
    $dumpfile("binary_to_gray.vcd");
    $dumpvars(0,binary_to_gray_tb);
  end
endmodule
