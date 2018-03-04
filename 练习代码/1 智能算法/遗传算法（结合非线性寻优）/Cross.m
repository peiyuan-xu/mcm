function ret= Cross( pcross,lenchrom,chrom,sizepop,bound )
%本函数完成交叉操作
%pcross   交叉概率
%lenchrom  染色体的长度
for i=1:sizepop           %是否进行交叉操作则由交叉概率决定
    %随机选择两个染色体进行交叉
    pick=rand(1,2);
    while prod(pick)==0
        pick=rand(1,2);
    end
    index=ceil(pick.*sizepop);
    %交叉概率决定是否进行交叉
    pick=rand;
    while pick==0
        pick=rand;
    end
    if pick>pcross
        continue;
    end
    flag=0;
    while flag==0
        %随机选择交叉的位置
        pick=rand;
        while pick==0
            pick=rand;
        end
        pos=ceil(pick.*sum(lenchrom));%随机选择进行交叉的位置
        pick=rand;   %交叉开始
        v1=chrom(index(1),pos);
        v2=chrom(index(2),pos);
        chrom(index(1),pos)=pick*v2+(1-pick)*v1;
        chrom(index(2),pos)=pick*v1+(1-pick)*v2;
        %flag1=test(lenchrom,bound,chrom(index(1),:),fcode);
        %flag2=test(lenchrom,bound,chrom(index(2),:),fcode);
        flag1=test(lenchrom,bound,chrom(index(1),:));
        flag2=test(lenchrom,bound,chrom(index(2),:));
       
        if flag1*flag2==0
            flag=0;
        else
            flag=1;   %如果两个染色体不是都可行的，则进行重新交叉
        end
    end
end
ret=chrom;
        
    

end

