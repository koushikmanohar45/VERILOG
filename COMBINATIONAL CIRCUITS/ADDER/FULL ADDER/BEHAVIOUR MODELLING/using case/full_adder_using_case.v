module full_adder_using_case (input a, b ,cin, output reg sum, carry );
   always @(*) begin
    case ({a, b, cin})
        3'd0: begin 
          sum = 0; carry = 0; 
        end
        3'd1: begin 
          sum = 1; carry = 0; 
        end
        3'd2: begin 
          sum = 1; carry = 0; 
        end
        3'd3: begin 
          sum = 0; carry = 1;
        end
        3'd4: begin
          sum = 1; carry = 0;
        end
        3'd5: begin 
          sum = 0; carry = 1;
        end
        3'd6: begin
          sum = 0; carry = 1;
        end
        3'd7: begin
          sum = 1; carry = 1;
        end
        default: begin
          sum = 0; carry = 0; 
        end
    endcase
   end
endmodule  
