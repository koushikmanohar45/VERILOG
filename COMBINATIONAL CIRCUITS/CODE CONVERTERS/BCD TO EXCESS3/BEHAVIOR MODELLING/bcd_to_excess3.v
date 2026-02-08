module bcd_to_excess3(input [3:0] binary,output reg [3:0] excess3);
    always @(*) begin
        excess3 = bcd + 4'b0011;
    end
endmodule
