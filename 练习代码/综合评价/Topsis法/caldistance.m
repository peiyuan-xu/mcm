function ZDistance = caldistance(Z,ZBest,ZLowst)
%计算各个对象到最优向量的距离
[m,n]=size(Z);
ZDistance=zeros(1,m);
for i=1:m
Msum=sum((ZBest-Z(i,:)).^2);
D_B=sqrt(Msum);
Minsum=sum((ZLowst-Z(i,:)).^2);
D_L=sqrt(Minsum);
CI=D_L/(D_B+D_L);

ZDistance(1,i)=CI;
end
%统计并输出结果
disp('各个对象的距离为：');disp(ZDistance);
ZD=ZDistance;
for i=1:m
    ZDmax=max(ZD);
    index=find(ZD==ZDmax);
    disp(['第',num2str(i),' 个较优对象序号为  ',num2str(index)]);
    disp(['距离为',num2str(ZDmax)]);
    ZD(index)=0;
    
end









