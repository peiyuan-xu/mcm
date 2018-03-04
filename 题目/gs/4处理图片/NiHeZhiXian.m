x=[8.9:0.05:9.35];
%x=[1:10];
y=YingL(1:10,1)';
%[a,b]=polyfit(x,y,1);
p=polyfit(x,y,2);  % 拟合出的二次函数的系数
ye=y-polyval(p,x);  % 计算误差
ye2s=sum(ye.^2); % 误差的平方和
disp(sprintf('误差的平方和=%d',ye2s));

xx=[8.9:0.05:9.55];  % 绘图用到的点的横坐标
yy=polyval(p,xx);   % 拟合曲线的纵坐标
plot(x,y,'o',xx,yy);  % 绘图，原始数据+拟合曲线
legend('原始数据','拟合曲线');  % 图示
xlabel('时间/小时');ylabel('影长/米');