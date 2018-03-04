clear;clc;
format short e
a=input(' 请输入系数a的值');
l=input(' 请输入长度 L 的值');
M=input(' 请输入将区间[0,L]等分的个数M');
ot=input(' 请输入时间增量ot 的值');
n=input(' 请输入运行次数n的值');
ox=l/M;x0=zeros(M+1,1);
for ii=1:M
x0(ii+1)=ii*ox;
end
u=sin(pi*x0/l);%t=0时u(x,t)的值  ？？？本题中t=0时，U 在X方向的值未知

%% 2 转化为求方程组问题
r=a^2*ot/(ox)^2;
for ii=1:n  %%迭代 n 次求解，取最后一次跌代
%数据的输入
B=zeros(M-1,1);%存放系数矩阵主对角线元素
A=zeros (M-2,1);%存放系数矩阵主对角线元素下方次对角线的元素
C=zeros (M-2,1);%存放系数矩阵主对角线元素上方次对角线的元素
S=zeros(M-1,1);%存放右端的常数项

for ii=1:M-2
B(ii)=1+2*r;A(ii)=-r;C(ii)=-r;
S(ii)=u(ii+1,1);
end
B(M-1)=1+2*r;S(M-1)=u(M,1);
%增加 U 的第二列并初始化为 0
u(1,2)=0;u(M+1,2)=0;
S(1,1)=S(1,1)+r*u(1,2);S(M-1,1)=S(M-1,1)+r*u(M+1,2);
%% 3 追赶法,求方程组解
S(1)=S(1)/B(1);T=B(1);k=2;
while k~=M
B(k-1)=C(k-1)/T;
T=B(k)-A(k-1)*B(k-1);
S(k)=(S(k)-A(k-1)*S(k-1))/T;
k=k+1;
end
k=1;
while k~=M-1
S(M-1-k)=S(M-1-k)-B(M-1-k)*S(M-k);
k=k+1;
end
u(2:M,2)=S;%把结果放入矩阵u中
u(:,1)=u(:,2);%过河拆桥，追赶法结果存在第一列
end
%计算精确值存放在u的第二列
for  x=0:M                %ox：微小段x  n:运行次数，即追赶法的迭代总次数
u(x+1,2)=exp(-(pi*a/l)^2*n*ot)*sin(pi*x*ox/l);
end
%计算最大相对误差
ez=zeros(M-1,1);
for ii=2:M
ez(ii-1)=abs(u(ii,1)-u(ii,2))/u(ii,2);
end
E=max(ez);
fprintf (' 最后时刻数值解与精确解分别为:\n');
disp(u);
fprintf ('差分法得到的结果与正确结果的最大相对误差为');
disp([num2str(E*100) '%']);
%画二维图比较
plot(x0,u(:,1),'r:',x0,u(:,2),'b-');
legend('数值解',' 精确解')
xlabel('x'),ylabel('u(x,t)')
title(' 最后时刻热传导问题数值解与精确解比较')