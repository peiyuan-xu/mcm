function [ new_chrom ] = chiasma( old_chrom )
%UNTITLED 以遗传算法为基础的排样中的交叉算法
%   old_chrome为父代,new_chrom为子代
[num,length]=size(old_chrom);
chrom=zeros(num,length);
new_chrom=zeros(num,length);
order=randperm(num);
for i=1:num
    chrom(i,:)=old_chrom(order(i),:);
end
p=0.8;

for i=1:2:num-1
    t=floor(rand*length)+1;
    if  t<length && rand()<p
        new_chrom(i:i+1,1:t)=chrom(i:i+1,1:t);
        %交叉基因
        new_chrom(i,t+1:length)=chrom(i+1,t+1:length);
         new_chrom(i+1,t+1:length)=chrom(i,t+1:length);
    else
        %不进行交叉
        new_chrom(i:i+1,1:length)=chrom(i:i+1,1:length);
    end
end
end

