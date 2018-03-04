function len = PathLength( D,Chrom )
%计算个体的路线长度
%Chrom  路线
[row,col]=size(D);
NIND=size(Chrom,1);  %种群大小
len=zeros(NIND,1);
for i=1:NIND
    p=[Chrom(i,:) Chrom(i,1)];
    i1=p(1:end-1);
    i2=p(2:end);
    %计算出路线的距离
    len(i,1)=sum(D((i1-1)*col+i2));
end


end

