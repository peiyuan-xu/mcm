function chrom = get_chrom(num,length )
%³õÊ¼»¯Áã¼şË³Ğò
chrom=zeros(num,length);
for i=1:num
    chrom(i,:)=randperm(length);
end
end

