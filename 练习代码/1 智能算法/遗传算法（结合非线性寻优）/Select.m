function ret  = Select(individuals,sizepop)
%采用轮盘赌法
%本函数对每一代种群中的染色体进行选择，以进行后面的交叉和变异
% opts ：选择方法的选择
% ret  :经过选择后的种群
%%   !!!!!!!!高优指标   和 低优指标
individuals.fitness=1./(individuals.fitness);
sumfitness=sum(individuals.fitness);
sumf=individuals.fitness./sumfitness;
index=[];
for i=1:sizepop   %转 sizepop 次轮盘
    pick=rand;
    while pick==0
        pick=rand;
    end
    for j=1:sizepop
        pick=pick-sumf(j);
        if pick<0
            index=[index j];
            break;  %寻找落入区间的染色体，其次选择为 j 
        end
    end
end
individuals.chrom=individuals.chrom(index,:);
%这里以前是
%individuals.fitness=individuals.fitness(index);
individuals.fitness=1./individuals.fitness(index);
ret=individuals;

end

