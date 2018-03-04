function new_chrome= Mutation(chrom,Prob,H)
%变异
[num,length]=size(chrom);
new_chrome=chrom;
for i=1:num
    rate=rand;
    %概率决定该循环是否变异
    if rate>Prob
        continue;
    end
    %变异过程
    index=floor(rand()*length)+1; %变异位置
    new_chrome(i,index)=rand()*H(index,2)+H(index,1);
end
end





