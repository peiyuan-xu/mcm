function [index, best_roadL, ave ,road_L] = select_bestRoad(PathTiaoEndNodeI,Tabu,D,m,n)
%寻找本次迭代中蚁群中最优的路径,PathTiao  每个蚂蚁的趟数
road_L=zeros(m,1);

%趟数 
%tang=length(PathTiaoEndNodeI);
index=find(PathTiaoEndNodeI==0);
index=index-1;
index=index(1);
tang=index;
%LuSumI=0;
for i=1:m   %m 个蚂蚁
    
for j=1:(n-1) %计算每趟路径值=此循环+几个到原点的距离
    qian=Tabu(j);
    hou=Tabu(j+1);
    road_L(i,1)=road_L(i,1)+D(qian,hou);
end
for j=1:tang
    qian=Tabu(PathTiaoEndNodeI(j));
    road_L(i,1)=road_L(i,1)+D(qian,1);
end
%加上 最后一次会原点的距离
lastn=Tabu(i,n);
 road_L(i,1)= road_L(i,1)+D(lastn,1);
end

    
best_roadL=min(road_L);
index_p=find(road_L==best_roadL); %最优路径的序号
index=index_p(1);
ave=mean(road_L);  %本次迭代后的平均距离


end

