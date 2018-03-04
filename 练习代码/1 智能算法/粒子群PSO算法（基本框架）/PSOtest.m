clear,clc;
%% 1 初始化粒子群,假设每个离子有2的变量，离子的维度和那个相反
N=input('输入初始粒子群的个数');
position(1,:)=4*rand(1,N)-2;   %保存位置信息
position(2,:)=3*rand(1,N)-1.5;
pbest=zeros(2,N);    %保存每个离子历史最有位置
gbest=zeros(2,1);    %粒子群历史最优位置
fvalue=zeros(1,N);   %记录每个离子历史最优的的fitness value
pfvalue=zeros(1,N);%记录每个离子当前的 fitness value
Vf=rand(2,N);   %记录每个离子的速度
Vscope=[0.5,-0.5];Pscope=[2,-2];
%进行循环，假设最大迭代次数为10000
num=1000;
for dI=1:num
    %对每个离子计算fitness value
    %% 2 检查并更新每个离子的历史最优位置pbest
    [fvalue pbest]=fitness(position,pbest,fvalue);
    
    %选出粒子群中最优的历史位置
    gbest=selectgbest(fvalue,pbest);
    
    %计算并更新各个离子的的位置，和速度
    w=calculateW(dI,num);
    [position Vf]=updatep(position,Vf,pbest,gbest,Vscope,Pscope,w);
    
    disp(['当前迭代次数：',num2str(dI)]);
end
%对最后一次进行更新，更新最优位置
 [fvalue pbest]=fitness(position,pbest,fvalue);
 gbest=selectgbest(fvalue,pbest);

disp(['最优X位置是：',num2str(gbest(1,1))]);
disp(['最优Y位置是：',num2str(gbest(2,1))]);
fvaluebest=max(fvalue);
disp(['最优函数值为：',num2str(fvaluebest)]);



