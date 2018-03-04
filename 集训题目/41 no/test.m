%%初始化系数矩阵

%出生率
a=[1.1,1.5,2.2,2.7,1.3]';
%存活率
b=[0.4,0.1,0.1,0.5]';
bb=diag(b);
lb=length(b);
b2=zeros(lb,1);
bb=[bb,b2];
%初始种群
x0=[10,20,30,25,15]';
L=[a';bb];

%n为迭代次数
n=100;
x=zeros(5,n);
xsum=zeros(1,n);
x(:,1)=x0;
%循环100次画出点图
for i=2:n
    x(:,i)=L*x(:,i-1);
    xsum(i)=sum(x(:,i));
end
t=1:n;
plot(t,x(1,:),'-r',t,x(5,:),'-b',t,xsum,'-.');