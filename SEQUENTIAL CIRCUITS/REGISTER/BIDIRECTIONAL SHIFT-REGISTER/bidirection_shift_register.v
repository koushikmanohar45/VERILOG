module bidirection_shiftregister#(parameter n=4)(input sin_l,sin_r,clk,rst,preset, input[1:0] sel,output reg [n-1:0]Q);
  always @(posedge clk) begin
    if(rst)
      Q<={n{1'b0}};
    else if(preset)
      Q<={n{1'b1}};
    else begin
      if(sel==2'b10)
        Q<={sin_r,Q[n-1:1]};//sel=10 right shift
      else if(sel==2'b01)
        Q<={Q[n-2:0],sin_l};//se=01 left shift
      else
        Q<=Q;//hold
    end
  end
 endmodule
