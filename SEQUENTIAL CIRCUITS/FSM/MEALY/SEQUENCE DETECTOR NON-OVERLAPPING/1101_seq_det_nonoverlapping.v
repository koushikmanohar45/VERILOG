module fsm_1101_nonoverlap_sequencedetect_mealy(input clk,rst,x,output reg y);
  localparam [1:0] s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
  reg[1:0] state,nxt_state;
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
             nxt_state= x?s0:s0;
      default:nxt_state=s0;
    endcase
  end
  always@(posedge clk or posedge rst) begin
    if(rst)
      y<=1'b0;
    else begin
      case(state)
        s3: begin
               if(x)
                 y<=1;
               else
                 y<=0;
             end
        default:y<=0;
    endcase
    end
    end
endmodule
