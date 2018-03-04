%%  根据 频数和字符长度确定特征项
%通过统计候选特征项，确定maxL=109 12 9 8
%对待选特征项进行排序
maxL=109;
L=70005;
T=zeros(L,1);
for i=1:70005
    onel=length(char(sortCiKu(i,1)));
    T(i,1)=(onel/maxL)*newCif(i,1);
end

[newT,newTindex]=sort(T,'descend');  %基于sortCiKu
fHe=sum(newT);
fHe=0.7*fHe;
sum=0;
for i=1:L
    sum=sum+newT(i);
    if sum>fHe
        disp(['第 ',num2str(i),' 个位置的词']);
        disp(['截断信息量为：',num2str(newT(i))]);
        break;
    end
end
disp('完成');

%提取20 个特征项
index=newTindex(1:100,1);
teZhenCi={};
for i=1:100
    teZhenCi(i,1)=sortCiKu(index(i));
    teZhenMessage(i,1)=newT(i,1);
end
    