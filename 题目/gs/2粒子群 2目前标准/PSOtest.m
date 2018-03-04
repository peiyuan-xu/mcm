clc;close all;
%% 1 初始化粒子群,假设每个离子有2的变量，即在三维情况
N=1000;L=2;
%输入参数：N:种群大小的个数 %输入参数：L：一个粒子的维数 
%输入参数：ParticleScope:一个粒子在运算中各维的范围； 
%  3维粒子的ParticleScope格式:  [x1Min,x1Max %     x2Min,x2Max % x3Min,x3Max]                                   x3Min,x3Max] % 
%输入参数：AdaptFunc：适应度函数 % 
%输出：ParSwarm初始化的粒子群 
%输出：OptSwarm粒子群当前最优解与全局最优解
ParticleScope=[23,-71;19,-75];VScope=[3,3;-3,-3];
[ParSwarm,vf]=InitSwarm(N,L,ParticleScope,VScope);
position=ParSwarm;   %保存位置信息
Vf=vf;   %记录每个离子的速度
pbest=position;    %保存每个离子历史最有位置
pfvalue=fitness(position);%记录每个离子当前的 fitness value N*1
fvalue=pfvalue;   %记录每个离子历史最优的的fitness value
%maxIndex=find(max(pfvalue)==pfvalue);maxIndex=maxIndex(1);
%gbest=position(maxIndex,:);
%gbestF=pfvalue(maxIndex,1);
%gbest=SelectGbest(pbest,gbest,fvalue,gbestF,ParticleScope);    %粒子群历史最优位置
gbest=[22,-25];gbestF=[0.9556];


%进行循环，假设最大迭代次数为10000
num=200;
%记录每次迭代的在的适应度
DieF=zeros(num,1);
for dI=1:num
    
    %% 2 计算并更新各个离子的的位置，和速度
     w=calculateW(dI,num);
    [position ,Vf]=updatep(position,Vf,pbest,gbest,VScope,ParticleScope,w);
    %% 3 更新最优位置和全局最优
    pfvalue=fitness(position);
    [pbest,fvalue,gbest,gbestF]=updateBest(position,pbest,gbest,pfvalue,fvalue,gbestF,ParticleScope);
    disp(['当前迭代次数：',num2str(dI)]);
    DieF(dI,1)=gbestF;
end
%% 4 输出结果
[~,bestYL]=CalculateYingL(gbest(1,1),gbest(1,2));
plot(DieF);
xlabel('代数');ylabel('相似度');
figure
plot(bestYL,'r');
hold on
plot(trueyL);
xlabel('时间');ylabel('影长');
legend('模拟影长','真实影长')

disp(['最优的全局最优适应度：',num2str(gbestF)]);
disp(['最优维度 w 是：',num2str(gbest(1,1))]);
disp(['最优经度 j 是：',num2str(gbest(1,2))]);

fvaluebest=max(fvalue);
pindex=find(fvaluebest==fvalue);
pindex=pindex(1);
disp(['所有个体中最优个体的最优函数值为：',num2str(fvaluebest)]);
disp(['最优维度 w 是：',num2str(position(pindex,1))]);
disp(['最优经度 j 是：',num2str(position(pindex,2))]);
disp('两影长比值');
bestYL./trueyL
disp('影长：');
bestYL

