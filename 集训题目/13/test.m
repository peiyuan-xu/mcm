%x =0.6331 y= 2.3934 z=1.9735

clc,clear;
x0=[2;2;1];
options=optimoptions('fsolve','Display','iter');
[x,fval]=fsolve(@myfun,x0,options)