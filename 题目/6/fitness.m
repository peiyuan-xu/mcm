function [y pbest]= fitness(position,pbest,fvalue)
%假设适应度函数为墨西哥帽函数，求最大值
N=size(fvalue,2);
for i=1:N
    jx=(loc(:,2)-position(2,i))+(loc(:,1)-position(1,i))/sqrt(2)+sqrt(2)*(position(1,i)-loc(:,1));
    jy=(loc(:,2)-position(2,i))+(loc(:,1)-position(1,i))/sqrt(2);
    jc=[jx,jy];
    %斜坐标下监测点的坐标
    theta_y=0.32*jx.*(1+0.0004*jx).^(-1/2);
    theta_z=0.24*jx.*(1+0.0001*jx).^(-1/2);
    %扩散系数
    u=1;%风速
    height=25;%监测点高度
    qiangdu=[];
    qiangdu=position(4,i)./(2*pi*u.*theta_y.*theta_z).*exp(-jy.^2./(2*theta_y.^2).*(exp(-(height-position(i,3).^2/(2*theta_z.^2))+exp(-(height+position(i,3)).^2/(2*theta_z.^2)))));
    %各监测点的强度
    z(i)=sum((qiangdu-shice).^2);
    %残差二范数
end
    


y=fvalue;
n=length(pbest);
for i=1:n
    if z(i)>fvalue(i)  %新的位置的 自适应度 大于历史最优的
        pbest(:,i)=position(:,i);
        y(i)=z(i);
    end
end
    
end

