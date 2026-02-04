module mux16x1_tb();
    reg [15:0]i;
    reg [3:0]s;
    reg en;
    wire y;

mux16x1 dut(.i(i),.s(s),.en(en),.y(y));
    integer k;
    initial begin
        en=1;
        i=16'b0000000011111111;
        for (k =0;k<16;k=k+1) begin
            s=k;
            #10;
            $display("en=%b s[3]=%b s[2]=%b s[1]=%b s[0]=%b || I=%b || y=%b",en, s[3],s[2],s[1],s[0],i, y);
        end

        en=0;
        s =4'd5;
        #10;
        $display("en=%b s[3]=%b s[2]=%b s[1]=%b s[0]=%b || I=%b || y=%b",en, s[3],s[2],s[1],s[0],i, y);
        $finish;
    end
    initial begin
      $dumpfile("mux16x1.vcd");
      $dumpvars(0,mux16x1_tb);
    end

endmodule
