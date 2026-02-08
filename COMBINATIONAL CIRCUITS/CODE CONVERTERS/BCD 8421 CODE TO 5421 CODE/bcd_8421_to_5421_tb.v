module bcd_8421_to_5421_tb();
    reg  [3:0] bcd_8421;
    wire [3:0] bcd_5421;
    integer i;
    bcd_8421_to_5421 dut (.bcd_8421(bcd_8421), .bcd_5421(bcd_5421));
    initial begin  
        for (i = 0; i < 10; i = i + 1) begin
            bcd_8421 = i;
            #5;
          $display("  8421= %b    |  5421= %b", bcd_8421, bcd_5421);
        end
        $finish;
    end
  initial begin
    $dumpfile("bcd_8421_to_5421.vcd");
    $dumpvars(1,bcd_8421_to_5421_tb);
  end
endmodule
