module asynchronus_fifo_tb#(parameter W=8,D=32);
  parameter READ_CLK_PERIOD=20,WRITE_CLK_PERIOD=10;
  
  reg w_clk,r_clk,r_rst,w_rst,w_en,r_en;
  reg [W-1:0] d_in;
  wire [W-1:0] d_out;
  wire full,empty;
  integer i,j;
  
  asynchronus_fifo #(D,W) async(.w_clk(w_clk),.r_clk(r_clk),.w_rst(w_rst),.r_rst(r_rst),.w_en(w_en),.r_en(r_en),.data_in(d_in),.data_out(d_out),.full(full),.empty(empty));

  initial begin
    w_clk=0;
    forever #(WRITE_CLK_PERIOD/2) w_clk=~w_clk;
  end
  initial begin
    r_clk=0;
    forever #(READ_CLK_PERIOD/2) r_clk=~r_clk;
  end 
  
  initial begin
    w_rst=1;r_rst=1;w_en=1;r_en=0;d_in=7'd5;
    
    //fifo full condition
    repeat(35) begin
      @(negedge w_clk)
      w_rst=0;
      r_rst=0;
      w_en=1;
      r_en=0;
      d_in=d_in+5;
    end
    // fifo empty condition
    repeat(35) begin
      @(negedge r_clk)
      w_en=0;
      r_en=1;
    end
    repeat (32) begin
      @(negedge w_clk)
      w_en=1;
      r_en=1;
      d_in=d_in+5;
    end 
    #10 $finish;
  end
  always @(posedge w_clk) begin
    if(w_en) begin
    if(full)
        $display("%0t Can't Write FIFO is Full",$time);
      else
        $display("%0t data_in=%B",$time,d_in);
    end
  end
  always @(posedge r_clk) begin
    if(r_en) begin
    if(empty)
      $display("%0t Can't READ FIFO is Full",$time);
      else
        $display("%0t data_in=%B",$time,d_in);
    end
  end
  
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars(0,asynchronus_fifo_tb);
  end
endmodule
