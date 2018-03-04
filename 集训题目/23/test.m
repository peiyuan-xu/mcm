%a =3/5   b =6/5

clc,clear;
x=sym('x');
a=sym('a');
b=sym('b');
f=a+b*x^2;
sum1=int(f,x,0,1)
f=x*(a+b*x^2);
sum2=int(f,x,0,1)
[a b]=solve('a + b/3=1','a/2 + b/4=3/5','a,b')
%[a b]=solve('sum1=1','sum2=3/5','a,b')
%对方程组进行求解