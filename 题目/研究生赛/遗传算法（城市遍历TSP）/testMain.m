%% 主函数

clc
close all
%X=[];  %城市坐标
NIND=100; %种群大小
MAXGEN=100;
Pc=0.9; %交叉概率
Pm=0.05; %变异概率
GGAP=0.9; %代沟

%D 作为时间矩阵
%D=Distance(X);
%% 需要更改的位置 1  计算天数的初始化变量
D=TcarXinJiang;
tCity=D;tPlay=Tplay;
N=size(D,1);
%

%% 1 初始化种群
Chrom=InitPop(NIND,N);
Chrom=tiaoZhengChrom(Chrom);
%画出初始路线图
DRang=[30,110];
%DrawPath(Chrom(1,:),X,DRang);
pause(0.0001)
%输出初始路线和总距离
disp('初始种群中的一个随机值：')
OutputPath(Chrom(1,:));
Rlength=PathLength(D,Chrom(1,:));
Daylength=DayLength(tCity,tPlay,Chrom(1,:));
disp(['总距离：',num2str(Rlength)]);
disp(['总天数：',num2str(Daylength)]);
disp('---------------------------------------------------------------------');

%% 2 迭代优化
gen=0;
figure;
hold on;box on
xlim([0,MAXGEN])
xlabel('代数')
ylabel('最优值')
%ObjV=PathLength(D,Chrom);  %计算路线长度
ObjV=DayLength(tCity,tPlay,Chrom);
preObjV=min(ObjV);
while gen<MAXGEN
    %计算适应度
    ObjV=DayLength(tCity,tPlay,Chrom);
    line([gen-1,gen],[preObjV,min(ObjV)]);pause(0.0001)
    preObjV=min(ObjV);
    FitnV=Fitness(ObjV);
    %% 2-1 选择  （路线越长，适应度FitnV越小）
    SelCh=Select(Chrom,FitnV,GGAP);
    %% 2-2 交叉
    SelCh=Recombin(SelCh,Pc);
    %% 2-3 变异
    SelCh=Mutate(SelCh,Pm);
    %% 2-4 逆转
    SelCh=Reverse(SelCh,D);
    %% 2-5 重插入子代的新种群
    Chrom=Reins(Chrom,SelCh,ObjV);
    %更新迭代次数
    Chrom=tiaoZhengChrom(Chrom);
    gen=gen+1;
    disp(['第 ',num2str(gen),' 代']);
end
%% 3 画出最优解路线图
ObjV=DayLength(tCity,tPlay,Chrom);
[minObjV,minInd]=min(ObjV);
%DrawPath(Chrom(minInd(1),:),X,DRang);
%输出最优解路线和总距离
disp('最优解：')
p=OutputPath(Chrom(minInd(1),:));
disp(['总天数：',num2str(ObjV(minInd(1)))]);

Rlength=PathLength(D,Chrom(minInd(1),:));
disp(['总距离：',num2str(Rlength)]);














    
    
    
    
    
    
    
    
    
    
    
    
    




















