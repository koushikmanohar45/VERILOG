module siso_d_ff #(parameter n=4)(input d_sin,input clk,rst,preset,output reg q_sout);
  reg [n-1:0] q;
  always @(posedge clk) begin

    if (rst) begin
      q <= {n{1'b0}};
      q_sout<= 1'b0;
    end
    else if(preset) begin
      q<={n{1'b1}};
      q_sout<=1'b0;
    end  
    else
      q<={q[n-2:0],d_sin};
    
    q_sout<=q[n-1];
   end
endmodule
