`timescale 1ns/1ps
module freq_cal();
  reg t_clk;
  reg r_clk;
  initial begin
    t_clk=0;
  forever #5  t_clk=~t_clk;
  end
  initial begin
    r_clk=0;
  forever #10  r_clk=~r_clk;
  end
  initial begin
    real t0,t1,t2,t3;
    real t_freq,r_freq;
    @(posedge r_clk);
      t0=$realtime;
    @(posedge r_clk);
      t1=$realtime;
      r_freq=1.0/((t1-t0)*1e-9);
    $display(" r_frequency= %0f",r_freq);
    @(posedge t_clk);
      t2=$realtime;
    @(posedge t_clk);
      t3=$realtime;
      t_freq=1.0/((t3-t2)*1e-9);
    $display("t_frequency=%0f",t_freq);
  end
  initial begin
    $dumpfile("freq_cal.vcd");
    $dumpvars(1,freq_cal);
    #100  $finish;
  end
endmodule
