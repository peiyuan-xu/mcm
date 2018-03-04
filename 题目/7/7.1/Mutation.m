function ret = Mutation( pmutation,lenchrom,chrom,sizepop)
%变异操作
%!!!!!!!!!!!!!!!pop当前种群的进化代数和最大进化代数信息
for i=1:sizepop
    %随机选择一个染色体进行变异
    pick=rand;
    while pick==0
        pick=rand;
    end
    %index=ceil(pick*sizepop);
    %变异概率决定该轮循环是否进行变异
    pick=rand;
    if pick>pmutation
        continue;
    end
        %变异位置
        place=randperm(lenchrom);
    if place(1)>place(2)
        t=place(2);place(2)=place(1);place(1)=t;
    end
    %变异过程,即颠倒变异区间的顺序
    newchrom=chrom(i,:);
    for j=place(1):place(2)
        newchrom(1,j)=chrom(i,place(1)+place(2)-j);
    end
    chrom(i,:)=newchrom(1,:);
      
end

ret=chrom;
end



