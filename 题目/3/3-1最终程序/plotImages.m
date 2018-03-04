% 花出每层分隔处 12个月份依次每个月份温度平衡的图
figure(1);
Weng=zeros(4,12);
for i=1:12 
    for j=1:4 %每循环画出各层分隔处温度变化曲线
        index=FenHSum(j,i);
        Weng(j,i)=WenP(index,i);
    end
end

cftool(1:12,WenQ);
for i=1:4
    cftool(1:12,Weng(i,:));
end

%画出12个月份 0温度深度 的连续变化图
 figure(2);
 plot(1:12,WenZ);