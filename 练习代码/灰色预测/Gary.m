%灰色预测程序
y1=input('请输入数据');
n=length(y1);
y = zeros(1,n);
for i=0:n-1
   y(n-i) = y1(i+1);
end
yy=ones(n,1);
yy(1)=y(1);
%yy中存储数据的累加
for i=2:n
    yy(i)=yy(i-1)+y(i);
end
%建立数据矩阵B、YN
B=ones(n-1,2);
for i=1:(n-1)
    B(i,1)=-(yy(i)+yy(i+1))/2;
    B(i,2)=1;
end
BT=B';
for j=1:(n-1)
    YN(j)=y(j+1);
end
YN=YN';
%求解系数、INV（）求逆矩阵，为了计算参数 a 和 u
A=inv(BT*B)*BT*YN;
a=A(1);
u=A(2);
t=u/a;
t_test=input('输入需要预测的个数');
i=1:t_test+n;
%对应微分方程的解的表达式
yys(i+1)=(y(1)-t).*exp(-a.*i)+t;
yys(1)=y(1);
 for j=n+t_test:-1:2 
     ys(j)=yys(j)-yys(j-1);
 end
 x=1:n; 
 xs=2:n+t_test;
 yn=ys(2:n+t_test); 
 plot(x,y,'^r',xs,yn,'*-b');
 xlabel('时间');ylabel('GDP值');
 det=0; 
 for i=2:n 
     det=det+abs(yn(i)-y(i));
 end
 det=det/(n-1);
 disp(['百分绝对误差为:',num2str(det),'%']);
 disp(['预测值为：',num2str(ys(n+1:n+t_test))]);
 
 %计算级比
 n = length(y);
 yt=y';
 lamda = yt(1:n-1)./yt(2:n);
 rho=1-(1-0.5*a)/(1+0.5*a)*lamda'
 
 
