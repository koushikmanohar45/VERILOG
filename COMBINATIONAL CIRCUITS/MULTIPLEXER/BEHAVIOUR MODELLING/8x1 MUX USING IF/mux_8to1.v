module mux_8to1(input [7:0] I,input[2:0]s,input en,output reg y);
  always@(*) begin
    if(!en) 
      y=1'b0;
    else 
      y=I[s];
  end
endmodule 
