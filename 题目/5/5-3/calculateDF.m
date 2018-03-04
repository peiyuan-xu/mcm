%% 由频数矩阵生成DF矩阵




%选取P中频数大的前100行进行分类
[m,n]=size(P);
for i=1:m
    sumP(i)=sum(P(i,:));
end
[newp,newpindex]=sort(sumP,'descend');
L=length(newpindex);
for i=1:100
newP(i,:)=P(newpindex(i),:);
newCiInFileN(i,1)=CiAppearInFileN(newpindex(i),1);
end
[m,n]=size(newP);
%
TF=zeros(m,n);
W=zeros(m,n);
N=n; %n篇文档即个体数
for i=1:m  %每次一个关键词
    for j=1:n
        TF(i,j)=newP(i,j)*log2(N/newCiInFileN(i,1)+0.01);
      
    end
end
%归一化

for j=1:n  %每次一列
 sumX=0;
    for i=1:m
         sumX=sumX+(TF(i,j)*(log2(N/newCiInFileN(i,1)+0.01)))^2;
    end
    sumX=sqrt(sumX);
    disp(sumX);
    for k=1:m  %更新一个元素
        W(i,j)=TF(i,j)./sumX;
    end
end