function [newgbest,newgF] = SelectGbest(pbest,gbest,fvalue,gbestF)
%挑选出全局最优解
K=4;
[sf,sfIndex]=sort(fvalue,'descend');
sumSF=sum(sf(1:K));
cSF=sf(1:K)/sumSF; %每个离子的权重系数
sumf=cSF.*sf(1:K);  %加权后的综合最优适应度
newsumf=sum(sumf);
spbest=pbest(sfIndex(1:K),:);
if newsumf>gbestF  
    for i=1:K
    newg(i,:)=cSF(i)*spbest(i,:);  %新的综合最优位置
    end
    newgbest=sum(newg);  %求列之和，最后为行向量
    
    newgF=newsumf;
else
   newgbest=gbest;
   newgF=gbestF;
end


end

