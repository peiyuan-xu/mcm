function [bestindex,road_L] = select_bestRoad(PathTiaoEndNodeI,Tabu,D,m,n, PathTiao,CarEndCun)
%寻找本次迭代中蚁群中最优的路径,PathTiao  每个蚂蚁的趟数 + 每趟车的剩余
road_L=zeros(m,1);
bestGoal=10000*ones(m,1); %求低优
%趟数 
c1=0.5;c2=0.5;
%tang=length(PathTiaoEndNodeI);
%index=find(PathTiaoEndNodeI==0);
%index=index-1;
%index=index(1);
%tang=index;
tang=PathTiao-1;
%LuSumI=0;
for i=1:m   %m 个蚂蚁
    
for j=1:(n-1) %计算每趟路径值=此循环+几个到原点的距离
    qian=Tabu(i,j);
    hou=Tabu(i,j+1);
    road_L(i,1)=road_L(i,1)+D(qian,hou);
end
for j=1:tang(i)
    qian=Tabu(PathTiaoEndNodeI(i,j));
    road_L(i,1)=road_L(i,1)+D(qian,1);
end
%加上 最后一次会原点的距离
lastn=Tabu(i,n);
 road_L(i,1)= road_L(i,1)+D(lastn,1);
end
%得到 m 个蚂蚁的总路径长

%挑选最优蚂蚁先考虑  趟数最少 然后距离和车存
TPathTiao=PathTiao;
index=find(TPathTiao==min(TPathTiao));
lindex=length(index);
if lindex==1 %据此条件选最优 ，即趟数最少的
    bestindex=index;
else
    %根据 距离和车存判断
    for i=1:lindex
        antI=index(i);
    bestGoal(antI,1)=c1*road_L(antI,1)+c2*CarEndCun(antI,1);
    end
    index=find(bestGoal==min(bestGoal));
    index=index(1);
    bestindex=index;
end

    
%best_roadL=min(road_L);
%index_p=find(road_L==best_roadL); %最优路径的序号
%index=index_p(1);
%ave=mean(road_L);  %本次迭代后的平均距离


end

