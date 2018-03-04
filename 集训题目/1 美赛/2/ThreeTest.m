%求解三阶方程
clc,clear;
[t,yy]=ode45('lorenzfun',[0:0.01:100],[5;13;17]); %模拟t=0~100步长0.01的10001个点，初值[-1;0; 1]
x=yy(:,1);
y=yy(:,2);
z=yy(:,3);

figure(1);
plot3(x,y,z);
xlabel('x(t)'),ylabel('y(t)'),zlabel('z(t)');
