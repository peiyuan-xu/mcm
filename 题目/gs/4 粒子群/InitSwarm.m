function [ ParSwarm,vf] = InitSwarm( N,L,Pscope,Vscope )
%初始化离子群 粒子位置 、离子粒子历史最优、全局最优、f离子最优适应度、pf离子当前适应度
%vf 离子速度 
%输入 N群大小  L个体长度 Pscope个体每维度的范围 2*L 第2行为下限   Vscope速度范围
ParSwarm=rand(N,L);
vf=rand(N,L);
for j=1:L
    ParSwarm(:,j)=ParSwarm(:,j)*(Pscope(1,j)-Pscope(2,j))+Pscope(2,j);
    %初始化速度
    vf(:,j)=vf(:,j)*(Vscope(1,j)-Vscope(2,j))+Vscope(2,j);
end




end

