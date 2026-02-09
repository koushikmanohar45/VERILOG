module piso_dff #(parameter n=4)(input [n-1:0]d,input clk,rst,preset,sel,output reg [n-1:0]q,Q);
  always @(posedge clk) begin
    if (rst) begin
      q <= {n{1'b0}};
      Q<= {n{1'b0}};
    end
    else if(preset) begin
      q<={n{1'b1}};
      Q<= {n{1'b0}};
    end  
    else begin
      if(sel) begin
        q<={1'b0,q[n-1:1]};
        Q<={q[0],Q[n-1:1]};
      end
      else
        q<=d; 
    end 
   end
endmodule
