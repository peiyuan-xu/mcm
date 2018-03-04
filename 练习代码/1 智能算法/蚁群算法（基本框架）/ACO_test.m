%% 本程序为基本的蚁群算法程序，没有对其进行改进，可以解决TSP问题，输入各个城市的坐标

%% C n个城市的坐标，n×2的矩阵
%% NC_max 最大迭代次数
%% m 蚂蚁个数
%% Alpha 表征信息素重要程度的参数
%% Beta 表征启发式因子重要程度的参数
%% Rho 信息素蒸发系数
%% Q 信息素增加强度系数
%% R_best 各代最佳路线
%% L_best 各代最佳路线的长度
clc,clear;
%% 第一步，变量的初始化，开始每条边的信息量都相等
%输入城市坐标，返回城市规模N ，距离矩阵D 
[m n D C]=input_C();

%Eta 为启发因子，设为距离的倒数
Eta=1./D;
%Tau为信息素矩阵
Tau=ones(n,n); 

%Tabu 记录生成路径
Tabu=zeros(m,n);

%设置最大迭代次数
NC_max=10;
NC=1;
R_best=zeros(NC_max,n);       %各代最佳路线
L_best=inf.*ones(NC_max,1);   %各代最佳路线的长度
L_ave=zeros(NC_max,1);        %各代路线的平均长度

%%迭代实现，一群蚂蚁全体NC_max寻找食物
while NC<=NC_max
    %%第二步：将m只蚂蚁放到n个城市上
     Randpos=[];
     %Randpos=randperm(n);
     %Tabu(:,1)=(Randpos(1,1:m))';  %初始化每个蚂蚁的路径的起点
     %Randpos=[];   %随即存取
     for i=1:(ceil(m/n))
     Randpos=[Randpos,randperm(n)];
     end
Tabu(:,1)=(Randpos(1,1:m))';
     
 %%第三步：m只蚂蚁按概率函数选择下一座城市，完成各自的周游
 for j=2:n
     for i=1:m   %第i 只蚂蚁
         visited=Tabu(i,1:(j-1)); 
         J=zeros(1,(n-j+1));  
         P=J;      %确定下一访问的城市要根据信息量确定的概率
         %下面确定 蚂蚁i 未访问的城市的序号
         jn=1;
         for k=1:n   
             if length(find(visited==k))==0
                 J(jn)=k;
                 jn=jn+1;
             end
         end
         % 计算未访问城市的概率，根据ETA启发因子，Tau信息素，确定访问优先级
         % 返回蚂蚁 i 下次要去的城市
         to_visit=select_nextCity(J,visited,Eta,Tau);
         Tabu(i,j)=to_visit;  
     end
 end
 %% 第四步 记录本次迭代的最佳路线,返回是第几条蚂蚁的路线
 [n_bestRoad L_bestRoad ave road_L]=select_bestRoad(Tabu,D,m,n);
 L_best(NC,1)=L_bestRoad;   %最优长度
 R_best(NC,:)=Tabu(n_bestRoad,:); %最优路径
 L_ave=ave;
 
 %% 第五步 更新信息素
 Tau=adapt_Tau(Tau,Tabu,road_L,m,n);
 
 %%第六步，禁忌表清零，为下次迭代做准备
    Tabu=zeros(m,n);
    
   disp(['第',num2str(NC),'次迭代']);
   NC=NC+1;
end

%% 最后 输出结果
output_result(L_best,R_best,C);





















