clc,clear;
%% 1 初始化参数
maxgen=10000;
sizepop=20;     %种群规模
pcross=[0.6];   %交叉概率
pmutation=[0.01]; %变异概率
%lenchrom=[1 1 1 1];  %每个变量的字符串长度，如果是浮点变量，则长度都为1
lenchrom=64;
%对染色体进行编码，假设有4 艘船初始在四个角 1 8 57 64

%% 2 个体初始化 
individuals=struct('fitness',zeros(1,sizepop),'chrom',[]);  %种群结构体
avgfitness=[];     %种群平均适应度
bestfitness=[];    %种群最佳适应度 
bestchrom=[];      %适应度最好的染色体

%初始化种群
%各个顶点距离矩阵的生成 64*64
[ZuoBiao,D]=createD();
for i=1:sizepop
    %随机生成一个种群
    individuals.chrom(i,:)=Code(lenchrom);  %随机产生染色体
    x=individuals.chrom(i,:);
    individuals.fitness(i)=fitness(x,D);
end

%找到最好的染色体
[bestfitness ,bestindex]=min(individuals.fitness);   
bestchrom=individuals.chrom(bestindex,:);   %找到最好的染色体
avgfitness=sum(individuals.fitness)/sizepop;   %染色体的平均的适应度

%记录每代进化中的最好的适应度和平均适应度
trace=[];

%% 3 进化开始
for i=1:maxgen
    disp(['第 ',num2str(i),' 次进化']);
    %选择
    individuals=Select(individuals,sizepop);
    avgfitness=sum(individuals.fitness)/sizepop;
    %交叉
    individuals.chrom=Cross(pcross,lenchrom,individuals.chrom,sizepop);
    %变异
   % pop=[i,maxgen];
    %individuals.chrom=Mutation(pmutation,lenchrom,individuals.chrom,sizepop,[i maxgen],bound);
    individuals.chrom=Mutation(pmutation,lenchrom,individuals.chrom,sizepop);
    %计算适应度
    for j=1:sizepop
        %染色体归一化
        oneChrom=individuals.chrom(j,:);
        first=oneChrom(1,1);
        index=find(oneChrom==1);
        oneChrom(1,1)=1;
        oneChrom(1,index)=first;
        individuals.chrom(j,:)=oneChrom;
       
        individuals.fitness(j)=fitness(oneChrom,D);
    end
    %找到最优染色体 及他们在种群中的位置
    [newbestfitness,newbestindex]=min(individuals.fitness);
    %代替上一次进化中最好的染色体
    if bestfitness>newbestfitness
        bestfitness=newbestfitness;
        bestchrom=individuals.chrom(newbestindex,:);
    end
    avgfitness=sum(individuals.fitness)/sizepop;  
    trace=[trace;avgfitness bestfitness];    %记录每一代进化中最好的适应度和平均适应度
    disp(['本代之前最优的个体为：',num2str(bestchrom)]);
    disp(['本代之前中最优适应度为：',num2str(bestfitness)]);
end  %进化结束