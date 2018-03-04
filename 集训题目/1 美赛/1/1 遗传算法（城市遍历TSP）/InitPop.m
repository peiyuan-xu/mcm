function Chrom = InitPop( NIND,N)
%初始化种群
%NIND 种群的大小  N 染色体的长度（城市的个数）
Chrom=zeros(NIND,N);
for i=1:NIND
    Chrom(i,:)=randperm(N);
end


end

