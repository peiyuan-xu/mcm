
function [distance,path ] = dijkstral(A,s,e )
%function [distance,path]=dijkstra1(A,s,e)
% [DISTANCE,PATH]=DIJKSTRA(A,S,E)
% returns the distance and path between the start node and the end node.
%
% A: adjcent matrix
% s: start node
% e: end node
% initialize
n=size(A,1);        % node number
D=A(s,:);           % distance vector 从原点到各个其他顶点的距离
path=[];            % path vector
visit=ones(1,n);    % node visibility是否加入 U
visit(s)=0;         % source node is unvisible
parent=zeros(1,n);  % parent node
% the shortest distance
for i=1:n-1         % BlueSet has n-1 nodes每次循环加入一个点
    temp=zeros(1,n);
    count=0;
    for j=1:n
        if visit(j) %没有在 U 中
            temp=[temp(1:count) D(j)];  %向后 依次补充 起点 到各个顶点的距离
        else
            temp=[temp(1:count) inf];   % 该顶点同在 U 中不用在考虑，所以距离 为Inf
        end
        count=count+1;
    end
    [value,index]=min(temp);  %选取 s 到此距离最短的 某点 index返回位置
    j=index; visit(j)=0;      %将该点加入 U 集
    for k=1:n              %更新最短路径
        if D(k)>D(j)+A(j,k)
            D(k)=D(j)+A(j,k);
            parent(k)=j;   %记录 K的前置顶点为  j
        end
    end
end
distance=D(e);
% the shortest distance path
if parent(e)==0, return; end  %终点 没有前置顶点则 结束
path=zeros(1,2*n);      % path preallocation
t=e; path(1)=t; count=1;  
while t~=s && t>0   % 从结束顶点 逆推 到起始点
    p=parent(t);
    path=[p path(1:count)];  %不断将path 向前补充 
    t=p; count=count+1;
end

%保证 最短路 
if count>=2*n, error(['The path preallocation length is too short.',...
        'Please redefine path preallocation parameter.']);
end
path(1)=s;  %没必要
path=path(1:count);

end

