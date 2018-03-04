clc
clear all;
tic
%%
maxgen=50;            %迭代代数
num=50;               %种群个数
pmutation=0.01;        %变异概率
length=18;             %每个个体的基因长度
avgfitness=[];         %种群平均适应度
bestfitness=[];        %种群最佳适应度
bestchrom=[];          %试用度最好的染色体


%% 初始化种群
chrom=get_chrom(num,length);

%% 找出最好的个体,记录每一代进化的最好和平均适应度
[bestfitness,index]=max(fitness(chrom));
bestchrom=chrom(index,:);
avgfitness=sum(fitness(chrom))/num;
every_fitness(:,1)=fitness(chrom);
trance=zeros(maxgen,2);
old_chrom=chrom;
%% 进化开始
for i=1:maxgen
    %交叉
    chrom=chiasma(chrom);
    %变异
    chrom=Mutation(chrom,pmutation);
    %求适应度并找到最优染色体及其位置
%     fitness=zeros(num,1);
    [newbestfitness,newbestindex]=max(fitness(chrom));
    newbestchrom=chrom(newbestindex,:);
    newavgfitness=sum(fitness(chrom))/num;
    %代替上一次进化的最好染色体
    if newbestfitness>bestfitness
        bestfitness=newbestfitness;
        bestchrom=newbestchrom;
    end
    every_fitness(:,i+1)=fitness(chrom);
    trance(i,:)=[newbestfitness newavgfitness];%记每次进化的最好适应度和平均
    %选择
    chrom=select(old_chrom,chrom,every_fitness(:,i:i+1));
    
    old_chrom=chrom;
    disp(['第',num2str(i),'代']);
    bestchrom
end
bestfitness
bestchrom
toc
    