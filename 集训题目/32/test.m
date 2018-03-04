clc;clear;
dxfun3=@(t,x)[-x(1)-x(1)*x(2)+x(2)*x(3)
    2*x(1)*x(2)-x(2)*x(3)-x(2)^2
    x(1)+2*x(2)+x(3)-1];
M=[1,0,0;0,1,0;0,0,0];
x0=[1,0.5,-1];
op=odeset('Mass',M);
[t,x]=ode15s(dxfun3,[0,30],x0,op);
plot(t,x(:,1),'- r');hold on
plot(t,x(:,2),'- y');hold on
plot(t,x(:,3),'-*');
legend('x1','x2','x3',0)