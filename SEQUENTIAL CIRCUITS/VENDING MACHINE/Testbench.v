module vending_machine_tb#(parameter a=5);
  reg clk,rst;
  reg A_1,A_2,A_3,A_4;
  reg B_1,B_2,B_3,B_4;
  reg C_1,C_2,C_3,C_4;
  reg D_1,D_2,D_3,D_4;
  reg [a-1:0] amt;
  reg [4:0] c[0:15];
  wire [a-1:0] bal;
  wire y,valid;
  vending_machine dut(.*);
  initial begin
    clk=1;
    forever #5 clk=~clk;
   end
  initial begin
    c[0]=5'd30;
    c[1]=5'd30;
    c[2]=5'd30;
    c[3]=5'd30;
    c[4]=5'd30;
    c[5]=5'd30;
    c[6]=5'd30;
    c[7]=5'd30;
    c[8]=5'd30;
    c[9]=5'd30;
    c[10]=5'd30;
    c[11]=5'd30;
    c[12]=5'd30;
    c[13]=5'd30;
    c[14]=5'd30;
    c[15]=5'd30;
  end
  initial begin
    #10 A_1=1;rst=1;amt=5'd30;
    #10 A_2=1;rst=0;A_1=0;amt=5'd15;
    #10 B_1=1;A_2=0;amt=5'd30;
    //A row 1st Column empty condition
    repeat(30)begin
      #10
      A_1=1; amt=5'd20;
    end
    #10 amt=5'd4;A_1=0;
    repeat(5)begin
      #10
      B_4=1;amt=amt+5'd2;
    end
    
    #10 D_2=1;B_1=0;amt=5'd25;
    #10 $finish;
  end
  always@(posedge clk) begin
    $display("-------------------------------------------------------------------------");
    $display("%0T PLEASE SELECT YOUR SNACKS...",$time);
   
      if(A_1) begin
            $display("YOU HAVE CHOSEN TOMATO FLAVOUR IN BINGO CHIPS (A_1)... ");
        if(c[0]<=0)
            $display("...YOUR SNACKS SELECTION IS NOW EMPTY...");
        else begin
          if(valid) begin 
            $display(" YOU HAVE TO PAY =rs.10");
            $display("AMOUNT PAID=rs.%0D",amt);
            $display("...PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
            $display("...Thankyou for choosing our service ...");
            c[0]= c[0]-1;
          end
         else
            $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
         end
      end

    else if(A_2) begin
      $display("YOU HAVE CHOOSEN CHEESE FLAVOUR IN BINGO CHIPS(A_2)... ");      
         if(c[1]<=0) 
            $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
          else begin
           if(valid) begin
            $display(" YOU HAVE TO PAID =rs.12");
            $display("AMOUNT PAID=rs.%0D",amt);
            $display("PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
            $display("Thankyou for choosing our service ...");
            c[1]=c[1]-1;
           end 
          else
            $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
      end
    end
  else if(A_3) begin
    $display("YOU HAVE CHOOSEN CHILLI FLAVOUR IN BINGO CHIPS(A_3)... ");
         if(c[2]<=0) 
             $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
         else begin
            if(valid) begin
             $display(" YOU HAVE TO PAID =rs.10");
             $display("AMOUNT PAID=rs.%0D",amt);              
             $display("PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
             $display("Thankyou for choosing our service ...");
           c[2]=c[2]-1;
          end  
         else
             $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
    end
  end
  else if(A_4) begin
    $display("YOU HAVE CHOOSEN PEPPER FLAVOUR IN BINGO CHIPS(A_4)... ");
          if(c[3]<=0) 
             $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
          else begin
            if(valid) begin
             $display(" YOU HAVE TO PAID =rs.15");
             $display("AMOUNT PAID=rs.%0D",amt);
             $display("PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
             $display("...Thankyou for choosing our service ...");
            c[3]=c[3]-1;
          end  
        else
             $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
    end
  end
  else if(B_1) begin
    $display("YOU HAVE CHOOSEN TOMATO FLAVOUR  IN LAYS CHIPS(B_1)... ");
         if(c[4]<=0) 
            $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
          else begin
            if(valid) begin
            $display(" YOU HAVE TO PAID =rs.10");
            $display("AMOUNT PAID=rs.%0D",amt);
            $display("PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
            $display("....Thankyou for choosing our service ...");
            c[4]=c[4]-1;
          end 
        else
            $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
    end
  end
  else if(B_2) begin
    $display("YOU HAVE CHOOSEN CHILLI FLAVOUR IN LAYS CHIPS(B_2)... ");
         if(c[5]<=0) 
             $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
          else begin
            if(valid) begin
             $display(" YOU HAVE TO PAID =rs.20");
             $display("AMOUNT PAID=rs.%0D",amt);
             $display("PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
             $display("...Thankyou for choosing our service ...");
            c[5]=c[5]-1;
          end  
        else
             $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
    end  
  end
  else if(B_3) begin
    $display("YOU HAVE CHOOSEN CHILLI FLAVOUR IN MADANGLE CHIPS(B_3)... ");
         if(c[6]<=0) 
             $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
          else begin
            if(valid) begin
             $display(" YOU HAVE TO PAID =rs.10");
             $display("AMOUNT PAID=rs.%0D",amt);
             $display("PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
             $display("...Thankyou for choosing our service ...");
            c[6]=c[6]-1;
          end  
        else
             $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
         end
       end
  else if(B_4) begin
    $display("YOU HAVE CHOOSEN CHEESE FLAVOUR IN MADANGLE CHIPS(B_4)... ");
         if(c[7]<=0) 
             $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
          else begin
            if(valid) begin
             $display(" YOU HAVE TO PAID =rs.5");
             $display("AMOUNT PAID=rs.%0D",amt);
             $display("PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
             $display("...Thankyou for choosing our service ...");
            c[7]=c[7]-1;
          end 
        else
            $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
    end
  end
  else if(C_1) begin
    $display("YOU HAVE CHOOSEN ORANGE JUICE(C_1)... ");
         if(c[8]<=0) 
             $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
          else begin
            if(valid) begin
             $display(" YOU HAVE TO PAID =rs.10");
             $display("AMOUNT PAID=rs.%0D",amt);
             $display("PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
             $display("...Thankyou for choosing our service ...");
            c[8]=c[8]-1;
          end 
        else
             $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
          end
       end
  else if(C_2) begin
    $display("YOU HAVE CHOOSEN SODA(C_2)... ");
         if(c[9]<=0) 
            $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
          else begin
            if(valid) begin
            $display(" YOU HAVE TO PAID =rs.12");
            $display("AMOUNT PAID=rs.%0D",amt);
            $display("PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
            $display("...Thankyou for choosing our service ...");
            c[9]=c[9]-1;
          end
        else
          $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
    end
  end
  else if(C_3)begin
    $display("YOU HAVE CHOOSEN MANGO JUICE(C_3)...");    
          if(c[10]<=0) 
            $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
          else begin
             if(valid) begin
               $display(" YOU HAVE TO PAID =rs.10");
               $display("AMOUNT PAID=rs.%0D",amt);
               $display("PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
               $display("...Thankyou for choosing our service ...");
            c[10]=c[10]-1;
           end 
          else
               $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
       end
  end
  else if(C_4)begin
    $display("YOU HAVE CHOOSEN APPLE JUICE(C_4)... ");
         if(c[11]<=0) 
              $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
         else begin
            if(valid) begin
              $display(" YOU HAVE TO PAID =rs.12");
              $display("AMOUNT PAID=rs.%0D",amt);
              $display("PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
              $display("...Thankyou for choosing our service ...");
           c[11]=c[11]-1;
           end 
          else
              $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
    end
  end
  else if(D_1)begin
    $display("YOU HAVE CHOOSEN GRAPES JUICE(D_1)... ");
         if(c[12]<=0) 
              $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
          else begin
            if(valid) begin
              $display(" YOU HAVE TO PAID =rs.10");
              $display("AMOUNT PAID=rs.%0D",amt);
              $display("PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
              $display("...Thankyou for choosing our service ...");
            c[12]=c[12]-1;
            end 
          else
              $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
        end
    end
  else if(D_2)begin
   $display("YOU HAVE CHOOSEN CHOKOCHIPS(D_2)... ");   
         if(c[13]<=0) 
              $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
         else begin
           if(valid) begin
              $display(" YOU HAVE TO PAID =rs.10");
              $display("AMOUNT PAID=rs.%0D",amt);
              $display("PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
              $display("...Thankyou for choosing our service ...");
           c[13]=c[13]-1;
            end 
          else
              $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
         end
    end
  else if(D_3) begin
    $display("YOU HAVE CHOOSEN CHAMPA JUICE(D_3)... ");    
         if(c[14]<=0) 
              $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
          else begin
            if(valid) begin
              $display(" YOU HAVE TO PAID =rs.10");
              $display("AMOUNT PAID=rs.%0D",amt);
              $display("PLEASE COLLECT YOUR BALANCE rs.%0d...",bal);
              $display("...Thankyou for choosing our service ...");
            c[14]=c[14]-1;
             end 
           else
              $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
          end
    end
  else if(D_4) begin
    $display("YOU HAVE CHOOSEN 7UP(D_4)... ");
         if(c[15]<=0) 
              $display("YOUR SNACKS SELECTION IS NOW EMPTY...");
          else begin
            if(valid) begin
              $display(" YOU HAVE TO PAID =rs.12");
              $display("AMOUNT PAID=rs.%0D",amt);
              $display("PLEASE COLLECT YOUR BALANCE rs.%0d... ",bal);
              $display("...Thankyou for choosing our service ...");
            c[15]=c[15]-1;
             end
           else
              $display("YOUR AMOUNT IS LESSER...PLEASE COLLECT IT AND PAY A VALID AMOUNT");
        end
    end
    $display("------------------------------------------------------------------");
  end
endmodule
