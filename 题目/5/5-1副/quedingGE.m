%% 统计各个词条的频数，确定截断频数
%Fsum=[];
sF=sort(Fsum,'descend');
L=length(sF);
fHe=sum(sF);
fHe=0.9*fHe;
sum=0;
for i=1:L
    sum=sum+sF(i);
    if sum>fHe
        disp(['第 ',num2str(i),' 个位置的词']);
        disp(['截断频数为：',num2str(sF(i))]);
        break;
    end
end
disp('完成');
        