module demux1to8(input y,en,input [2:0]s,output reg [7:0]I);
  always@(*) begin
    if(en) begin  
    if(s[2]) begin
      if(s[1]) begin
        if(s[0]) 
          I[7]=y;
        else
          I[6]=y;
      end  
      else if(s[0])
          I[5]=y;
      else 
          I[4]=y;
     end
    else begin
      if(s[1]) begin
        if(s[0]) 
          I[3]=y;
        else
          I[2]=y;
       end  
      else if(s[0])
          I[1]=y;
      else 
          I[0]=y;
     end
    end
  else
    I=8'd0;
  end
    
endmodule
