function ret = Mutation( pmutation,lenchrom,chrom,sizepop,bound,pop)
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
    flag=0;
    while flag==0
        %变异位置
        pick=rand;
        while pick==0
            pick=rand;
        end
        pos=ceil(pick*sum(lenchrom));
        v=chrom(i,pos);
        v1=v-bound(pos,1);
        v2=bound(pos,2)-v;
        pick=rand;
        %变异开始
        if pick>05
            delta=v2*(1-pick^((1-pop(1)/pop(2))^2));
           chrom(i,pos)=v+delta;
        else
            delta=v1*(1-pick^((1-pop(1)/pop(2))^2));
           chrom(i,pos)=v-delta;
        end
        flag=test(lenchrom,bound,individuals.chrom(i,:));
        %当该基因符合条件是，返回 1
    end
end
ret=chrom;
end



