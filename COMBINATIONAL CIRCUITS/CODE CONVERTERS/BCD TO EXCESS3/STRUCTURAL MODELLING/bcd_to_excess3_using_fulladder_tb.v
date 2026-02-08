module bcd_to_excess3_using_fulladder_tb();
    reg [3:0] bcd;
    wire [3:0] excess3;
    integer i; 
    bcd_to_excess3_using_fulladder dut (.bcd(bcd),.excess3(excess3));
    initial begin
        for (i = 0; i < 10; i ++) begin
            bcd = i;
        $display("T=%0t | Bcd=%b | Excess3=%b", $time, bcd, excess3);
            #10; 
        end
      #10
        $finish;
    end
    initial begin
        $dumpfile("bcd_to_excess3_using_fulladder.vcd");
        $dumpvars(1, bcd_to_excess3_using_fulladder_tb);
    end
endmodule
