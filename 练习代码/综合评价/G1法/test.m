%%G1法
clc,clear;
%% 1 
n=input('输入评价的指标数：');
% 现将指标排列好，在确定各个指标之间的权数
r=input('输入各个相邻指标之间的权重：');
sum=r(1);
for i=2:(n-1)
    sum=(sum+1)*r(i);
end
w=zeros(n,1);
w(n)=(1+sum)^(-1);
for i=(n-1):-1:1
    w(i)=w(i+1)*r(i);
end
disp('评价指标的权重系数为：');disp(w);

%% 2  通过各指标的权重系统  ，计算多指标对象的综合指标