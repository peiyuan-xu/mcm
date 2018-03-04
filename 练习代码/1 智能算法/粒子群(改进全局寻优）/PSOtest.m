clear,clc;
%% 1 初始化粒子群,假设每个离子有2的变量，即在三维情况
N=1000;L=2;
%输入参数：N:种群大小的个数 %输入参数：L：一个粒子的维数 
%输入参数：ParticleScope:一个粒子在运算中各维的范围； 
%  3维粒子的ParticleScope格式:  [x1Min,x1Max %     x2Min,x2Max % x3Min,x3Max]                                   x3Min,x3Max] % 
%输入参数：AdaptFunc：适应度函数 % 
%输出：ParSwarm初始化的粒子群 
%输出：OptSwarm粒子群当前最优解与全局最优解
ParticleScope=[2,1.5;-2,-1.5];VScope=[1,0.7;-1,-0.7];
[ParSwarm,vf]=InitSwarm(N,L,ParticleScope,VScope);
position=ParSwarm;   %保存位置信息
Vf=vf;   %记录每个离子的速度
pbest=position;    %保存每个离子历史最有位置
pfvalue=fitness(position);%记录每个离子当前的 fitness value N*1
fvalue=pfvalue;   %记录每个离子历史最优的的fitness value
maxIndex=find(max(pfvalue)==pfvalue);maxIndex=maxIndex(1);
gbest=position(maxIndex,:);
gbestF=pfvalue(maxIndex,1);
gbest=SelectGbest(pbest,gbest,fvalue,gbestF);    %粒子群历史最优位置




%进行循环，假设最大迭代次数为10000
num=1;
while (num<1000)
    
    %% 2 计算并更新各个离子的的位置，和速度
    [position Vf]=updatep(position,Vf,pbest,gbest,ParticleScope,VScope);
    %% 3 更新最优位置和全局最优
    pfvalue=fitness(position);
    [pbest,fvalue,gbest,gbestF]=updateBest(position,pbest,gbest,pfvalue,fvalue,gbestF);
    num=num+1;
    disp(['当前迭代次数：',num2str(num)]);
end
%% 4 输出结果

disp(['最优X位置是：',num2str(gbest(1,1))]);
disp(['最优Y位置是：',num2str(gbest(1,2))]);
fvaluebest=max(fvalue);
disp(['最优函数值为：',num2str(fvaluebest)]);



