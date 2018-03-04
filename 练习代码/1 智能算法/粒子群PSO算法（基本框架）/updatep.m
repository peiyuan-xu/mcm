function [position V] = updatep(position,Vf,pbest,gbest,Vscope,Pscope,w)
%更新每个离子的位置

%先画出上次位置，图形
%hold on
%plot3(position(1,:),position(2,:),pfvalue)

%计算速度  w 惯性因子
%x方向
c1=1.49445;c2=1.49445;
%V(1,:)=Vf(1,:)+c1*rand()*(pbest(1,:)-position(1,:))+c2*rand()*(gbest(1,1)-position(1,:));
%V(2,:)=Vf(2,:)+c1*rand()*(pbest(2,:)-position(2,:))+c2*rand()*(gbest(2,1)-position(2,:));

[s,n]=size(position);
for j=1:n
    V(:,j)=w*Vf(:,j)+c1*rand()*(pbest(:,j)-position(:,j))+c2*rand()*(gbest(:,1)-position(:,j));
    V(find(V(:,j)>Vscope(1)),j)=Vscope(1);
    V(find(V(:,j)<Vscope(2)),j)=Vscope(2);
    position(:,j)=position(:,j)+0.5*V(:,j);
    position(find(position(:,j)>Pscope(1)),j)=Pscope(1);
    position(find(position(:,j)<Pscope(2)),j)=Pscope(2);

end
%更新每个离子的位置
%position(1,:)=position(1,:)+V(1,:);
%position(2,:)=position(2,:)+V(2,:);



end

