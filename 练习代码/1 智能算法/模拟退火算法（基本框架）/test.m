%% 模拟退火算法运行脚本 
clc,clear;
close all;
%%  1 变量初始化
tic
T0=1000;   %初始温度
Tend=1e-3; %终止温度
L=200; %各温度下的迭代次数
q=0.9;   %降温速率
x=[];   %各个城市的坐标
D=Distance(x);   %计算城市的距离矩阵
N=size(D,1);   %城市的个数
%解（路线）的初始化
S1=randperm(N);

%画出随机解的路径图
DrawPath(S1,X);
pause(0.0001)
%输出随机解的路径和距离
disp('初始的随机路线');
OutputPath(S1);
Rlength=PathLength(D,S1);
disp(['总距离：',num2str(Rlength)]);

%计算迭代次数的Time
Time=ceil(double(solve(['1000*(0.9)^x=',num2str(Tend)])));
count=0;   %迭代计数
Obj=zeros(Time,1);   %目标值矩阵的初始化
track=zeros(Time,N);  %每代的最优路线矩阵的初始化

%% 2 迭代 
% L 为各温度下的迭代次数
while T0>Tend
    count=count+1;
    temp=zeros(L,N+1);
    for k=1:L   %每个温度下的迭代次数
        %产生新的解
        S2=NewAnswer(S1);
        %Metropolis法则判断是否接受新的解
        [S1,R]=Metropolis(S1,S2,D,T0);
        temp(k,:)=[S1,R];   %记录下一路线及其路程
    end
    % 记录每次迭代过程中的最优路线e
    [d0,index]=min(temp(:,end));   %当前温度下的最优路线
    if count==1|| d0<Obj(count-1)  %如果当前温度下的最优路程< 上一路程，则记录当前的
        Obj(count)=d0;
    else
        Obj(count)=Obj(count-1);  %如果当前的最优路程大于上次，则记录上次的
    end
    track(count,:)=temp(index,1:end-1);   %记录当前温度的最优路线
    T0=q*T0;  %降温
    disp(['当前迭代次数为：',num2str(count)]);
end

%% 3 迭代过程图
figure
plot(1:count,Obj)
xlabel('迭代次数')
ylabel('距离')
title('优化过程')

% 最优解的路径图
DrawPath(track(end,:),X)

%输出最优解的路线图和总距离
disp('最优解')
S=track(end,:);
p=OutputPath(S);
disp(['总距离：',num2str(PathLength(D,S))]);
toc
        
        
