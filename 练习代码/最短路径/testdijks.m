%通过多次循环 dijkstral 算法求 1-8 到 9-43 的最短路径
d=inf*ones(8,35);

p=zeros(8*35,58);
for i=1:8
    for j=9:43
     [d(i,(j-8)),pe]=dijkstral(Ayuan,i,j );
     m=length(pe);
     pee=zeros(1,58);
     pee(1,1:m)=pe;
     p(i*(j-8),:)=pee;
    end
end

%此时P中存所有的路径 顶点
for i=1:58
    index=find(p==i);
    sumi=length(index);
    disp(['顶点',num2str(i),'被经过的次数为：',num2str(sumi)]);
end