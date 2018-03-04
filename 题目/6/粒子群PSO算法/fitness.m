function [y pbest]= fitness(position,pbest,fvalue)
%假设适应度函数为墨西哥帽函数，求最大值
r=sqrt(position(1,:).^2+position(2,:).^2)+eps;
z=sin(r)./r;  %作为自适应度

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

