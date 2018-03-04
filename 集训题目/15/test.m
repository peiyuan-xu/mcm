%
clc,clear;
xdata=randint(5,2,[0,10]);
ydata=zeros(5,1);
X0=[1;1;1];
[x ,resnorm]=lsqcurvefit(@myfun,X0,xdata,ydata)

%»­Í¼,µÃ³ö x ºó
