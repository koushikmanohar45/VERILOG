module universal_shiftregister#(parameter n=4)(
  input clk, rst,preset,sin_r,sin_l,
  input [n-1:0]p_in,input[1:0] sel,output reg [n-1:0]Q);
  always @(posedge clk) begin
    if(rst)
      Q<={n{1'b0}};//reset
    else if(preset)
      Q<={n{1'b1}};//preset
    else begin
      case(sel)
        2'b00:
          Q<=Q; //no change
        2'b01:
          Q<={sin_r,Q[n-1:1]};//right shift
         2'b10: 
           Q<={Q[n-2:0],sin_l};//left shift
        2'b11:
          Q<=p_in;//parallel load 
        default: Q<=Q;  
      endcase
    end
  end
 endmodule  
