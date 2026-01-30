module btog_tb();
  wire [0:3]g;
  reg[3:0]b;
  binary_to_gray ins(b,g);
  initial begin
    b[0]=0;b[1]= 1;b[2]=1;b[3]=0;
    #10 b[0]=1;b[1]= 1;b[2]=0;b[3]=0; 
    #10 b[0]=0;b[1]= 1;b[2]=1;b[3]=0;
    #10 b[0]=0;b[1]= 0;b[2]=1;b[3]=1;
    #10 b[0]=1;b[1]= 1;b[2]=1;b[3]=0;
    #10 b[0]=0;b[1]= 1;b[2]=1;b[3]=1;
  end
  initial begin   $monitor("T=0%t|binary=%b%b%b%b|gray=%b%b%b%b",$time,b[3],b[2],b[1],b[0],g[3],g[2],g[1],g[0]);
  end
endmodule
