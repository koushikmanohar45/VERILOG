module gray_to_binary_using_gates_tb;
    reg [3:0] gray;       
    wire [3:0] binary;               
    integer i;

    gray_to_binary_using_gates dut (.gray(gray),.binary(binary));

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
        $dumpfile("gray_to_binary_using_gates.vcd"); 
        $dumpvars(1, gray_to_binary_using_gates_tb);
    end
endmodule
