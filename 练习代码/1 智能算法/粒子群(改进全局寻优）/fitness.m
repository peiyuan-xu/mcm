function f= fitness(position )
%计算粒子群中每个个体的适应度
%假设适应度函数为墨西哥帽函数，求最大值
[m,n]=size(position);
f=zeros(m,1);
for i=1:m
%r=sqrt(position(i,1).^2+position(i,2).^2)+eps;
%f(i,1)=sin(r)./r;  %作为自适应度
x=position(i,1);y=position(i,2);
s=(x^2+y^2)^0.5;
ep=cos(2*pi*x)+cos(2*pi*y);
f(i)=sin(s)/s+exp(ep/2)-2.71289;
end

end

