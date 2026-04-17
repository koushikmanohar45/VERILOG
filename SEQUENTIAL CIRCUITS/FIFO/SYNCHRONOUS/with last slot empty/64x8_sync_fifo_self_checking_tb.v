module sync_fifo_tb();
  reg [7:0] data_in;
  reg rd_en,wt_en,clk,rst;
  wire [7:0] data_out;
  wire empty,full;

  reg [7:0] mem [63:0];
  reg [5:0] wptr,rptr;
  reg [7:0] expected;

sync_fifo dut(.*);

always #5 clk=~clk;

task write_fifo(input [7:0] din);
begin
 @(posedge clk);
 if(!full) begin
   wt_en=1; rd_en=0;
   data_in=din;
   mem[wptr]=din;
   $display("writing was sucessful,fifo not full!");
   wptr=wptr+1;
 end
  else
    $display("writing was unsucessful,fifo is empty!");
end
endtask
  
  

task read_fifo;
begin
 @(posedge clk);
 if(!empty) begin
   wt_en=0;
   rd_en=1;
   expected=mem[rptr];
   $display("Reading was sucessful,fifo not empty!");
   rptr=rptr+1;

   #1;
   if(data_out==expected)
      $display("PASS expected=%0d got=%0d",expected,data_out);
   else
      $display("FAIL expected=%0d got=%0d",expected,data_out);
 end
  else
    
    $display("Reading was unsucessful,fifo is empty!");
end
endtask
  
  

initial begin
  clk=0;rst=1; wt_en=0;rd_en=0;
 wptr=0;rptr=0;

 #20 rst=0;
  repeat(90) begin
    write_fifo($urandom); 
  end

  #1
  repeat(90) begin
   read_fifo();
  end
 #50 $finish;
end

endmodule

/*
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was sucessful,fifo not full!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
writing was unsucessful,fifo is empty!
Reading was sucessful,fifo not empty!
PASS expected=36 got=36
Reading was sucessful,fifo not empty!
PASS expected=129 got=129
Reading was sucessful,fifo not empty!
PASS expected=9 got=9
Reading was sucessful,fifo not empty!
PASS expected=99 got=99
Reading was sucessful,fifo not empty!
PASS expected=13 got=13
Reading was sucessful,fifo not empty!
PASS expected=141 got=141
Reading was sucessful,fifo not empty!
PASS expected=101 got=101
Reading was sucessful,fifo not empty!
PASS expected=18 got=18
Reading was sucessful,fifo not empty!
PASS expected=1 got=1
Reading was sucessful,fifo not empty!
PASS expected=13 got=13
Reading was sucessful,fifo not empty!
PASS expected=118 got=118
Reading was sucessful,fifo not empty!
PASS expected=61 got=61
Reading was sucessful,fifo not empty!
PASS expected=237 got=237
Reading was sucessful,fifo not empty!
PASS expected=140 got=140
Reading was sucessful,fifo not empty!
PASS expected=249 got=249
Reading was sucessful,fifo not empty!
PASS expected=198 got=198
Reading was sucessful,fifo not empty!
PASS expected=197 got=197
Reading was sucessful,fifo not empty!
PASS expected=170 got=170
Reading was sucessful,fifo not empty!
PASS expected=229 got=229
Reading was sucessful,fifo not empty!
PASS expected=119 got=119
Reading was sucessful,fifo not empty!
PASS expected=18 got=18
Reading was sucessful,fifo not empty!
PASS expected=143 got=143
Reading was sucessful,fifo not empty!
PASS expected=242 got=242
Reading was sucessful,fifo not empty!
PASS expected=206 got=206
Reading was sucessful,fifo not empty!
PASS expected=232 got=232
Reading was sucessful,fifo not empty!
PASS expected=197 got=197
Reading was sucessful,fifo not empty!
PASS expected=92 got=92
Reading was sucessful,fifo not empty!
PASS expected=189 got=189
Reading was sucessful,fifo not empty!
PASS expected=45 got=45
Reading was sucessful,fifo not empty!
PASS expected=101 got=101
Reading was sucessful,fifo not empty!
PASS expected=99 got=99
Reading was sucessful,fifo not empty!
PASS expected=10 got=10
Reading was sucessful,fifo not empty!
PASS expected=128 got=128
Reading was sucessful,fifo not empty!
PASS expected=32 got=32
Reading was sucessful,fifo not empty!
PASS expected=170 got=170
Reading was sucessful,fifo not empty!
PASS expected=157 got=157
Reading was sucessful,fifo not empty!
PASS expected=150 got=150
Reading was sucessful,fifo not empty!
PASS expected=19 got=19
Reading was sucessful,fifo not empty!
PASS expected=13 got=13
Reading was sucessful,fifo not empty!
PASS expected=83 got=83
Reading was sucessful,fifo not empty!
PASS expected=107 got=107
Reading was sucessful,fifo not empty!
PASS expected=213 got=213
Reading was sucessful,fifo not empty!
PASS expected=2 got=2
Reading was sucessful,fifo not empty!
PASS expected=174 got=174
Reading was sucessful,fifo not empty!
PASS expected=29 got=29
Reading was sucessful,fifo not empty!
PASS expected=207 got=207
Reading was sucessful,fifo not empty!
PASS expected=35 got=35
Reading was sucessful,fifo not empty!
PASS expected=10 got=10
Reading was sucessful,fifo not empty!
PASS expected=202 got=202
Reading was sucessful,fifo not empty!
PASS expected=60 got=60
Reading was sucessful,fifo not empty!
PASS expected=242 got=242
Reading was sucessful,fifo not empty!
PASS expected=138 got=138
Reading was sucessful,fifo not empty!
PASS expected=65 got=65
Reading was sucessful,fifo not empty!
PASS expected=216 got=216
Reading was sucessful,fifo not empty!
PASS expected=120 got=120
Reading was sucessful,fifo not empty!
PASS expected=137 got=137
Reading was sucessful,fifo not empty!
PASS expected=235 got=235
Reading was sucessful,fifo not empty!
PASS expected=182 got=182
Reading was sucessful,fifo not empty!
PASS expected=198 got=198
Reading was sucessful,fifo not empty!
PASS expected=174 got=174
Reading was sucessful,fifo not empty!
PASS expected=188 got=188
Reading was sucessful,fifo not empty!
PASS expected=42 got=42
Reading was sucessful,fifo not empty!
PASS expected=11 got=11
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
Reading was unsucessful,fifo is empty!
*/
