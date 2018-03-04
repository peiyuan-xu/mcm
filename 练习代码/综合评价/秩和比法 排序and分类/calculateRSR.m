function [RSR,RSort] = calculateRSR( R)
%计算秩和比　RSR
[m,n]=size(R);

RSR=zeros(m,1);
%计算RSR
for i=1:m
 RSR(i,1)=sum(R(i,:))/(m*n);
end

%输出结果
Rt=RSR;
num=1;
while num<=m  %保证RSR 中的元素全部排列
    index=find(Rt==max(Rt));
    %index 可能包含多个
    inl=length(index);
    for j=1:inl
        rsx=index(j);
        RSort(rsx)=num;
        disp(['第',num2str(rsx),'序号 占第 ',num2str(num),' 次序'])
        Rt(rsx)=-inf;
    end
    num=num+inl;
   
        

end

