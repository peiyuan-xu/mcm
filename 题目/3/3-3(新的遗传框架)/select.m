function new_chrom=select(old_chrom,chrom,fitness)
%本函数对每一代种群中的染色体进行选择，已进行后面的交叉和变异
[num,~]=size(chrom);
new_chrom=old_chrom;
for i=1:num  
    if(fitness(i,1)>fitness(i,2))  %上次<
        new_chrom(i,:)=chrom(i,:);
    end
end
end