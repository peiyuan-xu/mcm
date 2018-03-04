%a=10.7261  b=-0.5933  resnorm =1.1959

clc,clear;
xdata=[1 2 3 4 5 6];
ydata=[6.42 7.2 8.58 9.1 9.7 10.22];
X0=[2;3];
[x ,resnorm]=lsqcurvefit(@myfun,X0,xdata,ydata)

%»æÍ¼
plot(xdata,ydata,'r*-')
hold on
plot(xdata,myfun(x,xdata))