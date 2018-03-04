%Prim算法求最小生成树
%结果：各个城市加入生成树顺序为：
 %     1     4     3     2     5     6

%对应每个城市的前置顶点为：
 %    0     1     1     3     1     5
clc,clear;
n=input('输入城市的个数：');
road=input('输入各个城市的距离矩阵:');
%初始化 U TE,
U=zeros(1,n);
U(1)=1;
TE=zeros(1,n); %记录加入U 顶点的前置顶点

lowl=ones(1,n); %记录 V 中点离 U 的最短距离,第二行记录与 U 中连接的顶点
lowl=road(1,:);
lowl(1)=inf;
lowlv=ones(1,n); %记录U外的点到U最短距离 对应U中的顶点
%lowe(2,n)=ones(1,n);

lowflag=zeros(1,n);  %记录顶点是否加入到 U 中 0没加入 1已加入
lowflag(1)=1;


for i=2:n %每次循环向 U 中加入一个城市
    %寻找 离U 集中最近的点
    inde=find(lowl==min(lowl));
    index=inde(1);
    %将点 加入U ,并将该点的前置顶点加入TE
    U(i)=index;
    TE(i)=lowlv(index);
    lowl(index)=inf;
    lowflag(1,index)=1;
    %检查并更新距离
    for j=2:n
        if lowflag(1,j)==0 && lowl(1,j)>road(index,j)
            lowl(j)=road(index,j);
            lowlv(j)=index;   %更新 j 的前置顶点
        end
    end
end

disp('各个城市加入生成树顺序为：');disp(U);
disp('对应每个城市的前置顶点为：');disp(TE);

    
    
    
    