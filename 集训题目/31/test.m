%x y(1) x' y(2) y y(3)
clc,clear;
odefun=@(t,y,dy)[
    dy(1)-y(2);
    dy(2)*sin(dy(3))+dy(3)+y(1)*y(3);
    y(1)*dy(3)+y(1)*cos(dy(3))-y(2)*y(3)];
%求解dy0
%t0=0;
y0=[0;1;0];
%fix_y0=ones(3,1);
%dy0=[1;0;0];
%fix_dy0=[1;0;0];
%[y02,dy02]=decic(odefun,t0,y0,fix_y0,dy0,fix_dy0);

yy=@(y)y(1)*sin(y(2))+y(2);
y02=fsolve(yy,rand(2,1))
dy0=[1;y02];

[t,y]=ode15i(odefun,[0,10],y0,dy0);
plot(t,y(:,1),'- *',t,y(:,2),'- r ',t,y(:,3),'- y ');
legend('x的数值解','x’的数值解','y的数值解'),title('数值解图像');