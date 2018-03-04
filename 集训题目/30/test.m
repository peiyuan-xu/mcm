%（1）用ode15i
clc,clear;
odefun=@(t,y,dy)[
-dy(1)-4*y(1)+y(1)*y(2)
-dy(2)+y(1)*y(2)-y(2)^2];

[t,y]=ode15i(odefun,[0 10],[2; 1],[-6 ;1]);
subplot(1,2,1);
plot(t,y(:,1),'- *',t,y(:,2),'- r ');
legend('x1的数值解','x2的数值解'),title('第一种方法');

%(2)
odefun2=@(t,y)[
    -4*y(1)+y(1)*y(2);
    y(1)*y(2)-y(2)^2];
[t2,y2]=ode45(odefun2,[0,10],[2;1]);
subplot(1,2,2);
plot(t2,y2(:,1),'- *',t2,y2(:,2),'- r');
legend('x1的数值解','x2的数值解'),title('第二种方法');