function ret = nonlinear(chrom,sizepop)
%调用MATLAB中的fmincon函数进行非线性寻优
for i=1:sizepop
    x=fmincon(@fun,chrom(i,:),[],[],[],[],[10 20 30 5],[30 40 70 20]);
    ret(i,:)=x';
end
end

