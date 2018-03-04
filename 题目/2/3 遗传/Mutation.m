function new_chrome= Mutation(chrom,Prob)
%变异
[num,length]=size(chrom);
new_chrome=chrom;
for i=1:num
    rate=rand;
    %概率决定该循环是否变异
    if rate>Prob
        continue;
    end
    %确定变异的区间(place(1),place(2))
    place=randperm(length);
    if place(1)>place(2)
        t=place(2);place(2)=place(1);place(1)=t;
    end
    %变异过程,即颠倒变异区间的顺序
    for j=place(1):place(2)
        new_chrome(i,j)=chrom(i,place(1)+place(2)-j);
    end
end
end





