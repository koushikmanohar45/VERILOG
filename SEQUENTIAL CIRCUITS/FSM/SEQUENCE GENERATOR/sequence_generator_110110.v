module sequence_generator_110110(input clk,rst,output reg y);
  reg [2:0]state,nxt_state;
  localparam s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101;
  always @(posedge clk or posedge rst ) begin
    if(rst) 
      state<=s0;
     else  
         state<=nxt_state;
  end
  always@(*) begin
        case(state)
          s0:nxt_state=s1;
          s1:nxt_state=s2;
          s2:nxt_state=s3;
          s3:nxt_state=s4;
          s4:nxt_state=s5;
          s5:nxt_state=s0;
          default:nxt_state=s0;
        endcase
      end       
  always@(posedge clk or posedge rst) begin
    if(rst) begin
        y<=1'b0;
    end 
    else begin    
        case(state)
          s0:y<=1'b1;
          s1:y<=1'b1;
          s2:y<=1'b0;
          s3: y<=1'b1;
          s4: y<=1'b1;
          s5: y<=1'b0; 
          default: y<=1'b1;           
        endcase
      end
  end
endmodule  
