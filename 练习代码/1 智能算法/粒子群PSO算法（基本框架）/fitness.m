function [y pbest]= fitness(position,pbest,fvalue)
%假设适应度函数为墨西哥帽函数，求最大值
%r=sqrt(position(1,:).^2+position(2,:).^2)+eps;
%z=sin(r)./r;  %作为自适应度
[s,n]=size(position);
z=zeros(1,n);
for i=1:n
%r=sqrt(position(i,1).^2+position(i,2).^2)+eps;
%f(i,1)=sin(r)./r;  %作为自适应度
x=position(1,i);y=position(2,i);
s=(x^2+y^2)^0.5;
ep=cos(2*pi*x)+cos(2*pi*y);
z(i)=sin(s)/s+exp(ep/2)-2.71289;
end

%对每次得到位置及其自适应度进行画图
plot_fitness(position,z);
y=fvalue;
n=length(pbest);
for i=1:n
    if z(i)>fvalue(i)  %新的位置的 自适应度 大于历史最优的
        pbest(:,i)=position(:,i);
        y(i)=z(i);
    end
end
    
end

