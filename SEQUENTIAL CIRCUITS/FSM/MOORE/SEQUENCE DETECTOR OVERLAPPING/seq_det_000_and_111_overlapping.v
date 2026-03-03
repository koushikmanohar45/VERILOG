module seq_det_000_or_111_overlapping
  (
    input clk,rst,x,
    output reg y
  );
  localparam [2:0] s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
  reg [2:0] st,nxt_st;
  always @(posedge clk) begin
    if(rst)
      st<=s0;
    else
      st<=nxt_st;
  end
  always @(*)begin
    nxt_st=s0;
    case(st)
      s0:
        if(x) 
             nxt_st=s3;
           else 
             nxt_st=s1;
      s1:
        if(x) 
             nxt_st=s3;
           else 
             nxt_st=s2;
      s2:begin
        if(x) 
             nxt_st=s3;
           else 
             nxt_st=s2;
      end
      s3:begin
        if(x) 
             nxt_st=s4;
         else 
             nxt_st=s1;
      end
      s4:begin
        if(x) 
             nxt_st=s4; 
        else 
             nxt_st=s1;
      end
      default: 
        nxt_st=s0;
    endcase
  end
  always @(posedge clk)begin
    y<=1'b0;
    case(st)      
      s2:begin
        if(x) 
             y<=1'b0;
           else 
          y<=1'b1;
      end
      s4:begin
        if(x) 
           y<=1'b1;
        else 
             y<=1'b0;
      end
      default: 
        y<=1'b0;
    endcase
  end
endmodule
