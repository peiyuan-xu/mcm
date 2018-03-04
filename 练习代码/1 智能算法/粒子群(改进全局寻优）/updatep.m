function [position, V] = updatep(position,Vf,pbest,gbest,Vscope,Pscope)
%更新每个离子的位置

%先画出上次位置，图形
%hold on
%plot3(position(1,:),position(2,:),pfvalue)

%计算速度  w 惯性因子 c1自身认识，表示跟踪自己历史最优值得权重 c2社会认知，跟踪群体最优的权重
%x方向
w=0.729;c1=2;c2=2;
[n,Psize]=size(pbest);
for i=1:Psize
    V(:,i)=w*Vf(:,i)+c1*rand*(pbest(:,i)-position(:,i))+c2*rand*(gbest(1,i)-position(:,i));
end
% 保证速度在范围之内
V=vInScope(V,Vscope);
%更新每个离子的位置  r约束因子
r=1;
position=position+r.*V;
position=pInScope(position,Pscope);


end

