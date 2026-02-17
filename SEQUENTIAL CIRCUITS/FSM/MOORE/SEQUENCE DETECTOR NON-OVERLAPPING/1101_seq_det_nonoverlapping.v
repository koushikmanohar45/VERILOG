module fsm_1101_nonoverlap_sequencedetect_moore(input clk,rst,x,output reg y);
  localparam [2:0] s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
  reg[2:0] state,nxt_state;
  always@(posedge clk or posedge rst) begin
    if (rst)
      state<=s0;
    else
      state<=nxt_state;
  end
  always @(*)begin
    case(state)
      s0:
             nxt_state= x?s1:s0;
      s1: 
             nxt_state= x?s2:s0;
      s2: 
             nxt_state= x?s2:s3;
      s3:
             nxt_state= x?s4:s0;
      s4:
             nxt_state= x?s1:s0;
      default:nxt_state=s0;
    endcase
  end
  always@(posedge clk or posedge rst) begin
    if(rst)
      y<=1'b0;
    else begin
      
      case(state)
                
        s4:y<=1;
        default:y<=0;
    endcase
    end
    end
endmodule
