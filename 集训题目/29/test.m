%y=dsolve('(t^2+1)*D2y-(t+2)*Dy+2*y-1=0','Dy(0)=-2','y(0)=1','t')
%解析解 无法找到
[T,Y]=ode45(@odefun,[-10,10],[1,-2]);
plot(T,Y(:,1),'-',T,Y(:,2),'-.')

