%分段函数求积分    结果:  3.1485
clc,clear;
%syms x;
x=sym('x');
f=2+(cos(x))^2;
sum1=int(f,-1,0);
f=(exp(-(x)^2))*sin(x);
sum2=int(f,0,2);
sum=double(sum1)+double(sum2);
disp('积分结果为：');disp(sum);