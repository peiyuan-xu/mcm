function [newgbest,newgF] = SelectGbest(pbest,gbest,fvalue,gbestF,Pscope)
%挑选出全局最优解
%%  ！！！！！！！！！！！2

%K=4;
%[~,pn]=size(pbest);
[sf,sfIndex]=sort(fvalue,'descend');
%sumSF=sum(sf(1:K));%生成一个总值
%cSF=sf(1:K)/sumSF; %每个离子的权重系数
%sumf=cSF.*sf(1:K);  %加权后的综合最优适应度
%newsumf=sum(sumf);
%spbest=pbest(sfIndex(1:K),:);
%newg=zeros(K,pn);
%if newsumf>gbestF  
 %   for i=1:K
  %  newg(i,:)=cSF(i)*spbest(i,:);  %新的综合最优位置
   % end
    %newgbest=sum(newg);  %求列之和，最后为行向量
    %此处，根据新的位置更新，fitness
   % newgbest= pInScope( newgbest,Pscope);
   % newgF=fitness(newgbest);
if sf(1)>gbestF 
    newgbest=pbest(sfIndex(1),:);
    newgF=fvalue(sfIndex(1),1);
else
   newgbest=gbest;
   newgF=gbestF;
end


end

