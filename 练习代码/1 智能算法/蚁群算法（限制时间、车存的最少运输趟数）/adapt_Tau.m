function  new_Tau= adapt_Tau(Tau,Tabu,road_L,m,n,PathTiao)
%更新信息素,   考虑 PathTiao 运输趟数影响很大
% Q 信息素增加强度系数
%Tabu 记录生成路径
%Tau为信息素矩阵
Q=10;
P=10;
%Tmax=1000;

%% 首先信息素的蒸发
p=0.3;
Tau=(1-p)*Tau;

%%添加新的信息素
Delta_Tau=zeros(n,n);        %开始时信息素为n*n的0矩阵
for i=1:m   %m 个蚂蚁条路径
for j=1:(n-1)
    
Delta_Tau(Tabu(i,j),Tabu(i,j+1))=Delta_Tau(Tabu(i,j),Tabu(i,j+1))+Q/road_L(i)+P/PathTiao(i,1);          
%此次循环在路径（i，j）上的信息素增量
end
Delta_Tau(Tabu(i,n),Tabu(i,1))=Delta_Tau(Tabu(i,n),Tabu(i,1))+Q/road_L(i)+P/PathTiao(i,1);
%此次循环在整个路径上的信息素增量
end
new_Tau=Tau+Delta_Tau; %考虑信息素挥发，更新后的信息素

%采用最大最小痕迹浓度的限制，使算法扩散，以求全局解


end

