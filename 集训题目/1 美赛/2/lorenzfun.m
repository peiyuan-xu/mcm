function dy=lorenzfun(t,y)
p=10;
r=28;
b=8/3;

dy=zeros(3,1);% y(1)->x y(2)->y y(3)->z
dy(1,:)=p*(-y(1)+y(2));
dy(2,:)=r*y(1)-y(2)-y(1)*y(3);
dy(3,:)=y(1)*y(2)-b*y(3);

% 第一个程序：lorenztest.m

