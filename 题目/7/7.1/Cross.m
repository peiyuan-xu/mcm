function ret= Cross( pcross,lenchrom,old_chrom,sizepop )
%本函数完成交叉操作
%pcross   交叉概率
%lenchrom  染色体的长度
%UNTITLED 以遗传算法为基础的排样中的交叉算法
%   old_chrome为父代,new_chrom为子代
%[num,length]=size(old_chrom);
num=sizepop;length=lenchrom;

chrom=zeros(num,length);
%new_chrom=zeros(num,length);
order=randperm(num);
%相当于随机选择两条染色体

for i=1:num
    chrom(i,:)=old_chrom(order(i),:);
end
new_chrom=chrom;
for i=1:2:num-1
    t=floor(rand*length)+1;
    pick=rand;
    while pick==0;
        pick=rand;
    end
    
    if pick<pcross
        %new_chrom(i:i+1,1:t)=chrom(i:i+1,1:t);
        place_1=zeros(1,length-t);  %个体一中要交叉基因在个体二中的位置
        place_2=zeros(1,length-t);  %个体二中要交叉基因在个体一中的位置
        %找到交叉基因的位置
        for j=t+1:length
            [~,col_1]=find(chrom(i+1,:)==chrom(i,j));%个体 j 基因在 下一个个体 的位置为 col_1
            [~,col_2]=find(chrom(i,:)==chrom(i+1,j));
            place_1(j-t)=col_1;
            place_2(j-t)=col_2;
        end
        rank_1=sort(place_1);  %将基因的位置进行排序，即进行了交叉，这几个基因，按照下一个个体中这几个的排列顺序
        rank_2=sort(place_2);
        %交叉基因
        for j=t+1:length
            new_chrom(i,j)  = chrom(i+1,rank_1(j-t));
            new_chrom(i+1,j) = chrom(i,rank_2(j-t));
        end
    else
        %不进行交叉
        new_chrom(i:i+1,1:t)=chrom(i:i+1,1:t);
    end
end


ret=new_chrom;
        
    

end

