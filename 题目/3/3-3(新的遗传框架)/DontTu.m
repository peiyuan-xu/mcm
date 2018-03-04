
clc
clear all
close all
%% 1 定义遗传算法参数
 
maxgen=100;            %迭代代数
num=50;               %种群个数
pmutation=0.01;        %变异概率
length=4;             %每个个体的基因长度
avgfitness=[];         %种群平均适应度
bestfitness=[];        %种群最佳适应度
bestchrom=[];          %试用度最好的染色体
fitSum=10000*ones(num,1);
Height=[10,20;20,20;30,40;5,15];

%% 2 初始化种群
for i=1:num
    for j=1:length
        chrom(i,j)=rand()*Height(j,2)+Height(j,1);
    end
end

%% 3 找出最好的个体,记录每一代进化的最好和平均适应度
for i=1:num
    fitSum(i,1)=fitness(chrom(i,:));
end
[bestfitness,index]=min(fitSum);   %chrom num*length
bestchrom=chrom(index,:);
avgfitness=sum(fitSum)/num;
every_fitness(:,1)=fitSum; 
trance=zeros(maxgen,2);
old_chrom=chrom;

%% 进化开始
for i=1:maxgen
    disp(['第 ',num2str(i),' 次迭代']);
    %交叉
    chrom=chiasma(chrom);
    %变异
    chrom=Mutation(chrom,pmutation,Height);
    %求适应度并找到最优染色体及其位置
%     fitness=zeros(num,1);
    %更新适应度
    for j=1:num
    fitSum(j,1)=fitness(chrom(j,:));
    end

    [newbestfitness,newbestindex]=min(fitSum);  %！！！！！！！
    newbestchrom=chrom(newbestindex,:);
    newavgfitness=sum(fitSum)/num;
    %代替上一次进化的最好染色体  ?????
    if newbestfitness<bestfitness
        bestfitness=newbestfitness;
        bestchrom=newbestchrom;
    end
    every_fitness(:,i+1)=fitSum;
    trance(i,:)=[newbestfitness newavgfitness];%记每次进化的最好适应度和平均
    %选择
    chrom=select(old_chrom,chrom,every_fitness(:,i:i+1));
    
    old_chrom=chrom;
    disp(['第',num2str(i),'代']);
    bestchrom
end