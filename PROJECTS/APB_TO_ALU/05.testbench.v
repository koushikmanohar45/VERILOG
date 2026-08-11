module tb;
  reg PCLK,PRESETn,transfer,PWRITE;
  reg [31:0]PWDATA;
  reg [15:0]PADDR;
  wire [31:0]PRDATA;
  wire PSLVERR;
  wire [7:0]PSEL;
  wire PENABLE;

apb dut(PCLK,PRESETn,PWDATA,PADDR,transfer,PWRITE,PRDATA,PSLVERR,PSEL,PENABLE);

always #5 PCLK=~PCLK;
  task apb_write;
    input [15:0]addr;
    input [31:0]data;
    begin
      @(posedge PCLK);
      transfer=1;
      PWRITE=1;
      PADDR=addr;
      PWDATA=data;
      @(posedge PCLK);
      @(posedge PCLK);
      #1
      if(addr==0)
        $display("OPERAND A=%0d",PWDATA);
      if(addr==4)
        $display("OPERAND B=%0d",PWDATA);
      if(addr==8)
        case(PWDATA)
          4'd0:$display("UPCODE=0000:ADD");
          4'd1:$display("UPCODE=0001:SUB");
          4'd2:$display("UPCODE=0010:MUL");
          4'd3:$display("UPCODE=0011:DIV");
          4'd4:$display("UPCODE=0100:ADD");
          4'd5:$display("UPCODE=0101:ADD");
          4'd6:$display("UPCODE=0110:ADD");
          4'd7:$display("UPCODE=0111:ADD");
          4'd8:$display("UPCODE=1000:ADD");
          4'd9:$display("UPCODE=1001:ADD");
          4'd10:$display("UPCODE=1010:ADD");
          4'd11:$display("UPCODE=1011:ADD");
          4'd12:$display("UPCODE=1100:ADD");
          4'd13:$display("UPCODE=1101:ADD");
          4'd14:$display("UPCODE=1110:ADD");
          4'd15:$display("UPCODE=1111:ADD");
        //  default:$display("UPCODE ERROR!");
        endcase
    end
endtask

task apb_read;
  input [15:0]addr;
  begin
    @(posedge PCLK);
    transfer=1;
    PWRITE=0;
    PADDR=addr;
    @(posedge PCLK);
    @(posedge PCLK);
    #1;
   //display("READ ADDR=%0d DATA=%0d ",addr,PRDATA);
    
    if(addr==12)
      $display("ALU_OUT=%0D",PRDATA);
    if(addr==16)begin
      for(int i=0;i<5;i++)begin
        if(PRDATA[i]==1)begin
          if(i==0)
            $display("Overflow_flag=1");
          else if(i==1)
            $display("zero_flag=1");
          else if(i==2)
            $display("sign_flag=1");
          else if(i==3)
            $display("valid_flag=1");
          else if(i==4)
            $display("NAN_flag=1");
          else
            $display("");
        end
      end
    end
  end
endtask

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0,tb);
  PCLK=0;PRESETn=0;transfer=0;PWRITE=0;PADDR=0;PWDATA=0;
  #10 PRESETn=1;
  $display("=========================================================================");
  $display("                            APB TO ALU                                   ");
  $display("==========================================================================");
  apb_write(0,10);
  apb_write(4,5);
  apb_write(8,22);
  apb_read(12);
  apb_read(16);
  $display("=========================================================================");
  
  apb_write(8,1);
  apb_read(12);
  $display("=========================================================================");

  apb_write(8,2);
  apb_read(12);
  $display("=========================================================================");

  apb_write(8,3);
  apb_read(12);
  $display("=========================================================================");

  apb_write(8,8);
  apb_read(12);
  $display("=========================================================================");
 
  repeat(20)begin 
    apb_write(0,$random());
    apb_write(4,$random());
    apb_write(8,$urandom_range(0,15));
    apb_read(12);
    apb_read(16);
   $display("=========================================================================");
  end
  

  #50 $finish;
  end

endmodule
