clc;clear;
dx=@(t,y,z)[-y(1)*z(2,1)+z(2,2)
    y(1)*z(2,1)-y(2)
    y(2)-z(2,2)];
his=@(t)[5;0.1;1];
sol=dde23(dx,[1,10],his,[0,40])
plot(sol.x,sol.y(1,:),'-<',sol.x,sol.y(2,:),'-o',sol.x,sol.y(3,:),'-P')
legend('x1','x2','x3'),xlabel('t'),ylabel('x');