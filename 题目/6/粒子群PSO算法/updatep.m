function [position V] = updatep(position,Vf,pbest,gbest)
%更新每个离子的位置

%先画出上次位置，图形
%hold on
%plot3(position(1,:),position(2,:),pfvalue)

%计算速度
%x方向
V(1,:)=Vf(1,:)+2*rand()*(pbest(1,:)-position(1,:))+2*rand()*(gbest(1,1)-position(1,:));
V(2,:)=Vf(2,:)+2*rand()*(pbest(2,:)-position(2,:))+2*rand()*(gbest(2,1)-position(2,:));

V(3,:)=Vf(3,:)+2*rand()*(pbest(3,:)-position(3,:))+2*rand()*(gbest(3,1)-position(3,:));
V(4,:)=Vf(4,:)+2*rand()*(pbest(4,:)-position(4,:))+2*rand()*(gbest(4,1)-position(4,:));

%更新每个离子的位置
position(1,:)=position(1,:)+V(1,:);
position(2,:)=position(2,:)+V(2,:);

position(3,:)=position(3,:)+V(3,:);
position(4,:)=position(4,:)+V(4,:);

end

