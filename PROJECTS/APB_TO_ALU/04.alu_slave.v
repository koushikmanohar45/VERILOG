module alu #(parameter N=32)(
  input rst_n,
  input signed [N-1:0]x,
  input signed [N-1:0]y,
  input[3:0]opcode,
  output reg signed [(2*N)-1:0]out,
  output [4:0] flag
);
  wire overflow_flag,zero_flag,valid_flag,sign_flag,NAN_flag;
  integer i;
  
  always @(*)begin
    if(!rst_n)
      out=0;
    else begin
        case(opcode)
        4'b0000:out=x+y;//add
        4'b0001:out=x-y;//sub
        4'b0010:out=x*y;//mul
        4'b0011:out=(y!=0)?x/y:0;
        4'b0100:out=(y!=0)?x%y:0;//remainder
        4'b0101:out=x+1;//incrementer
        4'b0110:out=x<<y[4:0];
        4'b0111:out=x>>y[4:0];
        4'b1000:out=x&y;//bitwise and
        4'b1001:out=x|y;//bitwise or
        4'b1010:out=x^y;//bitwise xor
        4'b1011:out=~(x&y);//bitwise nand
        4'b1100:out=~(x|y);//bitwise nor
        4'b1101:out=~(x^y);//bitwise xor
        4'b1110:out=~x; //bitwise not
        4'b1111:begin   //reverse
          for(i=0;i<N;i=i+1)
            out[i]=x[N-1-i];  
        end
        default:out=0;
      endcase   
    end
  end

  assign overflow_flag=(x[N-1]==y[N-1] && out[N-1]!=x[N-1]);
  assign zero_flag=(out==0);
  assign sign_flag=out[(2*N)-1];
  assign valid_flag=(x[N-1]==y[N-1] && out[N-1]!=x[N-1]);
  assign NAN_flag=((opcode==4'b0011||opcode==4'b1000) && y==0);
  assign flag={overflow_flag,zero_flag,sign_flag,valid_flag,NAN_flag}; 
    
 endmodule
