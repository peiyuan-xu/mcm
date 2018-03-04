clc
clear
syms x;
I0=int((x.^2+2.*x+3).*exp(-2.*x),x,0,1);
I0=vpa(I0,10)
x=[0:0.1:1];
y=(x.^2+2.*x+3).*exp(-2.*x);
sp=csapi(x,y);
a=fnint(sp,1);
xx=fnval(a,[0,1]);
I1=xx(2)-xx(1);
vpa(I1,10)
