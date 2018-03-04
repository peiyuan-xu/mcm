%向前差分求解边值问题
clc,clear;
h=0.1;t=1/800;
r=t/(h^2);%t/h^2
row=1/h+1;
col=3/t+1;
u=zeros(row,col);
u(:,1)=1;
for k=1:col-1
    for j=2:row-1
       u(j,k+1)=r*u(j+1,k)+(1-2*r)*u(j,k)+r*u(j-1,k);
    end
end
x=[0:h:1];
plot(x,u(:,col));