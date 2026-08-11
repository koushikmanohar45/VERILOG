`include "apb_slave.sv"

module slave_apb#(N=32,A=16)
  (
    input PCLK,
    input PRESETn,
    input [N-1:0]PWDATA, 
    input [A-5:0]PADDR,
    input PSEL,
    input PWRITE,
    input PENABLE,
    output reg PREADY,
    output reg [N-1:0]PRDATA,
    output reg PSLVERR
  );
  

  
  reg  [(2*N)-1:0] alu_out;
  reg [4:0] alu_flag;
  reg [N-1:0] operant_a;
  reg [N-1:0] operant_b;
  reg [N-1:0] opcode;
  
   alu a1(.rst_n(PRESETn),.x(operant_a),.y(operant_b),.opcode(opcode), .out(alu_out),.flag(alu_flag));        

  
 always @(posedge PCLK)begin
  if(!PRESETn)begin
      PREADY<=0;
    end
 else begin
   if(!PSEL) begin
     PRDATA<=PRDATA;
     PREADY<=1'b1;
    end
   else begin
       PREADY<=1;
     case({PENABLE,PWRITE})
       2'b10:begin
         case(PADDR)
           12'd12:PRDATA<=alu_out;
           12'd16:PRDATA<=alu_flag;
           default:PRDATA<=0;
         endcase
       end
       2'b11:
         case(PADDR)
           12'd0:operant_a<=PWDATA;
           12'd4:operant_b<=PWDATA;
           12'd8:opcode<=PWDATA;
           default:begin
             operant_a<=0;
             operant_b<=0;
             opcode<=0;
           end
         endcase
       default:PRDATA<=PRDATA;
      endcase
   end
  end
 end
         
 always @(*)begin
  if(!PRESETn)
     PSLVERR<=0;
  else if(PENABLE) begin
    if(PADDR[A-5:0]==0 || PADDR[A-5:0]==4 ||PADDR[A-5:0]==8||PADDR[A-5:0]==12 ||PADDR[A-5:0]==16)
         PSLVERR<=0;
      else
         PSLVERR<=1;
  end
  else
     PSLVERR<=0;
end
  


endmodule
