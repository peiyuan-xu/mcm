%价格从 2.4  
clc,clear;
% 1 通过平衡点计算 从 c1 c2 （30t,3.14）
a=1/0.8;
b=1/0.7;
xp=30;
yp=3.14;
ylow=2.4;
busum=yp-ylow;
c1=yp/(xp^a);
c2=yp*xp^b;
% 供应 y=c1*(x^a);   需求  y=c2/(x^b);
dieN=60;
pplot=zeros(2,dieN);
pplot(1,1)=xp;    %数量
pplot(2,1)=yp; %价格
yandbu=zeros(3,dieN);
% 2 进行 5次迭代 改变20%
for i=0:dieN
    % 定位
    %改变y ,重新算供应曲线
    %yg=ylow+busum*0.2*i;
    yi=i+1;
    yp=0.8*pplot(2,yi)+0.2*ylow;
    xp=pplot(1,yi);
    cg1=yp/(xp^a);
    %求新的供应曲线的交点 cg1 为供应曲线系数
    [px,py]=selectjiaodian(cg1,c2,a,b);
    %更新平衡点集
    pplot(1,yi+1)=px;
    pplot(2,yi+1)=py;
    dy=py-ylow;
    dy3=yp-py;
    yandbu(1,yi)=py;  %价格
    yandbu(2,yi)=dy;  %对应价格的补贴
    %yandbu(3,yi)=dy3;
    disp(['第 ',num2str(i+1),' 次迭代']);
end

%画图


    

