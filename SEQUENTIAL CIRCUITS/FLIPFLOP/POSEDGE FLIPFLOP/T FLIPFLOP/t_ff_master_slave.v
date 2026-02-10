module t_ff_master_slave(input T,clk,output Q);
wire Q_bar,Qm,Qm_bar,Sm_bar,Rm_bar,Ss_bar,Rs_bar;

nand(Sm_bar,T,Q_bar,clk);
nand(Rm_bar,T,Q,clk);
nand(Qm,Sm_bar,Qm_bar);
nand(Qm_bar,Rm_bar,Qm);
nand(Ss_bar,Qm,~clk);
nand(Rs_bar,Qm_bar,~clk);
nand(Q,Ss_bar,Q_bar);
nand(Q_bar,Rs_bar,Q);
endmodule
