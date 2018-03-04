%% 求解f=sin(10*pi*x)/x ,x在(1,2) 的最小值
clc
clear all
close all

%1 画出函数图
figure(1);
hold on;
lb=1;ub=2;
ezplot('sin(10*pi*x)/x',[lb,ub]);
xlabel('X');
ylabel('Y');

%% 2 定义遗传算法参数
Nind=40;              %种群大小
Maxgen=20;            %最大遗传代数
Preci=20;             %个体长度
Ggap=0.95;            %代沟
px=0.7;               %交叉概率
pm=0.01;              %变异概率
trance=zeros(2,Maxgen); %寻优结果初始值
FieldD=[Preci;lb;ub;1;0;1;1];
Chrom=crtbp(Nind,Preci); %创建种群

%%优化
gen=0;
X=bs2rv(Chrom,FieldD);  %初始种群二进制到十进制
ObjV=sin(10*pi*X)./X;   %计算目标函数值

while gen<Maxgen
    FitnV=ranking(ObjV); %分配自适应度
    SelCh=select('sus',Chrom,FitnV,Ggap);   %  子代雏形
    SelCh=recombin('xovsp',SelCh,px); %交叉重组
    SelCh=mut(SelCh,pm);     %变异
    X=bs2rv(SelCh,FieldD);    %个体二进制转化为十进制
    ObjVSel=sin(10*pi*X)./X;  %计算子代个体的目标值
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %重插入，用子代更新父代种群
    X=bs2rv(Chrom,FieldD);
    gen=gen+1;      
    
    %获取没带的最优解 及其序号 ，Y最优解 I 为序号
    [Y,I]=min(ObjV);
    trance(1,gen)=X(I);  %每代最优值，X
    trance(2,gen)=Y;      %每代最优值 ，Y
end
plot(trance(1,:),trance(2,:),'bo');
xlabel('最优序号');ylabel('最优值');

hold off
%画进化图
figure(2);
plot(1:Maxgen,trance(2,:));
grid on
xlabel('遗传代数');
ylabel('解的变化');
title('进化过程');
bestY=trance(2,end);
bestX=trance(1,end);
fprintf(['最优解:\nX=',num2str(bestX),'/nY=',num2str(bestY)]);