% 将举证中的0 换位inf除了对角线的 
for i=1:58
    for j=1:58
        if i~=j && Dis2(i,j)==0
            Dis2(i,j)=inf;
        end
    end
end

%替换 Inf 为实数
for i=1:58
    for j=1:58
        if dEnd(i,j)==inf
            dEnd(i,j)=10000;
        end
    end
end

%求最短路径
W=sparse(Dis1);
dEnd=graphallshortestpaths(W);
