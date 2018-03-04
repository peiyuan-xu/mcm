function [index, best_roadL, ave ,road_L] = select_bestRoad(Tabu,D,m,n)
%寻找本次迭代中蚁群中最优的路径
road_L=zeros(m,1);
for i=1:m
    R=Tabu(i,:);
    for j=1:(n-1)
        road_L(i,1)=road_L(i,1)+D(R(j),R(j+1));
    end
    road_L(i,1)= road_L(i,1)+D(R(1),R(n)); 
end
best_roadL=min(road_L);
index_p=find(road_L==best_roadL); %最优路径的序号
index=index_p(1);
ave=mean(road_L);  %本次迭代后的平均距离


end

