%x =   1.0e+04 *   0.4000   1.2000   0.0000   0.0000   0.8000

clc,clear;
% A: x(1) B:x(2)
A=[-15 -20 -1 0 0;
    2 1 0 -1 0;
    2 3 0 0 -1];
B=[-275000
    20000
    36000];
Aeq=[1 1 0 0 0];
Beq=[16000];
%f=min(100*x(3)+x(4)+x(5));
c=[0 0 100 10 1];
LB=zeros(5,1);
[x faval]=linprog(c,A,B,Aeq,Beq,LB)