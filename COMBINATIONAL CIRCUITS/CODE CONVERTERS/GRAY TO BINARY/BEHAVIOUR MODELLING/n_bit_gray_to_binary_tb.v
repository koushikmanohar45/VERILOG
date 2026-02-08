module n_bit_gray_to_binary_tb;
    reg [3:0] gray;       
    wire [3:0] binary;               
    integer i;

    n_bit_gray_to_binary (#4)dut (.gray(gray),.binary(binary));

    initial begin
        $monitor("T=%0t | Gray=%b | Binary=%b", $time, gray, binary);
        for (i = 0; i < 16; i = i + 1) begin
            gray = i;  
            $display("T=%0t | Gray=%b | Binary=%b", $time, gray, binary);
            #10;  
        end
        #10;
        $finish;
    end
    initial begin
        $dumpfile("n_bit_gray_to_binary.vcd"); 
        $dumpvars(1, n_bit_gray_to_binary_tb);
    end
endmodule
